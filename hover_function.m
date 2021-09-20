function H = hover_function(x)

         H(1) = -x(1)*sind(-45)+x(2)*sind(x(3))-39240;
         H(2) = -x(1)*cosd(-45)+x(2)*cosd(x(3));
         H(3) = 42.5*x(1)*sind(-45)+23*x(2)*sind(x(3));
         H(4) = 7.35*x(1)*cosd(x(3))-4*x(2)*cosd(-45);

end 