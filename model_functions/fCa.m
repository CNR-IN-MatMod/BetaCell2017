function f=fCa(p,C)
% f=fCa(p,C) calcium dose-response function derived from the
% standard biphasic function (see fig S1 of the article)
%
% C= calcium signal
% p= reference parameter




p1=p(9);
p2=p(10);
p3=p(11);
p4=p(12);

f=p3*C+(p4-p3).*((log(cosh(p1*(C-p2)))-log(cosh(p1*p2)))/p1+tanh(p1*p2)*C)/(1+tanh(p1*p2));
