function graphical_user_interface_close(object, eventdata)

global simulation_status;

simulation_status=0;

selection = questdlg('End simulation?','Yes','No'); 
    switch selection 
    case 'No',
     simulation_status=1;
    case 'Yes'
     simulation_status=0;
     delete(object);
    end

end