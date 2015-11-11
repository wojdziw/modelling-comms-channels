function Am = fs_Acoeff(T,m,f,x)
    w = 2*pi/T;
    c = cos(m*w*x);
    Am = (2/T)*trapz( x, f.*c );
