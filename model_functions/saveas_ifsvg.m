% Only saves an SVG file if supported by the matlab in use.
function saveas_ifsvg(varargin)
    
if ~verLessThan('matlab','8.6')
    saveas(varargin{:});
end
