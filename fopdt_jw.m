syms s t;
single x;
Uss = ones;
ys = 5/(s+1).^5;
yt = 5 + 5/24*(-t.^4 - 4.*t.^3 - 12.*t.^2 - 24.*t - 24).*exp(-t);
ddy = diff(diff(yt));
solddy=solve(ddy==0);
infpt = find(solve(ddy==0));
inflectPt = solddy(infpt);
xi=inflectPt;
yx =@(x) 5+5/24*(-x.^4 - 4.*x.^3 - 12.*x.^2 - 24.*x - 24).*exp(-x);
dyx = @(x) 5/24*(x.^4).*exp(-x);
TGLine =  dyx(xi).*(t-xi)+yx(xi);
ylimit = limit(yt);
slimit = limit(ys, s, 0);
TGL = @(x) dyx(xi).*(x-xi)+yx(xi);
K = ylimit/Uss;
%%----------FOPDT辟荤 规过 2
d = solve(TGLine==0); 
tau = solve(yt==0.632);
%%----------------------FOPDT辟荤 规过1
%%d = solve(TGLine==0);
%%tau= solve(TGLine==ylimit)-d;
FOPDTyt = K*(1-exp((d-t)/tau));
TGLine_2 = @(t)  dyx(xi).*(t-xi)+yx(xi);
fplot(TGLine_2, [0, 30]);
hold on;

yt_2 = @(t) 5 + 5/24*(-t.^4 - 4.*t.^3 - 12.*t.^2 - 24.*t - 24).*exp(-t);

fplot(yt_2, [0,30], 'r' );
hold on;

FOPDTyt_2 = @(t) Uss*K*(1-exp((1.5112-t)/3.7397));

fplot(FOPDTyt_2, [0,30], 'y')

clear;