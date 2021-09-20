function delta_out = control(delta,delta_ref,delta_max,time_constant_min,time_constant_max,simulation_stepsize)
    
        time_constant=(abs(delta-delta_ref)*time_constant_max)/delta_max+time_constant_min;

        delta_dot=(-delta+delta_ref)/time_constant;
 
        delta_out=delta+simulation_stepsize*delta_dot;
        
end