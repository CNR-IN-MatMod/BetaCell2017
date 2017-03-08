function ca=glu2ca(varargin)
% ca=glu2ca(glu) returns calcium as a static function of glucose, using a
% hyperbolic tangent function with parameters derived from Henquin 2006.
% Glucose and calcium are vector of the same size.
%
% ca=glu2ca(p,glu) uses a custom parameter with the hyperbolic tangent
% function: p=[amplitude slope offset].

% handle arguments
if nargin==1
    glu=varargin{1};
    p=[256.5226 0.1480 7.7831]; % parameter for Henquin 2006
else
    [p,glu]=deal(varargin{:});
end

% calcium
ca=p(1)*(1+tanh(p(2)*(glu-p(3))))/2;

