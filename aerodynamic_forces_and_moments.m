function [X,Y,Z,l,m,n] = aerodynamic_forces_and_moments(hav,CX,CY,CZ,Cl,Cm,Cn,q_inf)

    X=q_inf*hav.Sref*CX;
    Y=q_inf*hav.Sref*CY;
    Z=q_inf*hav.Sref*CZ;

    l=q_inf*hav.Sref*hav.lref*Cl;
    m=q_inf*hav.Sref*hav.lref*Cm;  
    n=q_inf*hav.Sref*hav.lref*Cn;

end