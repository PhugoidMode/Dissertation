hav.m  = 20000;%kg Vehicle mass
hav.W = hav.m*g; %N Vehicle weight
hav.I=[1732587 0 -558717;0 7260656 0;-558717 0 6825396]; %kgm^2 Vehicle inerias
hav.Q  = 38000; %m^3 Vehicle envelope volume
hav.Sref  = (hav.Q)^(2/3); %m^2 Reference area
hav.lref  = (hav.Q)^(1/3); %m Reference length

hav.M=[hav.m-1300,0,5,0,-434,0;
    0,hav.m-2529,0,-798,0,287;
    5,0,hav.m-6936,0,514,0;
    0,-798,0,hav.I(1,1)-53457,0,hav.I(1,3)-598;
    -434,0,514,0,hav.I(2,2)-196727,0;
    0,287,0,hav.I(3,1)-598,0,hav.I(3,3)-37446];% Vehicle M matrix

hav.l=92; %m Length
hav.w=43.5; %m Width
hav.h=26; %m height

hav.xcg_g=0;
hav.ycg_g=0;
hav.zcg_g=4.86;

% Hull 
hav.CLh_alpha=1.4322;
hav.alphaL0h=degtorad(-2);
hav.CDh0=0.0492;
hav.CLh_CDh0=0.1750;
hav.kh=0.8721;
hav.Cmh_alpha=1.0136;
hav.Cmh0=-0.00332;
hav.CSh_beta=0.1194;
hav.Cnh_beta=0.4497;
hav.Cnh0=0;

hav.xh_g=0;%m
hav.yh_g=0;%m
hav.zh_g=0;%m

hav.xh=hav.xh_g-hav.xcg_g; %m
hav.yh=hav.yh_g-hav.ycg_g; %m
hav.zh=hav.zh_g-hav.zcg_g; %m

%Horizontal stabilizer 
hav.eta_hs=1; %-
hav.gamma_hs=degtorad(-20); %rad
hav.lambda_2chs=degtorad(36.5); %rad
hav.Shs=128.5553; %m^2
hav.bhs=9.4180; %m
hav.RAhs=1.3799; %-
hav.RThs=0.5600; %-
hav.chs=14.0120; %m
hav.CLhs_alpha=2.2598; %/rad
hav.alphaL0hs=degtorad(0); %rad
hav.alpha0hs=0; %rad
hav.epsilon_chs=0.6090; %-

hav.xhsl_g=-29.15; %m
hav.zhsl_g=1.25; %m
hav.yhsl_g=-17.45; %m
hav.xhsr_g=-29.15; %m
hav.zhsr_g=1.25; %m
hav.yhsr_g=17.45; %m

hav.xhsl=hav.xhsl_g-hav.xcg_g; %m
hav.yhsl=hav.yhsl_g-hav.ycg_g; %m
hav.zhsl=hav.zhsl_g-hav.zcg_g; %m
hav.xhsr=hav.xhsr_g-hav.xcg_g; %m
hav.yhsr=hav.yhsr_g-hav.ycg_g; %m
hav.zhsr=hav.zhsr_g-hav.zcg_g; %m

%Vertical stabilizer 
hav.eta_vs=1; %-
hav.gamma_vs=degtorad(80); %rad
hav.Svs=124.6562; %m^2
hav.bvs=10.8397; %m
hav.RAvs=1.8852; %-
hav.RTvs=0.4744; %-
hav.cvs=11.9872; %m
hav.lambda_2cvs=degtorad(41.2); %rad
hav.CLvs_alpha=1.8544; %/rad
hav.alphaL0vs=degtorad(0); %rad
hav.alpha0vs=0; %rad
hav.epsilon_cvs=0.5498; %-

hav.xvsl_g=-28.45; %m
hav.yvsl_g=-12; %m
hav.zvsl_g=-8.65; %m
hav.xvsr_g=-28.45; %m
hav.yvsr_g=12; %m
hav.zvsr_g=-8.65; %m

hav.xvsl=hav.xvsl_g-hav.xcg_g; %m
hav.yvsl=hav.yvsl_g-hav.ycg_g; %m
hav.zvsl=hav.zvsl_g-hav.zcg_g; %m
hav.xvsr=hav.xvsr_g-hav.xcg_g; %m
hav.yvsr=hav.yvsr_g-hav.ycg_g; %m
hav.zvsr=hav.zvsr_g-hav.zcg_g; %m

hav.A=0.6*hav.m*g; %N Aerostatic force

hav.xcb_g=0; %m
hav.ycb_g=0; %m
hav.zcb_g=0; %m

hav.xa=hav.xcb_g-hav.xcg_g; %m
hav.ya=hav.ycb_g-hav.ycg_g; %m
hav.za=hav.zcb_g-hav.zcg_g; %m

hav.eta_at=0.85; %- Aft thrusters propulsive efficiency
hav.eta_ft=0.85; %- Forward thrusters propulsive efficiency
hav.eta_bt=0.9; %- Bow thruster propulsive efficiency
hav.Pft=300000; %W Forward thrusters available power
hav.Pat=300000; %W Aft thrusters available power
hav.Pbt=10000; %W Bow thruster available power
hav.C_T_bt=0.0465; %non-dimensional; thrust coefficient of the bow thruster
hav.theta_ft=degtorad(0); %rad Forward thrusters tilt angle
hav.Aft=pi*1.5^2;
hav.Aat=pi*1.5^2;
hav.Dbt=0.4743;
hav.Abt=pi*0.4743^2;

hav.xatl_g=-42.5; %m
hav.yatl_g=-7.35; %m
hav.zatl_g=0.85; %m

hav.xatr_g=-42.5; %m
hav.yatr_g=7.35; %m
hav.zatr_g=0.85; %m

hav.xftl_g=23; %m
hav.yftl_g=-18.65; %m
hav.zftl_g=4; %m

hav.xftr_g=23; %m
hav.yftr_g=18.65; %m
hav.zftr_g=4; %m

hav.xbt_g=42.35; %m
hav.ybt_g=0; %m
hav.zbt_g=-2.75; %m

hav.xatl=hav.xatl_g-hav.xcg_g; %m
hav.yatl=hav.yatl_g-hav.ycg_g; %m
hav.zatl=hav.zatl_g-hav.zcg_g; %m
hav.xatr=hav.xatr_g-hav.xcg_g; %m
hav.yatr=hav.yatr_g-hav.ycg_g; %m
hav.zatr=hav.zatr_g-hav.zcg_g; %m
hav.xftl=hav.xftl_g-hav.xcg_g; %m
hav.yftl=hav.yftl_g-hav.ycg_g; %m
hav.zftl=hav.zftl_g-hav.zcg_g; %m
hav.xftr=hav.xftr_g-hav.xcg_g; %m
hav.yftr=hav.yftr_g-hav.ycg_g; %m
hav.zftr=hav.zftr_g-hav.zcg_g; %m
hav.xbt=hav.xbt_g-hav.xcg_g; %m
hav.ybt=hav.ybt_g-hav.ycg_g; %m
hav.zbt=hav.zbt_g-hav.zcg_g; %m

