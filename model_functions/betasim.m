function vars=betasim(p,t,paux)
% vars=betasim(p,t,paux) performs simulation and returns all the variables
% exported by the Simulink model betavars.mdl.
%
% The argument p is the model parameter, t a vector with the simulation
% times.
%
% paux.t: time for calcium and glucose (column)
% paux.c: calcium (column)
% paux.g: glucose (column)

% Simulink options
opts=simget('betavars');
opts.SrcWorkspace='current';
opts.OutputPoints='specified';

% delay parameters
alphaP=p(13); %#ok<*NASGU>
delayP=p(14);
delayC=p(15);
alphaC=p(16);

% initial values
Ca0=fCa(p,paux.c(1,1));
CaGlu0=fCaGlu(p,paux.c(1,1),paux.g(1,1));

% inputs to model ports
ports=[paux.t paux.g paux.c fCaGlu(p,paux.c,paux.g) fCa(p,paux.c)];

% simulate
[~,~,vars]=sim('betavars',t,opts,ports);

% transpose with results in rows
vars=vars';
end