% SI units unless otherwise stated

clc;
clear all;
close all;

fprintf('\nHAV simulation controls\n');
fprintf('(w) Elevators down\n');
fprintf('(a) Differential elevators (left) \n');
fprintf('(s) Elevators up\n');
fprintf('(d) Differential elevators (right)\n');
fprintf('(r) Throttle up\n');
fprintf('(f) Throttle down\n');
fprintf('(q) Rudder left\n');
fprintf('(e) Rudder right\n');

%% Global variables
%-------------------------------------------------------------
global g simulation_status delta_ref t simulation_initial_condition;

%% Constants
%-------------------------------------------------------------
g=9.80665;

%% Hybrid air vehicle
%-------------------------------------------------------------

fprintf('\nLoading HAV...\n');

hybrid_air_vehicle;

%% Clearing Control Input Files

delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/a_out.txt';
delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/d_out.txt';
delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/q_out.txt';
delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/e_out.txt';
delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/r_out.txt';
delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/f_out.txt';
delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/w_out.txt';
delete '/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/s_out.txt';

%% Simulation initial conditions
%-------------------------------------------------------------
zf0=0;
V_inf=0;
phi0=0;
gamma0=0;

fprintf('\nHAV simulation intial conditions\n\n');
fprintf('(1) Steady level flight\n');
fprintf('(2) Steady coordinated turn\n');
fprintf('(3) Climb/descend\n');
fprintf('(4) Takeoff\n');
fprintf('(5) Demo\n');

simulation_initial_condition=str2num(input('\nEnter HAV simulation intial condition (1/2/3/4):','s'));

if simulation_initial_condition==1 || simulation_initial_condition==2 || simulation_initial_condition==3 || simulation_initial_condition==5 || simulation_initial_condition == 6
  
    
   if simulation_initial_condition==5 
       %zf0=-50;  %Accel-Decel
       zf0=-35.3; %Climb-Descend
       %zf0=-347; %Transient Turn
       V_inf=25.52;  %cruise velocity
       
   elseif simulation_initial_condition == 6
       
       zf0 = -50;
       V_inf = 0;
       
   else 
       
        zf0=-abs(str2num(input('\nAltitude (m):','s')));
        V_inf=str2num(input('\nAirspeed (m/s):','s'));

        if simulation_initial_condition==2

            R=str2num(input('\nTurn radius (m):','s'));
            
            phi0=atan(V_inf^2*cos(gamma0)/(g*R));

        end

        if simulation_initial_condition==3

            gamma0=degtorad(str2num(input('\nFlight path angle (deg):','s')));
        end
       
        
        fprintf('\nTrimming HAV\n');
        
    
   end
   
   [s0,s_t0,delta0]=trim(hav,V_inf,phi0,gamma0,zf0);
    
else
    V_inf=0;
    s0=[0 0 0 0 0 0 0 0 0 0 0 0];
    s_t0=[0 0 0 0 0 0 0 0 0 0 0 0];
    delta0=[0 0 0 0 0];
    %delta0=[0 0 0 0 0];
end

%% Simulation settings
%-------------------------------------------------------------
fprintf('\nHAV Simulation setup...\n');

simulation_stepsize=0.02;
simulation_end_time=1000;
simulation_sample_time=0.04;
simulation_iteration=0;
simulation_status=1;
simulation_states_log_file='hav.log';

%% Simulation states
%-------------------------------------------------------------

s=s0;

delta=delta0;
delta_ref=delta0;

%% Simulation state derivatives
%-------------------------------------------------------------
s_t=s_t0;

%% Simulation states log
%-------------------------------------------------------------
s_out=fopen(simulation_states_log_file,'w');

%% Simulation graphical user interface
%-------------------------------------------------------------
fprintf('\nSimulation gui setup...\n');

graphical_user_interface;

% Simulation loop
%-------------------------------------------------------------

fprintf('\nSimulation starting...\n');
t=0;
simulation_stepsize_tic=tic;
simulation_stepsize_toc=0;
simulation_sample_tic=tic;
simulation_sample_toc=0;

