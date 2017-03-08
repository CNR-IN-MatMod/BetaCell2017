function [p,p_peak]=loadpar(file) %#ok<STOUT>
% [p,p_peak]=loadpar(file) loads the model parameter for a specific data
% set.

load(file)
p_peak=[2;1.5];
