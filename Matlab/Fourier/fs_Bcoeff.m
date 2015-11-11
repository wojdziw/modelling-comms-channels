function Bm = fs_Bcoeff(T,m,f,x)
    w = 2*pi/T;
    c = sin(m*w*x);
    Bm = (2/T)*trapz( x, f.*c );

