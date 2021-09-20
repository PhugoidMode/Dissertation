function [p,T,a,rho] = international_standard_atmosphere(zf)

R=287;
p0=101325;
T0=288.15;
k=1.4;

if zf>=11000
    zf=11000;
end

T=T0-6.5.*zf/1000;
p=p0.*(1-0.0065.*zf./T0).^5.2561;
rho=p./(R.*T);
a=sqrt(k.*R.*T);


end