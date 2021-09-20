%% equations_of_motion_6dof
% @param [1x12 double] s
% @param [1x1 struct] hav
% @param [double] Fxb
% @param [double] Fyb
% @param [double] Fzb
% @param [double] Mxb
% @param [double] Myb
% @param [double] Mzb
% 
% @return [1x12 double] s_t
%
function s_t = equations_of_motion_6dof_new(s,s_t,hav,Fxb,Fyb,Fzb,Mxb,Myb,Mzb)
      
    s_t(1) = -(hav.M(1,5)*s_t(5) - Fxb + hav.M(1,3)*s_t(3) - s(6)*(hav.M(2,4)*s(4) + hav.M(2,6)*s(6) + hav.M(2,2)*s(2)) + s(5)*(hav.M(3,5)*s(5) + hav.M(3,1)*s(1) + hav.M(3,3)*s(3))+hav.W*sin(s(8)))/hav.M(1,1);
    s_t(2) = -(hav.M(2,4)*s_t(4) - Fyb + hav.M(2,6)*s_t(6) - s(4)*(hav.M(3,5)*s(5) + hav.M(3,1)*s(1) + hav.M(3,3)*s(3)) + s(6)*(hav.M(1,5)*s(5) + hav.M(1,1)*s(1) + hav.M(1,3)*s(3))-hav.W*cos(s(8))*sin(s(7)))/hav.M(2,2);
    s_t(3) = -(hav.M(3,5)*s_t(5) - Fzb + hav.M(3,1)*s_t(1) + s(4)*(hav.M(2,4)*s(4) + hav.M(2,6)*s(6) + hav.M(2,2)*s(2)) - s(5)*(hav.M(1,5)*s(5) + hav.M(1,1)*s(1) + hav.M(1,3)*s(3))-hav.W*cos(s(8))*cos(s(7)))/hav.M(3,3);
    s_t(4) = -(hav.M(4,6)*s_t(6) - Mxb + hav.M(4,2)*s_t(2) + s(5)*(hav.M(6,4)*s(4) + hav.M(6,6)*s(6) + hav.M(6,2)*s(2)) - s(6)*(hav.M(5,5)*s(5) + hav.M(5,1)*s(1) + hav.M(5,3)*s(3)))/hav.M(4,4);
    s_t(5) = -(hav.M(5,1)*s_t(1) - Myb + hav.M(5,3)*s_t(3) - s(4)*(hav.M(6,4)*s(4) + hav.M(6,6)*s(6) + hav.M(6,2)*s(2)) + s(6)*(hav.M(4,4)*s(4) + hav.M(4,6)*s(6) + hav.M(4,2)*s(2)))/hav.M(5,5);
    s_t(6) = -(hav.M(6,4)*s_t(4) - Mzb + hav.M(6,2)*s_t(2) - s(5)*(hav.M(4,4)*s(4) + hav.M(4,6)*s(6) + hav.M(4,2)*s(2)) + s(4)*(hav.M(5,5)*s(5) + hav.M(5,1)*s(1) + hav.M(5,3)*s(3)))/hav.M(6,6);
    s_t(7)=s(4)+sin(s(7))*tan(s(8))*s(5)+cos(s(7))*tan(s(8))*s(6);
    s_t(8)=cos(s(7))*s(5)-sin(s(7))*s(6);
    s_t(9)=sin(s(7))/cos(s(8))*s(5)+cos(s(7))/cos(s(8))*s(6);
    s_t(10)=cos(s(8))*cos(s(9))*s(1)+(sin(s(7))*sin(s(8))*cos(s(9))-cos(s(7))*sin(s(9)))*s(2)+(cos(s(7))*sin(s(8))*cos(s(9))+sin(s(7))*sin(s(9)))*s(3);
    s_t(11)=cos(s(8))*sin(s(9))*s(1)+(sin(s(7))*sin(s(8))*sin(s(9))+cos(s(7))*cos(s(9)))*s(2)+(cos(s(7))*sin(s(8))*sin(s(9))-sin(s(7))*cos(s(9)))*s(3);
    s_t(12)=-sin(s(8))*s(1)+sin(s(7))*cos(s(8))*s(2)+cos(s(7))*cos(s(8))*s(3);

end