while t<=simulation_end_time
    
    if simulation_status == 1
        
        simulation_stepsize_toc=toc(simulation_stepsize_tic); 

        if simulation_stepsize_toc >= simulation_stepsize
            
            simulation_stepsize_tic=tic;

            %% Controls
            %-------------------------------------------------------------

            delta(1)=control(delta(1),delta_ref(1),1,0.5,2,simulation_stepsize);
            delta(2)=control(delta(2),delta_ref(2),degtorad(20),0.1,0.8,simulation_stepsize);
            delta(3)=control(delta(3),delta_ref(3),degtorad(20),0.1,0.8,simulation_stepsize);
            delta(4)=control(delta(4),delta_ref(4),degtorad(20),0.1,0.8,simulation_stepsize);
            %delta(5)=control(delta(5),delta_ref(5),1,0.5,2,simulation_stepsize);

            %% International standard atmosphere
            %-------------------------------------------------------------
            [P_inf,T_inf,a_inf,rho_inf] = international_standard_atmosphere(abs(s(12)));

            %% Incidence and airspeed
            %-------------------------------------------------------------
            [alpha,beta,V_inf] = incidence_sideslip_and_airspeed(s(1),s(2),s(3));
            
            %% Dynamic pressure
            %-------------------------------------------------------------
            q_inf=dynamic_pressure(V_inf,rho_inf);

            %% Mach number
            %-------------------------------------------------------------
            M_inf=mach_number(V_inf,a_inf);

            %% Aerodynamic coefficients
            %-------------------------------------------------------------
            [CX,CY,CZ,Cl,Cm,Cn]=aerodynamic_coefficients(s,hav,V_inf,delta(2),delta(3),delta(4));
          
            %% Aerodynamic forces and moments
            %-------------------------------------------------------------
            [X,Y,Z,l,m,n]=aerodynamic_forces_and_moments(hav,CX,CY,CZ,Cl,Cm,Cn,q_inf);
            
            %% Aerostatic forces and moments
            %-------------------------------------------------------------
          
            [Fxb_ast,Fyb_ast,Fzb_ast,Mxb_ast,Myb_ast,Mzb_ast]=aerostatic_forces_and_moments(s,hav);
                        
            %% Propulsion forces and moments
            %-------------------------------------------------------------
            [Fxb_prop,Fyb_prop,Fzb_prop,Mxb_prop,Myb_prop,Mzb_prop]=propulsion_forces_and_moments(s,hav,V_inf,rho_inf,delta(2),delta(3),delta(4),delta(1),delta(1),delta(1),delta(1),delta(1));
                        
            %% Sum forces and moments
            %-------------------------------------------------------------
            Fxb=X+Fxb_ast+Fxb_prop;
            Fyb=Y+Fyb_ast+Fyb_prop;
            Fzb=Z+Fzb_ast+Fzb_prop;
            Mxb=l+Mxb_ast+Mxb_prop;
            Myb=m+Myb_ast+Myb_prop;
            Mzb=n+Mzb_ast+Mzb_prop;
            
            %% Equations of motion 6dof
            %-------------------------------------------------------------
            s_t = equations_of_motion_6dof(s,s_t,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb);

            %% Equations of motion numeric integration
            %-------------------------------------------------------------
            s=numeric_integration('rk4',simulation_stepsize_toc,s,s_t,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb);

            t=t+simulation_stepsize_toc;
            simulation_iteration = simulation_iteration+1;
            
            if s(12) > 0
                s(3)=0;
                s(12)=0;
            end
 
        end
        
        %% Sampling
        %-------------------------------------------------------------
        simulation_sample_toc=toc(simulation_sample_tic);

        if simulation_sample_toc >= simulation_sample_time

            fprintf(s_out,'%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f,%0.4f\n',t,s(1),s(2),s(3),s(4),s(5),s(6),s(7),s(8),s(9),s(10),s(11),s(12));

             simulation_sample_tic=tic;

            t_out=[t_out(2:end) t];
            x_out=[x_out(2:end) s(10)];
            y_out=[y_out(2:end) s(11)]; 
            z_out=[z_out(2:end) s(12)];

            set(trajectory_plot,'XData', x_out, 'YData', y_out,'ZData',z_out);
            set(roll_plot,'YData',[radtodeg(s(7)) radtodeg(s(7))]);
            set(pitch_plot,'YData',[radtodeg(s(8)) radtodeg(s(8))]);
            set(yaw_plot,'XData',[radtodeg(s(9)) radtodeg(s(9))]);
            set(alpha_plot,'YData',[radtodeg(alpha) radtodeg(alpha)]);
            set(beta_plot,'YData',[radtodeg(beta) radtodeg(beta)]);
            set(velocity_plot,'YData',[V_inf V_inf]);
            set(altitude_plot,'YData',[abs(s(12)) abs(s(12))]);

            hav_vertices_new(:,1)=hav_vertices(:,1)+s(10)-92/2;
            hav_vertices_new(:,2)=hav_vertices(:,2)+s(11)-45/2;
            hav_vertices_new(:,3)=-hav_vertices(:,3)+s(12)+2;

            earth_vertices_new(:,1)=earth_vertices(:,1)+s(10);
            earth_vertices_new(:,2)=earth_vertices(:,2)+s(11);

            set(hav_plot,'vertices',hav_vertices_new);
            set(earth_plot,'vertices',earth_vertices_new);

            rotate(hav_plot,[1 0 0],radtodeg(s(7)),[s(10) s(11) s(12)]);
            rotate(hav_plot,[0 1 0],radtodeg(s(8)),[s(10) s(11) s(12)]);
            rotate(hav_plot,[0 0 1],radtodeg(s(9)),[s(10) s(11) s(12)]);

            set(trajectory_plot.Parent,'XLim',[min(x_out)-100,max(x_out)+100]);
            set(trajectory_plot.Parent,'YLim',[min(y_out)-100,max(y_out)+100]);
            set(trajectory_plot.Parent,'ZLim',[min(z_out)-100,max(z_out)+100]);

            set(roll_plot.Parent,'YLim',[radtodeg(s(7))-10,radtodeg(s(7))+10]);
            set(pitch_plot.Parent,'YLim',[radtodeg(s(8))-10,radtodeg(s(8))+10]);
            set(yaw_plot.Parent,'XLim',[radtodeg(s(9))-10,radtodeg(s(9))+10]);
            set(alpha_plot.Parent,'YLim',[radtodeg(alpha)-10,radtodeg(alpha)+10]);
            set(beta_plot.Parent,'YLim',[radtodeg(beta)-10,radtodeg(beta)+10]);
            set(altitude_plot.Parent,'YLim',[abs(s(12))-100,abs(s(12))+100]);
            set(velocity_plot.Parent,'YLim',[V_inf-10,V_inf+10]);

            set(time_display, 'String',sprintf('%0.4f s',t));
            set(additional_display, 'String',sprintf('delta_t_ref %0.4f | delta_a_ref %0.4f rad | delta_e_ref %0.4f rad | delta_r_ref %0.4f rad',(delta_ref(1)),2*(delta_ref(2)-(delta_ref(2)+delta_ref(3))/2),(delta_ref(2)+delta_ref(3))/2,delta_ref(4)));

            drawnow;
        end
            
    else
        break;
    end

end    

fprintf('\nSimulation finished!\n');
fprintf('\nPlotting simulation states...\n');
states(simulation_states_log_file,[1 4 6 7]);

