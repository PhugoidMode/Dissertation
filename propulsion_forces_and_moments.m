%% Buoyancy force and moment
%% SI units unless otherwise stated.

function [Fxb_prop,Fyb_prop,Fzb_prop,Mxb_prop,Myb_prop,Mzb_prop]=propulsion_forces_and_moments(s,hav,V_inf,rho_inf,delta_el,delta_er,delta_r,delta_tflt,delta_tfrt,delta_talt,delta_tart,delta_tbt)

    global simulation_initial_condition;
    %
    % Thrusters thrust
    %--------------------------------------------------------
    
    T_flt=sign(delta_tflt)*thruster_thrust(hav.Pft,hav.eta_ft,hav.Aft,abs(delta_tflt),V_inf,rho_inf);
    T_frt=sign(delta_tfrt)*thruster_thrust(hav.Pft,hav.eta_ft,hav.Aft,abs(delta_tfrt),V_inf,rho_inf);
    T_alt=sign(delta_talt)*thruster_thrust(hav.Pat,hav.eta_at,hav.Aat,abs(delta_talt),V_inf,rho_inf);
    T_art=sign(delta_tart)*thruster_thrust(hav.Pat,hav.eta_at,hav.Aat,abs(delta_tart),V_inf,rho_inf);
    T_bt=bowthruster_thrust(hav,rho_inf,delta_tbt); 

        %
        % Forward thrusters 
        %--------------------------------------------------------
        
        if V_inf >= 1
            %
            % Forward left thruster
            %--------------------------------------------------------

            Fxb_flt=T_flt*cos(hav.theta_ft);
            Fyb_flt=0;
            Fzb_flt=-T_flt*sin(hav.theta_ft);
            
           
            %
            % Forward right thruster
            %--------------------------------------------------------

            Fxb_frt=T_frt*cos(hav.theta_ft);
            Fyb_frt=0;
            Fzb_frt=-T_frt*sin(hav.theta_ft);
        else
            %
            % Forward left thruster
            %--------------------------------------------------------

            Fxb_flt=T_flt*cos(-3*delta_el);
            Fyb_flt=0;
            Fzb_flt=-T_flt*sin(-3*delta_el);
            
           
            %
            % Forward right thruster
            %--------------------------------------------------------

            Fxb_frt=T_frt*cos(-3*delta_er);
            Fyb_frt=0;
            Fzb_frt=-T_frt*sin(-3*delta_er);
        end

        %
        % Aft thrusters
        %--------------------------------------------------------
        
        if V_inf >= 1
            %
            % Aft left thruster
            %--------------------------------------------------------
            Fxb_alt=T_alt;
            Fyb_alt=0;
            Fzb_alt=0;
            
            %
            % Aft right thruster
            %--------------------------------------------------------
            Fxb_art=T_art;
            Fyb_art=0;
            Fzb_art=0;
        else
            %
            % Aft left thruster
            %--------------------------------------------------------
            Fxb_alt=T_alt*cos(3*delta_el)*cos(3*delta_r);
            Fyb_alt=T_alt*cos(3*delta_el)*sin(3*delta_r);
            Fzb_alt=-T_alt*sin(3*delta_el);
            
            %
            % Aft right thruster
            %--------------------------------------------------------
            Fxb_art=T_art*cos(3*delta_er)*cos(3*delta_r);
            Fyb_art=T_art*cos(3*delta_er)*sin(3*delta_r);
            Fzb_art=-T_art*sin(3*delta_er);
        end    
        %
        % Bow Thruster
        %--------------------------------------------------------
        
        Fxb_bt=0;
        Fyb_bt=T_bt;
        Fzb_bt=0;
    
    Fxb_prop=Fxb_flt+Fxb_frt+Fxb_alt+Fxb_art+Fxb_bt;
    Fyb_prop=Fyb_flt+Fyb_frt+Fyb_alt+Fyb_art+Fyb_bt;
    Fzb_prop=Fzb_flt+Fzb_frt+Fzb_alt+Fzb_art+Fzb_bt;
    
    Mxb_prop=hav.yftl*Fzb_flt-hav.zftl*Fyb_flt+hav.yftr*Fzb_frt-hav.zftr*Fyb_frt+hav.yatl*Fzb_alt-hav.zatl*Fyb_alt+hav.yatr*Fzb_art-hav.zatr*Fyb_art+hav.ybt*Fzb_bt-hav.zbt*Fyb_bt;
    Myb_prop=hav.zftl*Fxb_flt-hav.xftl*Fzb_flt+hav.zftr*Fxb_frt-hav.xftr*Fzb_frt+hav.zatl*Fxb_alt-hav.xatl*Fzb_alt+hav.zatr*Fxb_art-hav.xatr*Fzb_art+hav.zbt*Fxb_bt-hav.xbt*Fzb_bt;
    Mzb_prop=hav.xftl*Fyb_flt-hav.yftl*Fxb_flt+hav.xftr*Fyb_frt-hav.yftr*Fxb_frt+hav.xatl*Fyb_alt-hav.yatl*Fxb_alt+hav.xatr*Fyb_art-hav.yatr*Fxb_art+hav.xbt*Fyb_bt-hav.ybt*Fxb_bt;

    if simulation_initial_condition == 6
        
        T_h_alt = 3014.7;
        T_h_art = 3014.7;
        T_h_flt = 2762.8;
        T_h_frt = 2762.8;
        delta_b = -84.9;
        delta_e = -45;
        
        Fxb_prop = -((T_h_flt+T_h_frt)*cosd(delta_b))+((T_h_alt+T_h_art)*cosd(delta_e));
        Fyb_prop = 0;
        Fzb_prop = -((T_h_flt+T_h_frt)*sind(delta_b))-((T_h_alt+T_h_art)*sind(delta_e));
        
        Mxb_prop= 0; %hav.yftl*T_h_flt*sind(delta_b)-hav.zftl*T_h_flt+hav.yftr*T_h_frt*sind(delta_b)-hav.zftr*T_h_frt+hav.yatl*T_h_alt*sind(delta_e)-hav.zatl*T_h_alt+hav.yatr*T_h_art*sind(delta_e)-hav.zatr*T_h_art+hav.ybt*Fzb_bt-hav.zbt*Fyb_bt;
        Myb_prop= 0; %hav.zftl*T_h_flt*cosd(delta_b)-hav.xftl*T_h_flt*sind(delta_b)+hav.zftr*T_h_frt*cosd(delta_b)-hav.xftr*T_h_frt*sind(delta_b)+hav.zatl*T_h_alt*cosd(delta_e)-hav.xatl*T_h_alt*sind(delta_e)+hav.zatr*T_h_art*cosd(delta_e)-hav.xatr*T_h_art*sind(delta_e)+hav.zbt*Fxb_bt-hav.xbt*Fzb_bt;
        Mzb_prop= 0; %hav.xftl*T_h_flt-hav.yftl*T_h_flt*cosd(delta_b)+hav.xftr*T_h_frt-hav.yftr*T_h_frt*cosd(delta_b)+hav.xatl*T_h_alt-hav.yatl*T_h_alt*cosd(delta_e)+hav.xatr*T_h_art-hav.yatr*T_h_art*cosd(delta_e)+hav.xbt*Fyb_bt-hav.ybt*Fxb_bt;
        
    end 
    
    if isnan(Fxb_prop)
       Fxb_prop=0;
    end

    if isnan(Fyb_prop)
       Fyb_prop=0;
    end

    if isnan(Fzb_prop)
       Fzb_prop=0;
    end

    if isnan(Mxb_prop)
       Mxb_prop=0;
    end

    if isnan(Myb_prop)
       Myb_prop=0;
    end

    if isnan(Mzb_prop)
       Mzb_prop=0;
    end

end