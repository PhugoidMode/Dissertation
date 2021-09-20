function graphical_user_interface_controls(~,event)
    
    global simulation_status delta_ref;
    
    
    if strcmpi(event.Key,'a')
        
      if  delta_ref(3) < 0.3500
           if delta_ref(2) <= -0.3500
            delta_ref(2)=-0.3500;
           else
            delta_ref(2)=delta_ref(2)-0.005;
           end
           
      end
      
      
      if delta_ref(2) > -0.3500
           if delta_ref(3) >= 0.3500
            delta_ref(3)=0.3500;
           else
            delta_ref(3)=delta_ref(3)+0.005;
           end
      end
      fid = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/a_out.txt','a');
      pause(0.1);
      fprintf(fid, '%g\n', delta_ref(2));
      fclose(fid);
    end
    
    if strcmpi(event.Key,'d')
        
       if delta_ref(3) > -0.3500
           if delta_ref(2) >= 0.3500
            delta_ref(2)=0.3500;
           elseif delta_ref(3) >= -0.3500
            delta_ref(2)=delta_ref(2)+0.005;
           end
       end
       
       if delta_ref(2) < 0.3500
           if delta_ref(3) <= -0.3500
            delta_ref(3)=-0.3500;
           elseif delta_ref(2) <= 0.3500
            delta_ref(3)=delta_ref(3)-0.005;
           end
       end 
      fid2 = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/d_out.txt','a');
      fprintf(fid2, '%g\n', delta_ref(3));
      fclose(fid2);
    end
    
    if strcmpi(event.Key,'w')
       if delta_ref(2) >= 0.3500
        delta_ref(2)=0.3500;
       else
        delta_ref(2)=delta_ref(2)+0.005;
       end
       
       if delta_ref(3) >= 0.3500
        delta_ref(3)=0.3500;
       else
        delta_ref(3)=delta_ref(3)+0.005;
       end
       fid3 = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/w_out.txt','a');
      pause(0.1);
      fprintf(fid3, '%g %g\n', delta_ref(2), delta_ref(3));
      fclose(fid3);
    end
    

    
    if strcmpi(event.Key,'s')
        
       if delta_ref(2) <= -0.3500
        delta_ref(2)=-0.3500;
       else
        delta_ref(2)=delta_ref(2)-0.005;
       end
       
       if delta_ref(3) <= -0.3500
        delta_ref(3)=-0.3500;
       else
        delta_ref(3)=delta_ref(3)-0.005;
       end
       fid4 = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/s_out.txt','a');
      fprintf(fid4, '%g %g\n', delta_ref(2), delta_ref(3));
      fclose(fid4);
    end
    
    if strcmpi(event.Key,'q')
       if delta_ref(4) >= 0.1750
        delta_ref(4)=0.1750;
       else
        delta_ref(4)=delta_ref(4)+0.005;
       end
       fid5 = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/q_out.txt','a');
      fprintf(fid5, '%g\n', delta_ref(4));
      fclose(fid5);
    end
    
    if strcmpi(event.Key,'e')
       if delta_ref(4) <= -0.1750
        delta_ref(4)=-0.1750;
       else
        delta_ref(4)=delta_ref(4)-0.005;
       end
       fid6 = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/e_out.txt','a');
      fprintf(fid6, '%g\n', delta_ref(4));
      fclose(fid6);
    end
    
    if strcmpi(event.Key,'r')
       if delta_ref(1) >= 1
        delta_ref(1)=1;
       else
        delta_ref(1)=delta_ref(1)+0.005;
       end
       fid7 = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/r_out.txt','a');
      fprintf(fid7, '%g\n', delta_ref(1));
      fclose(fid7);
    end

    if strcmpi(event.Key,'f')
       if delta_ref(1) <= -1
        delta_ref(1)=-1;
       else
        delta_ref(1)=delta_ref(1)-0.005;
       end
       fid8 = fopen('/Users/rishabhsinha/Documents/MATLAB/HAV Example Simulation/hybridsim/f_out.txt','a');
      fprintf(fid8, '%g\n', delta_ref(1));
      fclose(fid8);
    end
    
    if strcmpi(event.Key,'escape')
      simulation_status=0;
      selection = questdlg('End simulation?','Yes','No'); 
      switch selection 
        case 'No'
         simulation_status=1;
        case 'Yes'
      end
      
    end

end