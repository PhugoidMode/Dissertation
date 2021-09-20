function [s,s_t,delta] = trim(hav,V_inf,phi,gamma,zf)

zeta=[0;0;0;0;0;0;phi;0;0;0;0;zf;0;0;0;0;0;0;gamma];
zeta_old=zeta;

zeta_i=[4 5 6 13 15 16 17 18];
zeta_o=[1 2 3 4 5 6 7 8]; 

s=zeros(length(zeta),1);
s_t_old=zeros(length(zeta_o),1);
J=zeros(length(zeta_i),length(zeta_i));

sum_delta_zeta=1;
j=1;

while sum_delta_zeta > 1*10^(-12)

    for i=1:length(zeta_i)
        
        delta_zeta=zeta;
        delta_zeta(zeta_i(i))=delta_zeta(zeta_i(i))+0.001;
 
        [s,delta_s_t]=trim_equations(delta_zeta,s_t_old,hav,V_inf);
        [s,s_t]=trim_equations(zeta,s_t_old,hav,V_inf);
        
        s_t_old=s_t;
        
        J(:,i)=(delta_s_t(zeta_o)-s_t(zeta_o))/0.001;

    end
   
   zeta_old(zeta_i)=zeta(zeta_i);
   zeta(zeta_i)=zeta(zeta_i)+inv(J)*(-s_t(zeta_o));
   
   sum_delta_zeta = sum(abs(zeta-zeta_old));
   
   j=j+1;
   
   if j>100
       break;
   end
   
end

fprintf('\nHAV trimmed after %i iterations\n',j);

fprintf('\n');

for i=1:length(zeta_o)
    fprintf('r_%i:%0.6f\n',zeta_o(i),s_t(i));
   
end

delta=transpose(s(15:18));
s=transpose(s(1:12));
s_t=transpose(s_t);

fprintf('\n');
fprintf('Angle of attack:%0.4f rad (%0.4f deg)\n',atan(s(3)/s(1)),radtodeg(atan(s(3)/s(1))));
fprintf('Angle of sideslip:%0.4f rad (%0.4f deg)\n',asin(s(2)/V_inf),radtodeg(asin(s(2)/V_inf)));
fprintf('Thrusters throttle:%0.4f \n',delta(1));
fprintf('Port elevator:%0.4f rad (%0.4f deg)\n',delta(2),radtodeg(delta(2)));
fprintf('Starboard elevator:%0.4f rad (%0.4f deg)\n',delta(3),radtodeg(delta(3)));
fprintf('Rudder:%0.4f rad (%0.4f deg)\n',delta(4),radtodeg(delta(4)));
end
