function setAxes( xmin, xmax, xnticks, xlab, ...
                  ymin, ymax, ynticks, ylab )
% function setAXes modifies the layout of the current figure.

% xmin= min value of the x axis
% xmax= max value of the x axis
% xnticks= number of ticks of the x axis from x=0 to x=xmax
% xlab= x label
% ymin= min value of the y axis
% ymax= max value of the y axis
% ynticks= number of ticks of the y axis from y=ymin to y=ymax
% ylab= y label

htmlPublish = 1;

if isempty(xlab)
    hideTickLabels = 1;
else
    hideTickLabels = 0;
end

xlim([xmin xmax]); 
set(gca,'XTick',linspace(0,xmax,xnticks)); 
if hideTickLabels == 1
    set(gca,'XTickLabel',[]); 
end
xlabel(xlab);

ylim([ymin ymax]);
set(gca,'YTick',linspace(ymin,ymax,ynticks)); 
hlab=ylabel(ylab);
set(hlab,'Units','pixels')
labpos=get(hlab,'Position');
labpos(1)=-43;
set(hlab,'Position',labpos)

% ylim([ymin ymax]);
% set(gca,'YTick',linspace(ymin,ymax,ynticks)); 
% yl=ylabel(ylab);
% yl.Units = 'pixels';
% yl.Position(1)=-43;

hline = findobj(gcf, 'type', 'line');

if htmlPublish
    % set(gca,'FontSize',18)
    % set(gca,'LineWidth',2)
    % set(hline,'LineWidth',3)
else
    set(gca,'FontSize',18);
    set(gca,'LineWidth',2);
    set(hline,'LineWidth',3);
end

end

