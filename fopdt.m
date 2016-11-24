%%%% ��������

syms s t;
single x;
Uss = ones;

%%%% ���� ����
ys = 5/(s+1).^5
yt= 5 + 5/24*(-t.^4 - 4.*t.^3 - 12.*t.^2 - 24.*t - 24).*exp(-t);

%%%% ������ ���ϱ�
ddy = diff(diff(yt));
solddy=solve(ddy==0);
inf = find(solddy);
inflectPt = solddy(inf);
xi=inflectPt;

yx =@(t) yt_at
dyx = @(x) 5/24*(x.^4).*exp(-x);
TGLine = @(t) dyx(xi).*(t-xi)+yx(xi);
fplot(TGLine, [0, 15]);
hold on;

my_yt= @(t) 5 + 5/24*(-t.^4 - 4.*t.^3 - 12.*t.^2 - 24.*t - 24).*exp(-t);

fplot(my_yt, [0,15]);
ylimit = limit(yt, t,inf);
slimit = limit(ys, s, 0);
TGL = @(x) dyx(xi).*(x-xi)+yx(xi);
K = ylimit/Uss;
%%----------------------FOPDT�ٻ� ���1
d = solve(TGLine==0);
tau= solve(TGLine==ylimit)-d;

%%----------FOPDT�ٻ� ��� 2
%%% d = solve(TGLine==0); tau = solve(==0.632);