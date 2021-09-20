%A function which calculates the thrust geenrated by the bowthruster
%separately 

function T_b = bowthruster_thrust(hav,rho_inf,n)

T_b = hav.eta_bt*hav.C_T_bt*rho_inf*(hav.Dbt^4)*(n^2);

end