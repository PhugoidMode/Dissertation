%% Buoyancy force and moment
%
%  Created by Kiril Boychev
%  Everything is calculated in SI units unless otherwise stated.
%  Last edit 2nd October, 2015

function [Fxb_ast,Fyb_ast,Fzb_ast,Mxb_ast,Myb_ast,Mzb_ast]=aerostatic_forces_and_moments(s,hav)
    
    Fxb_ast=hav.A*sin(s(8));
    Fyb_ast=-hav.A*sin(s(7))*cos(s(8));
    Fzb_ast=-hav.A*cos(s(7))*cos(s(8));
    
    Mxb_ast=hav.ya*Fzb_ast-hav.za*Fyb_ast;
    Myb_ast=hav.za*Fxb_ast-hav.xa*Fzb_ast;
    Mzb_ast=hav.xa*Fyb_ast-hav.ya*Fxb_ast;
    
end