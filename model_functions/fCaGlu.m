function f=fCaGlu(p,C,G)
% f=fCaGlu(p,C,G) calcium-glucose dose-response function, derived from the
% standard biphasic function (see fig S1 of the article)
%
% G= glucose signal
% C= calcium signal
% p= reference parameter


p1=p(1);
p2=p(2);
p4=p(4)*(tanh(p(5)*(G-p(6)))+1)/2;
p3=p(3)*p4;
CC=C-p(7);%C0=p(7)
f0=p(8);

f=p3.*CC+(p4-p3).*((log(cosh(p1*(CC-p2)))-log(cosh(p1*p2)))/p1+tanh(p1*p2)*CC)/(1+tanh(p1*p2))+f0;

