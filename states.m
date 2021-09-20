%% Hybrid air vehicle states
%
%  Created by Kiril Boychev
%  Everything is calculated in SI units unless otherwise stated.
%  Last edit 2nd October, 2015
% u v w p q r phi theta psi x_f y_f z_f
% 1 2 3 4 5 6 7   8     9   10  11  12

function states(simulation_states_log_file,s_selected)

    s=csvread(simulation_states_log_file);
    

    s_selected_size=size(s_selected);
    
    rows=s_selected_size(2);
    cols=1;
    row=1;
    subplot_id=1;
    
    figure(2);
    
    for i=1:1:s_selected_size(2)
  

        switch s_selected(i)
           case 1
              s_label='u';
              s_units='m/s';
           case 2
              s_label='v';
              s_units='m/s';
           case 3
              s_label='w';
              s_units='m/s';
           case 4
              s_label='p';
              s_units='rad/s';
           case 5
              s_label='q';
              s_units='rad/s';
           case 6
              s_label='r';
              s_units='rad/s';
           case 7
              s_label='phi';
              s_units='rad';
           case 8
              s_label='theta';
              s_units='rad';
           case 9
              s_label='psi';
              s_units='rad';
           case 10
              s_label='x_{f}';
              s_units='m';
           case 11
              s_label='y_{f}';
              s_units='m';
           case 12
              s_label='z_{f}';
              s_units='m';
           otherwise
              s_label='';
              s_units='';
        end
        
        if ~strcmp(s_label,'') && ~strcmp(s_units,'')
            
            subplot(rows,cols,subplot_id);
            plot(s(:,1),s(:,s_selected(i)+1),'Color',[28,69,135]/255,'LineWidth',1);
            ylabel(sprintf('%s (%s)',s_label,s_units));
            xlabel('t (s)');
           
            
            grid on;
            subplot_id=subplot_id+1;
            row=row+1;
            
        end
    end    
    
    load('hav_vertices.mat','hav_vertices');
    load('hav_faces.mat','hav_faces');

    figure(3);
    
    
    states_size=size(s);
    state_step=7;
    hold on;
    trajectory_plot=plot3(s(:,11),s(:,12),s(:,13),'Color',[28,69,135]/255,'LineWidth',1);
    state_step_old=0;
    
    for k=1:1:states_size(1)
        
        if s(k,1)-state_step_old>=state_step
            state_step_old=s(k,1);
            
            
            hav_vertices_new(:,1)=hav_vertices(:,1)+s(k,11)-92/2;
            hav_vertices_new(:,2)=hav_vertices(:,2)+s(k,12)-45/2;
            hav_vertices_new(:,3)=-hav_vertices(:,3)+s(k,13)+2;
                
            hav_plot=patch('Faces', hav_faces, 'Vertices' ,hav_vertices);
            set(hav_plot, 'FaceColor',[1,1,1]);
            set(hav_plot, 'FaceAlpha',1);
            set(hav_plot, 'EdgeColor','none');
            set(hav_plot,'Vertices',hav_vertices_new);
            
            
            rotate(hav_plot,[1 0 0],radtodeg(s(k,8)),[s(k,11) s(k,12) s(k,13)]);
            rotate(hav_plot,[0 1 0],radtodeg(s(k,9)),[s(k,11) s(k,12) s(k,13)]);
            rotate(hav_plot,[0 0 1],radtodeg(s(k,10)),[s(k,11) s(k,12) s(k,13)]);
                
        end    
        
    end
   
    axis equal;
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    set(trajectory_plot.Parent,'Ydir','Reverse');
    set(trajectory_plot.Parent,'Zdir','Reverse');
    light('Position',[1 0 -1]);
    view([-60 20]);
    grid on;
    hold off;
 end