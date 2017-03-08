function ca=casim(glu,p)
% ca=casim(glu,p) calcium simulator: calculates calcium from glucose.
%
% Glucose (glu) must be a struct with fields t and g for time and glucose
% concentration, both row vectors of the same dimensions. Calcium (ca) is
% returned in the same format (fields t and c) and on corresponding times.
%
% The parameter (p) has the following sections:
%
% p(1:2): peak generator
% p(3:6): peak amplitude modulation
% p(7:9): static component (glu2ca function)

% parameter sections
ppeak=p(1:2); % peak generator
pampl=p(3:6); % peak amplitude modulation
pg2c=p(7:9); % static component (glu2ca function)

% peak generator (zero-order linear system)
% matrices
b=ppeak; %
a=-diag(b);

% inital state
x0=-glu.v(1)*(a\b); %#ok<NASGU>

% simulate raw peak
opts=simget('capeakmod');
opts.SrcWorkspace='current';
opts.OutputPoints='specified';
[~,~,rawpeak]=sim('capeakmod',glu.t,opts,[glu.t' glu.v']);

% modulate peak amplitude & compute actual peak
capeak=max(0,rawpeak'.*(-pampl(1)*tanh(pampl(2)*(glu.v-pampl(3)))+pampl(4)));

% add static component and return calcium as struct
ca.t=glu.t;
ca.v=capeak+glu2ca(pg2c,glu.v);
