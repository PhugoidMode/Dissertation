%% Graphical user interface
% Last edit August 2017

t_out=zeros(1,100);
x_out=s(10)*ones(1,100);
y_out=s(11)*ones(1,100);
z_out=s(12)*ones(1,100);

load('hav_vertices.mat','hav_vertices');
load('hav_faces.mat','hav_faces');

hav_vertices_new(:,1)=hav_vertices(:,1)+s(10)-hav.l/2;
hav_vertices_new(:,2)=hav_vertices(:,2)+s(11)-hav.w/2;
hav_vertices_new(:,3)=-hav_vertices(:,3)+s(12)+2;

earth_faces=[1 2 3 4];
earth_vertices=[-1000 -1000 0;-1000 1000 0; 1000 1000 0; 1000 -1000 0];
earth_vertices_new(:,1)=earth_vertices(:,1)+s(10);
earth_vertices_new(:,2)=earth_vertices(:,2)+s(11);
earth_vertices_new(:,3)=earth_vertices(:,3);

figure_1=figure(1);

set(figure_1,'KeyPressFcn',@graphical_user_interface_controls);
set(figure_1,'CloseRequestFcn',@graphical_user_interface_close);

subplot(5,10,[1 2 3 4 5,11 12 13 14,21 22 23 24,31 32 33 34,41 41 43 44]);
hold on;
trajectory_plot=plot3(s(10),s(11),s(12),'Color',[28,69,135]/255,'LineStyle','-');
hav_plot=patch('Faces', hav_faces, 'Vertices' ,hav_vertices);
earth_plot=patch('Faces',earth_faces,'Vertices',earth_vertices);
zlabel('z (m)');
ylabel('y (m)');
xlabel('x (m)');
grid on;
axis equal;
hold off;
light('Position',[1 0 -1]);
view([-60 20]);

set(trajectory_plot.Parent,'XLim',[s(10)-100,s(10)+100]);
set(trajectory_plot.Parent,'YLim',[s(11)-100,s(11)+100]);
set(trajectory_plot.Parent,'ZLim',[s(12)-100,s(12)+100]);
set(trajectory_plot.Parent,'Ydir','Reverse');
set(trajectory_plot.Parent,'Zdir','Reverse');
set(hav_plot, 'FaceColor',[1,1,1]);
set(hav_plot, 'FaceAlpha',1);
set(hav_plot, 'EdgeColor','none');
set(hav_plot,'Vertices',hav_vertices_new);

set(earth_plot, 'FaceColor',[1,1,1]);
set(earth_plot, 'FaceAlpha',1);
set(earth_plot, 'EdgeColor','none');
set(earth_plot,'Vertices',earth_vertices_new);

rotate(hav_plot,[1 0 0],radtodeg(s(7)),[s(10) s(11) s(12)]);
rotate(hav_plot,[0 1 0],radtodeg(s(8)),[s(10) s(11) s(12)]);
rotate(hav_plot,[0 0 1],radtodeg(s(9)),[s(10) s(11) s(12)]);

subplot(5,10,[16 26]);

roll_plot=plot([0 1],[radtodeg(s(7)) radtodeg(s(7))],'Color',[28,69,135]/255,'LineWidth',1);
ylabel('deg');
xlabel('Roll angle');
ylim([radtodeg(s(7))-10 radtodeg(s(7))+10]);
grid on;
box off;
set(roll_plot.Parent, 'XTickLabelMode', 'Manual');
set(roll_plot.Parent, 'XTick',[]);

subplot(5,10,[17 27]);

pitch_plot=plot([0 1],[radtodeg(s(8)) radtodeg(s(8))],'Color',[28,69,135]/255,'LineWidth',1);
xlabel('Pitch angle');
ylabel('deg');
ylim([radtodeg(s(8))-10 radtodeg(s(8))+10]);
grid on;
box off;
set(pitch_plot.Parent, 'XTickLabelMode', 'Manual');
set(pitch_plot.Parent, 'XTick',[]);

subplot(5,10,[6 10]);

yaw_plot=plot([radtodeg(s(9)) radtodeg(s(9))],[0 1],'Color',[28,69,135]/255,'LineWidth',1);
xlabel('Yaw angle');
xlabel('deg');
xlim([radtodeg(s(9))-10 radtodeg(s(9))+10]);
grid on;
box off;
set(yaw_plot.Parent, 'YTickLabelMode', 'Manual');
set(yaw_plot.Parent, 'YTick',[]);

subplot(5,10,[18 28]);

alpha=atan(s(3)/s(1));
if isnan(alpha)
    alpha=0;
end

alpha_plot=plot([0 1],[radtodeg(alpha) radtodeg(alpha)],'Color',[28,69,135]/255,'LineWidth',1);
xlabel('Angle of attack');
ylabel('deg');
ylim([radtodeg(alpha)-10 radtodeg(alpha)+10]);
grid on;
box off;
set(alpha_plot.Parent, 'XTickLabelMode', 'Manual');
set(alpha_plot.Parent, 'XTick',[]);

beta=asin(s(2)/V_inf);
if isnan(beta)
    beta=0;
end

subplot(5,10,[19 29]);

beta_plot=plot([0 1],[radtodeg(beta) radtodeg(beta)],'Color',[28,69,135]/255,'LineWidth',1);
xlabel('Angle of sideslip');
ylabel('deg');
ylim([radtodeg(beta)-10 radtodeg(beta)+10]);
grid on;
box off;
set(beta_plot.Parent, 'XTickLabelMode', 'Manual');
set(beta_plot.Parent, 'XTick',[]);

subplot(5,10,[36 46]);

altitude_plot=plot([0 1],[s(12) s(12)],'Color',[28,69,135]/255,'LineWidth',1);
xlabel('Altitude');
ylabel('m');
ylim([s(12)-100 s(12)+100]);
grid on;
box off;
set(altitude_plot.Parent, 'XTickLabelMode', 'Manual');
set(altitude_plot.Parent, 'XTick',[]);
set(altitude_plot.Parent,'YDir','Reverse');

subplot(5,10,[37 47]);

velocity_plot=plot([0 1],[V_inf V_inf],'Color',[28,69,135]/255,'LineWidth',1);
xlabel('Velocity');
ylabel('m/s');
ylim([V_inf-10 V_inf+10]);
grid on;
box off;
set(velocity_plot.Parent, 'XTickLabelMode', 'Manual');
set(velocity_plot.Parent, 'XTick',[]);

time_display = uicontrol('Style','text','String','','Position',[20 20 100 20],'HorizontalAlignment','Left','FontName','Helvetica','FontSize',11);
additional_display = uicontrol('Style','text','String','','Position',[100 20 800 20],'HorizontalAlignment','Left','FontName','Helvetica','FontSize',11);

drawnow;


