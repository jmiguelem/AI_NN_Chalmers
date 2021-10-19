function simpleRobotPlotv2(u)
%SIMPLEROBOTPLOT Plot a vertical pendulum (1 DOF robot)
%   u: vector of input arguments (defined by the simulink model)
%   NOTE: You don't need to modify this function

% This variables are like static variables in c
persistent handles told qd_old


%Joint Position
q=u(1);

%Kinematic Parameters
l=u(3);

%Time
t=u(7);

% Desired position (no orientation)
qd=deg2rad(u(13));

% EFd position
% Forward kinematics of the pendulum. Computes the x-y positions of the
% end-effector using the desired angular position of the pendulum
xefd_w=FK_robot1DOFV([qd l]);

% EF position
% Forward kinematics of the pendulum. Computes the x-y positions of the
% end-effector using the current angular position of the pendulum
xef_w=FK_robot1DOFV([q l]);

% For visualization purposes (to plot the pendulum vertically)
gammaZ=-pi/2;
cg=cos(gammaZ);
sg=sin(gammaZ);

Rz=[cg -sg 0;
    sg  cg 0;
    0   0  1];

xefd_w=Rz*xefd_w;
xef_w=Rz*xef_w;

% Number of figure
fig=1;

% Visualization area
initSize=1.5;

% Plottig parameters
ms=8;
lw=2;


% in the first iteration, we initialize all the plotting objects
if t==0
    
    if (ishandle(fig) && strcmp(get(fig, 'type'), 'figure'))
        % If the figure exists
        % Delete all objects in the figure (reset figure)
        allHandles=findobj(fig);
        EraseCFHandles(allHandles);
    else
        % If the fig doesn't exist
        % Initializes the figure where the robot will be plotted
        f=figure(fig);
        f.Position=[55         66        880       660];
        %Set the axis of thefigure
        axis(initSize*[-1 1 -1 1]);
        % Set the 2D view
        view([0 90])
        % Keep all the objects 
        hold on
        % Activate the figure grid
        grid on
    end
    
    % Deletes all the persistent variables
    clear plotRobot
    
    % Plot the desired robot position
    hd=plot([0;xefd_w(1)],[0;xefd_w(2)],'LineStyle','--','Color',[1 0 0],...
        'Marker','o','MarkerSize',ms,'MarkerFaceColor',[1 0 0],...
        'LineWidth',lw);
    % Plot the current robot position
    hj=plot([0;xef_w(1)],[0;xef_w(2)],'LineStyle','-','Color',[0 0 1],...
        'Marker','o','MarkerSize',ms,'MarkerFaceColor',[0 0 1],...
        'LineWidth',lw);
    % Plot the origin of the robot
    ch=plot(0,0,'Marker','o','Color',[0 0 0],'MarkerSize',ms,...
        'MarkerFaceColor',[0 0 0],'LineWidth',lw);
    
    % print a label with the pendulum angular position
    tag=sprintf('q=%2.2f',rad2deg(q));
    hText=text(0,0,tag, 'fontsize',8,'fontweight','b');
    
    % This handles are important to modify the plotting object properties,
    % for example, the lines in the plot
    handles=[ch;hd;hj;hText];
    
    % Memory
    told=-1;
    qd_old=qd;
end

% Defines the refresh rate for visualizing the robot
sT=str2double(get_param('DSimulator_robot1DOFV2','FixedStep'));
sampleTime=33*sT;%30/60 Hz refresh rate

% Plot desired position (only if it changes)
Dqt=qd-qd_old;
if (abs(Dqt)>0)
    
    %Update desired robot position
    handles(2).XData=[0 xefd_w(1)];
    handles(2).YData=[0 xefd_w(2)];
    qd_old=qd;
end

% Plot robot
% each sampleTime we plot the pendulum
if((~mod(t,sampleTime))&&(t~=0.0)&&(t~=told))
    % Update robot position
    handles(3).XData=[0 xef_w(1)];
    handles(3).YData=[0 xef_w(2)];
    
    % Update label
    tag=sprintf('q=%2.2f',rad2deg(q));
    handles(4).Position=xef_w(1:2,1)+0.03;
    handles(4).String=tag;
    
    %Refresh figure
    drawnow
end



end

