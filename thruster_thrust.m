function [T] = thruster_thrust(P,eta_p,A,delta_t,V_inf,rho_inf)
    RT=1;
    T=1;
    while abs(RT) > 0.01
        RT=P*eta_p*delta_t-1/2*T*(V_inf+(V_inf^2+(2*T)/(rho_inf*A))^(1/2));
        RT_T=((P*eta_p*delta_t-1/2*(T+0.01)*(V_inf+(V_inf^2+(2*(T+0.01))/(rho_inf*A))^(1/2)))-(P*eta_p*delta_t-1/2*(T-0.01)*(V_inf+(V_inf^2+(2*(T-0.01))/(rho_inf*A))^(1/2))))/0.02;
        delta_T=1/RT_T*(-RT);
        T=T+delta_T;
    end
end