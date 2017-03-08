function [secmod,irp,r] = secsim(varargin)
% secmod = secsim(p,ca,glu) calculates insulin secrection  with the model,
% given the parameter p, calcium and glucose.
% secmod = secsim(p1,ca1,glu1,p2,ca2,glu2,...) calculates insulin 
% secrection (secmod) with the model for multiple time series.

% [secmod, irp, r]=secsim(p,ca,glu) calculates insulin secrection (secmod),
% immediately releasable pool (irp) and refilling (r) with the model,
% given the parameter p, calcium and glucose.
% [secmod, irp, r]=secsim(p1,ca1,glu1,p2,ca2,glu2,...) calculates insulin 
% secrection (secmod), immediately releasable pool (irp) and refilling (r)
% with the model for multiple time series.

if rem(nargin,3)~=0
    error('The number of arguments must be a multiple of 3')
end
nsim=nargin/3;


  

    

    for k=1:nsim
      base=3*(k-1);
    
      % time, calcium & glucose for the k-th time series
      paux.t=varargin{base+2}.t';
      paux.c=varargin{base+2}.v';
      paux.g=varargin{base+3}.v';
    
      % simulates on the calcium/glucose time grid
      simvar=betasim(varargin{base+1},paux.t,paux);
    
      % assign secretion to output
      secmod(k).t=paux.t';
      secmod(k).v=simvar(3,:); % secretion is the 3rd variable
    
      % assign irp to output
      irp(k).t=paux.t';
      irp(k).v=simvar(4,:); % secretion is the 4th variable
    
      % assign refilling to output
      r(k).t=paux.t';
      r(k).v=simvar(5,:); % secretion is the 5th variable
    end

