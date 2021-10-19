function plotQData(fig,q1,pTitle)
%PLOTQDATA This function plots the variable q generated by the simulink
%model
%   fig: number of figure to display the plots
%   q1: structure with time generated by the simulink model
%   pTitle: figure title. It will be used to save a svg figure
% DO NOT CHANGE THIS FUNCTION
close all
ms=8;
lw=2;

% Re-name the structure variables for easy handling
q=q1.signals.values(:,1);
qd=q1.signals.values(:,2);
t=q1.time;

% Create a new figure, and save its handle
% The handle is important to modify the paramters of the figure, e.g. its
% position.
f=figure(fig);
% Plot the angular position of the pendulum vs time
plot(t,q,'Marker','none','Color',[1 0 0],'MarkerSize',ms,...
    'MarkerFaceColor',[0 0 1],'LineWidth',lw)
%if we want to plot more signals, we need to tell the figure to hold on the
%previous ones.
hold on

% Plot the desired pendulum position vs time
plot(t,qd,'Marker','none','Color',[0 0 1],'MarkerSize',ms,...
    'MarkerFaceColor',[0 0 1],'LineWidth',lw)
hold on
% Activate the grid in the figure
grid on

% Using the handle of the figure, we can control its X-Y axis limits
% X: how much time you simulate
% Y: max and min values of q
f.CurrentAxes.XLim=[0,10];
f.CurrentAxes.YLim=[0,65];

% f.Position=[3130        1653         570         413];
% Title of the plot
title('PD')
% label for the x axis
xlabel('t [s]','FontWeight','bold')
% label for the y axis
ylabel('q [deg]','FontWeight','bold')
% Legend for the plot. Displays the variable and the color/type of line in
% the plot
legend('q','qd')

% Change other paramters of the figure
f.CurrentAxes.FontSize=14;
f.CurrentAxes.Legend.Location='best';

%You can save the figure in different formats, e.g. png
saveas(f,pTitle,'svg');

end
