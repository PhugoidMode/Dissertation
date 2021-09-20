function [alpha,beta,V] = incidence_sideslip_and_airspeed(u,v,w)
    
    V = sqrt(u^2+v^2+w^2);
    alpha = atan(w/u);  
    beta = asin(v/V);
    
    if isnan(alpha) 
        alpha=0;
    end
    
    if isnan(beta) 
        beta=0;
    end
    
    
end