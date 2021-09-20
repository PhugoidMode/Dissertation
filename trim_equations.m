function [s,s_t] = trim_forces_and_moments(s,s_t_old,hav,V_inf)

s(1)=V_inf*sqrt(1/(1+(tan(s(13)))^2));
s(2)=V_inf*sin(s(14));
s(3)=s(1)*tan(s(13));
s(8)=s(19)+atan(cos(s(7))*tan(s(13)));

%% hav.International standard atmosphere
%-------------------------------------------------------------
[P_inf,T_inf,a_inf,rho_inf] = international_standard_atmosphere(abs(s(12)));
            
%% Dynamic pressure
%-------------------------------------------------------------
q_inf=dynamic_pressure(V_inf,rho_inf);

%% Aerodynamic coefficients
%-------------------------------------------------------------
[CX,CY,CZ,Cl,Cm,Cn]=aerodynamic_coefficients(s,hav,V_inf,s(16),s(17),s(18));

%% Aerodynamic forces and moments
%-------------------------------------------------------------
[X,Y,Z,l,m,n]=aerodynamic_forces_and_moments(hav,CX,CY,CZ,Cl,Cm,Cn,q_inf);

%% Aerostatic forces and moments
%-------------------------------------------------------------
[Fxb_ast,Fyb_ast,Fzb_ast,Mxb_ast,Myb_ast,Mzb_ast]=aerostatic_forces_and_moments(s,hav);

%% Propulsion forces and moments
%-------------------------------------------------------------
[Fxb_prop,Fyb_prop,Fzb_prop,Mxb_prop,Myb_prop,Mzb_prop]=propulsion_forces_and_moments(s,hav,V_inf,rho_inf,s(16),s(17),s(18),s(15),s(15),s(15),s(15),0);

%% Sum forces and moments
%-------------------------------------------------------------
Fxb=X+Fxb_ast+Fxb_prop;
Fyb=Y+Fyb_ast+Fyb_prop;
Fzb=Z+Fzb_ast+Fzb_prop;
Mxb=l+Mxb_ast+Mxb_prop;
Myb=m+Myb_ast+Myb_prop;
Mzb=n+Mzb_ast+Mzb_prop;

%% Equations of motion
%-------------------------------------------------------------

s_t = equations_of_motion_6dof(s,s_t_old,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb);

end