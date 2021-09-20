function s_out = numeric_integration(numeric_integration_method,simulation_stepsize,s,s_t,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb)
    
    switch numeric_integration_method
        case 'rk4'
            
            k1 = simulation_stepsize*s_t;
            k2 = simulation_stepsize*equations_of_motion_6dof(s+k1/2,s_t,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb);
            k3 = simulation_stepsize*equations_of_motion_6dof(s+k2/2,s_t,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb);
            k4 = simulation_stepsize*equations_of_motion_6dof(s+k3,s_t,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb);
            
            s_out=s+(k1+2*k2+2*k3+k4)/6;
        case 'fe'
            s_out = s+simulation_stepsize*s_t;
        otherwise
            s_out = s+simulation_stepsize*s_t;
    end 
end

