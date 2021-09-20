%% aerodynamic_coefficients
% @param [1x12 double] s
% @param [double] V_inf
% @param [double] delta_el
% @param [double] delta_er
% @param [double] delta_r
% 
% @return [1x6 double] [CX,CY,CZ,Cl,Cm,Cn]
%
function [CX,CY,CZ,Cl,Cm,Cn] = aerodynamic_coefficients(s,hav,V_inf,delta_el,delta_er,delta_r)

    %
    % Body
    %------------------------------------------------------------
    alpha_h=atan((s(3)+s(4)*hav.yh-s(5)*hav.xh)/(s(1)+s(5)*hav.zh-s(6)*hav.yh));
    beta_h=asin((s(2)+s(6)*hav.xh-s(4)*hav.zh)/V_inf);

    CLh=hav.CLh_alpha*(alpha_h-hav.alphaL0h);
    CDh=hav.CDh0+hav.kh*(CLh-hav.CLh_CDh0)^2;
    CSh=hav.CSh_beta*beta_h;
    Clh=0;
    Cmh=hav.Cmh0+hav.Cmh_alpha*alpha_h;
    Cnh=hav.Cnh0+hav.Cnh_beta*beta_h;
    
    CXh=(CSh*sin(beta_h)-CDh*cos(beta_h))*cos(alpha_h)+CLh*sin(alpha_h);   
    CYh=-(CSh*cos(beta_h)+CDh*sin(beta_h));
    CZh=(CSh*sin(beta_h)-CDh*cos(beta_h))*sin(alpha_h)-CLh*cos(alpha_h);

    %
    % Horizontal tail
    %------------------------------------------------------------

        %
        % Left horizontal tail
        %------------------------------------------------------------

        alpha_hsl=atan((s(3)+s(4)*hav.yhsl-s(5)*hav.xhsl)/(s(1)+s(5)*hav.zhsl-s(6)*hav.yhsl));
        beta_hsl=asin((s(2)+s(6)*hav.xhsl-s(4)*hav.zhsl)/V_inf);

        alpha_hsln=alpha_hsl*cos(hav.gamma_hs)-beta_hsl*sin(hav.gamma_hs);
        beta_hsln=beta_hsl*cos(hav.gamma_hs)+alpha_hsl*sin(hav.gamma_hs);

        CLhsl=hav.CLhs_alpha*(alpha_hsln+hav.alpha0hs-hav.alphaL0hs+hav.epsilon_chs*delta_el);
        CDhsl=0;
        CShsl=0;
        Cmhsl=0;
        
        CXhsl=hav.eta_hs*hav.Shs/hav.Sref*(((CShsl*cos(hav.gamma_hs)-CLhsl*sin(hav.gamma_hs))*sin(beta_hsl)-CDhsl*cos(beta_hsl))*cos(alpha_hsl)+ (CLhsl*cos(hav.gamma_hs)+CShsl*sin(hav.gamma_hs))*sin(alpha_hsl));
        CYhsl=-hav.eta_hs*hav.Shs/hav.Sref*((CShsl*cos(hav.gamma_hs)-CLhsl*sin(hav.gamma_hs))*cos(beta_hsl)+CDhsl*sin(beta_hsl));
        CZhsl=hav.eta_hs*hav.Shs/hav.Sref*(((CShsl*cos(hav.gamma_hs)-CLhsl*sin(hav.gamma_hs))*sin(beta_hsl)-CDhsl*cos(beta_hsl))*sin(alpha_hsl)-(CLhsl*cos(hav.gamma_hs)+CShsl*sin(hav.gamma_hs))*cos(alpha_hsl));
   
        %
        % Right horizontal tail
        %------------------------------------------------------------
        
        alpha_hsr=atan((s(3)+s(4)*hav.yhsr-s(5)*hav.xhsr)/(s(1)+s(5)*hav.zhsr-s(6)*hav.yhsr));
        beta_hsr=asin((s(2)+s(6)*hav.xhsr-s(4)*hav.zhsr)/V_inf);

        alpha_hsrn=alpha_hsr*cos(hav.gamma_hs)+beta_hsr*sin(hav.gamma_hs);
        beta_hsrn=beta_hsr*cos(hav.gamma_hs)-alpha_hsr*sin(hav.gamma_hs);
  
        CLhsr=hav.CLhs_alpha*(alpha_hsrn+hav.alpha0hs-hav.alphaL0hs+hav.epsilon_chs*delta_er);
        CShsr=0;
        CDhsr=0;
        Cmhsr=0;
 
        CXhsr=hav.eta_hs*hav.Shs/hav.Sref*(((CShsr*cos(hav.gamma_hs)+CLhsr*sin(hav.gamma_hs))*sin(beta_hsr)-CDhsr*cos(beta_hsr))*cos(alpha_hsr)+ (CLhsr*cos(hav.gamma_hs)-CShsr*sin(hav.gamma_hs))*sin(alpha_hsr));
        CYhsr=-hav.eta_hs*hav.Shs/hav.Sref*((CShsr*cos(hav.gamma_hs)+CLhsr*sin(hav.gamma_hs))*cos(beta_hsr)+CDhsr*sin(beta_hsr));
        CZhsr=hav.eta_hs*hav.Shs/hav.Sref*(((CShsr*cos(hav.gamma_hs)+CLhsr*sin(hav.gamma_hs))*sin(beta_hsr)-CDhsr*cos(beta_hsr))*sin(alpha_hsr)-(CLhsr*cos(hav.gamma_hs)-CShsr*sin(hav.gamma_hs))*cos(alpha_hsr));

    %
    % Vertical tail
    %------------------------------------------------------------

        %
        % Left vertical tail
        %------------------------------------------------------------

        alpha_vsl=atan((s(3)+s(4)*hav.yvsl-s(5)*hav.xvsl)/(s(1)+s(5)*hav.zvsl-s(6)*hav.yvsl));
        beta_vsl=asin((s(2)+s(6)*hav.xvsl-s(4)*hav.zvsl)/V_inf);

        alpha_vsln=alpha_vsl*cos(hav.gamma_vs)-beta_vsl*sin(hav.gamma_vs);
        beta_vsln=beta_vsl*cos(hav.gamma_vs)+alpha_vsl*sin(hav.gamma_vs);
  
        CLvsl=hav.CLvs_alpha*(alpha_vsln+hav.alpha0vs-hav.alphaL0vs+hav.epsilon_cvs*delta_r);
        CDvsl=0;
        CSvsl=0;
        Cmvsl=0;
        
        CXvsl=hav.eta_vs*hav.Svs/hav.Sref*(((CSvsl*cos(hav.gamma_vs)-CLvsl*sin(hav.gamma_vs))*sin(beta_vsl)-CDvsl*cos(beta_vsl))*cos(alpha_vsl)+(CLvsl*cos(hav.gamma_vs)+CSvsl*sin(hav.gamma_vs))*sin(alpha_vsl));
        CYvsl=-hav.eta_vs*hav.Svs/hav.Sref*((CSvsl*cos(hav.gamma_vs)-CLvsl*sin(hav.gamma_vs))*cos(beta_vsl)+CDvsl*sin(beta_vsl));
        CZvsl=hav.eta_vs*hav.Svs/hav.Sref*(((CSvsl*cos(hav.gamma_vs)-CLvsl*sin(hav.gamma_vs))*sin(beta_vsl)-CDvsl*cos(beta_vsl))*sin(alpha_vsl)-(CLvsl*cos(hav.gamma_vs)+CSvsl*sin(hav.gamma_vs))*cos(alpha_vsl));

        %
        % Right vertical tail
        %------------------------------------------------------------
        alpha_vsr=atan((s(3)+s(4)*hav.yvsr-s(5)*hav.xvsr)/(s(1)+s(5)*hav.zvsr-s(6)*hav.yvsr));
        beta_vsr=asin((s(2)+s(6)*hav.xvsr-s(4)*hav.zvsr)/V_inf);
 
        alpha_vsrn=alpha_vsr*cos(hav.gamma_vs)+beta_vsr*sin(hav.gamma_vs);
        beta_vsrn=beta_vsr*cos(hav.gamma_vs)-alpha_vsr*sin(hav.gamma_vs);

        CLvsr=hav.CLvs_alpha*(alpha_vsrn+hav.alpha0vs-hav.alphaL0vs-hav.epsilon_cvs*delta_r);
        CDvsr=0;
        CSvsr=0;
        Cmvsr=0;
    
        CXvsr=hav.eta_vs*hav.Svs/hav.Sref*(((CSvsr*cos(hav.gamma_vs)+CLvsr*sin(hav.gamma_vs))*sin(beta_vsr)-CDvsr*cos(beta_vsr))*cos(alpha_vsr)+(CLvsr*cos(hav.gamma_vs)-CSvsr*sin(hav.gamma_vs))*sin(alpha_vsr));
        CYvsr=-hav.eta_vs*hav.Svs/hav.Sref*((CSvsr*cos(hav.gamma_vs)+CLvsr*sin(hav.gamma_vs))*cos(beta_vsr)+CDvsr*sin(beta_vsr));
        CZvsr=hav.eta_vs*hav.Svs/hav.Sref*(((CSvsr*cos(hav.gamma_vs)+CLvsr*sin(hav.gamma_vs))*sin(beta_vsr)-CDvsr*cos(beta_vsr))*sin(alpha_vsr)-(CLvsr*cos(hav.gamma_vs)-CSvsr*sin(hav.gamma_vs))*cos(alpha_vsr));


    CX=CXh+CXhsl+CXhsr+CXvsl+CXvsr;
    CY=CYh+CYhsl+CYhsr+CYvsl+CYvsr;
    CZ=CZh+CZhsl+CZhsr+CZvsl+CZvsr;

    Cl=Clh+hav.yh/hav.lref*CZh-hav.zh/hav.lref*CYh+hav.yhsl/hav.lref*CZhsl-hav.zhsl/hav.lref*CYhsl+hav.yhsr/hav.lref*CZhsr-hav.zhsr/hav.lref*CYhsr+hav.yvsl/hav.lref*CZvsl-hav.zvsl/hav.lref*CYvsl+hav.yvsr/hav.lref*CZvsr-hav.zvsr/hav.lref*CYvsr;
    Cm=Cmh+hav.zh/hav.lref*CXh-hav.xh/hav.lref*CZh+hav.zhsl/hav.lref*CXhsl-hav.xhsl/hav.lref*CZhsl+hav.zhsr/hav.lref*CXhsr-hav.xhsr/hav.lref*CZhsr+hav.zvsl/hav.lref*CXvsl-hav.xvsl/hav.lref*CZvsl+hav.zvsr/hav.lref*CXvsr-hav.xvsr/hav.lref*CZvsr;
    Cn=Cnh+hav.xh/hav.lref*CYh-hav.yh/hav.lref*CXh+hav.xhsl/hav.lref*CYhsl-hav.yhsl/hav.lref*CXhsl+hav.xhsr/hav.lref*CYhsr-hav.yhsr/hav.lref*CXhsr+hav.xvsl/hav.lref*CYvsl-hav.yvsl/hav.lref*CXvsl+hav.xvsr/hav.lref*CYvsr-hav.yvsr/hav.lref*CXvsr;

    if isnan(CX)
       CX=0;
    end

    if isnan(CY)
       CY=0;
    end

    if isnan(CZ)
       CZ=0;
    end

    if isnan(Cl)
       Cl=0;
    end

    if isnan(Cm)
       Cm=0;
    end

    if isnan(Cn)
       Cn=0;
    end

end