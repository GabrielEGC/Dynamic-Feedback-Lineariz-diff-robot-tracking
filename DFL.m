k1=25;k2=10;
T=0.001;
t=0:T:10;
x=0;xr=0;xrd=0;xrdd(1)=0;xrdd(2)=0;
y=0.5;yr=0;yrd=0;yrdd(1)=0;yrdd(2)=0;
phi=0;
v=1;
for k=2:length(t)
    xr(k)=t(k);yr(k)=sin(t(k));
    xrd(k)=(xr(k)-xr(k-1))/T;yrd(k)=(yr(k)-yr(k-1))/T;
end
for k=3:length(t)
    xrdd(k)=(xrd(k)-xrd(k-1))/T;yrdd(k)=(yrd(k)-yrd(k-1))/T;
end


for k=1:length(t)
    
    
    xd(k)=v(k)*cos(phi(k));
    yd(k)=v(k)*sin(phi(k));
    
    mu1(k)=-k1*(x(k)-xr(k))-k2*(xd(k)-xrd(k))+xrdd(k);
    mu2(k)=-k1*(y(k)-yr(k))-k2*(yd(k)-yrd(k))+yrdd(k);
    
    
    w(k)=1/v(k)*(-sin(phi(k))*mu1(k)+cos(phi(k))*mu2(k));
    v(k+1)=v(k)+T*(cos(phi(k))*mu1(k)+sin(phi(k))*mu2(k));
    
    x(k+1)=x(k)+T*v(k)*cos(phi(k));
    y(k+1)=y(k)+T*v(k)*sin(phi(k));
    phi(k+1)=phi(k)+T*w(k);
    
end
figure(1); hold on
plot(t,x(1:end-1)); plot(t,y(1:end-1))
figure(2); hold on
plot(x,y);plot(xr,yr);
title('x,y')
legend('real','ref')
figure(3); hold on
plot(t,v(1:end-1)); plot(t,w)
legend('v','w')
figure(4); hold on
plot(t,mu1); plot(t,mu2)
legend('mu1','mu2')