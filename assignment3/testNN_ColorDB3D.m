function  [Wi_hI,Wh_oI]=testNN_ColorDB3D(dataBase,iterations,n_h,activation_function,learning_rate,alpha, test_size, plotF)
%Training and testing process of neural network (NN)
%   dataBase: file name of the dataBase containing the training and test samples (.mat) file
%   Default Value: "colorDB3D.mat"  

%   interations: Number of iterations the NN will be used for learning
%   Default Value: scalar value, you decide on it, e.g., 10000 or more  

%   n_h: size of hidden nodes vector
%   Default Value: scalar value between 1 and 10

%   activation_function: type of activation function
%   (1) linear, (2) logistic (sigmoid), (3) tanh
%   Default Value: [3,3]

%   learning_rate: vector of learning_rates (1) eta hidden layer, (2) eta outter layer
%   Default Value: [0.001,0.001]  

%   alpha: vector of momentum gains (1) hidden layer, (2) outter layer
%   Default Value: [0.0,0.0]  

%   test_size: size of the test data
%   Default Value: 100  

%   plotF: true|false boolean variable
%   Default Value: true 

%   Example:
%   [Wi_hI,Wh_oI]=testNN_ColorDB3D('colorDB3D.mat',10000,??,[3,3],[0.001,0.001],[0.0;0.0],100,true)
% you should try with different input values

close all

%% Loading Data Base (DB)
db=load(dataBase);

%% Training Data

% Input of training data
% Xr is of dimension R^{3 X n} where n is the number of training samples 
Xr=db.xtr;

% Output of training data
% Tr is of dimension R^{3 X n} where n is the number of training samples 
Tr=db.otr;
% TODO: We need to change the range of the output from [1 0 0], [0 1 0], or [0 0 1], 
% to [0.9 0.1 0.1], [0.1 0.9 0.1] and [0.1 0.1 0.9].
Tr=??


% Shuffle the training data
Data=[Xr;Tr];
n = size(Data,2);
DataS=Data(:,randperm(n));

% newly shuffled training data: input and output
Xr=DataS(1:3,:);
Tr=DataS(4:6,:);

%Adding bias x0 to the beginning of the input vector
Xr=[ones(1,sXr(2));Xr];

% size of input and output of training data
sXr=size(Xr);
sTr=size(Tr);


%% Test Data

% Input of test data
Xt=db.xte;

% TODO:Adding bias value to the beginning of the input vector of test data
% The original size of Xt is 3 x n, after adding the bias the new Xt is of size 4 x n 
Xt=??

% size of input of test data
sXt=size(Xt);

% Output of test data
Tt=db.ote;

%% Input arguments
% n_i = number of features (inputs) + bias
% n_o = number of outputs
% TODO: Define n_i, and n_o
n_i=??
n_o=??

%Get the size of the training samples
n_s=sXr(2);

if sTr(2)~=n_s
    error('Number of samples should be the same for the input vector (%d) and for the output (%d)',n_s,sTr(2))
end

%% Type of activation functions for the hidden and outter layers
% TODO: You have to train this ANN with at leat two different activation
% functions.
% For instance:
% First case: af1=3 and af2=3 (both activation function are tanh).
% Second case: af1=3 and af2=1 (hidden layer -> tanh, outter layer -> linear)
% These variables are input arguments of the functions: back and forward-propagation functions
af1=activation_function(??)
af2=activation_function(??)

%% Learning rate for the hidden eta(1) and the outter eta(2) layers
eta=learning_rate;

%% Initially Random Weights
fprintf('Initializing Weights:\n');
m=0;
sigma=0.5;
pd=makedist('Normal',m,sigma);

%Initial Weights (Randomlly generated initial weights for both layers)
%The dimension is (n_i X n_h) which already includes the bias x0
Wi_h=random(pd,[n_i,n_h]);
fprintf(1, 'Initial Weights Wi_hI\n');
Wi_hI=Wi_h

% Output weights
%The dimension is (n_h X n_o) which already includes the bias h0
Wh_o=random(pd,[n_h,n_o]);
fprintf(1, 'Initial Weights Wh_oI\n');
Wh_oI=Wh_o

%% NN Learning part

% Initialization of the weight increment matrices
DWi_h_1=zeros(n_i,n_h);
DWh_o_1=zeros(n_h,n_o);

% Color Basis B=[R G B] used to encode the NN output
B=[1 0 0;
   0 1 0;
   0 0 1];

% Counter to store the accumulated errors
count=1;

% Vector of accumulated errors
ee=zeros(iterations, n_o);

fprintf(1, 'Training Starts\n');
% Loop all the training samples n_s through the number of desired iterations
for it=1:iterations
    et=zeros(n_o,1);
    fet=zeros(n_o,1);
    Or=zeros(n_o,n_s);
    fO=zeros(n_o,n_s);
    
    for s=1:n_s
        
        % The input vector from the training samples, with bias x0
        xin=Xr(:,s);
        
        % Forward propagation (xin->hidden->out)
        % Compute output values of both layers using the Weight matrices
        % and the input vector
        % O outter layer value: O(:,1) o, O(:,2) derivative of o
		% H hidden layer value: H(:,1) h, H(:,2) derivative of h; 
        % TODO: Complete this function
        [O,H]=forwardPropagationv2(Wi_h,Wh_o,??,??,??);
        
        
        % The real output vector from the training samples
        %(n_o X 1)
        to=Tr(:,s);

        % Backward propagation of errors (out->hidden->xin)
        % Estimate the new weights (Wi_h, Wh_o) and its increments
        % TODO: Complete this function
        [Wi_h,Wh_o,e2,DWi_h_1,DWh_o_1]=backwardPropagationv2(Wi_h,Wh_o,...
            ??,??,??,??,eta,alpha,??,??);
        
        % Accumulated Error (1,1)
        et=et+e2;
        
        % store estimated output of NN
        Or(:,s)=O(:,1);
        
        % Normalizing the output O (The values of the vector O should be in the range [0,1]
        miO=min(O(:,1));
        maO=max(O(:,1));
        nO=(O(:,1)-miO)/(maO-miO);
        
        % TODO: Fit output nO into the three colors. The output nO should be fitted in
        % the 3 available solutions R,G,B. You need to find out which
        % of the column vectors in B, i.e. [1;0;0], [0;1;0], and [0;0;1]
        % is closer to the estimated output vector nO and
        % assign that vector in B to the fO(:,s).
        % ?? what is ind !!!
        fO(:,s)=B(:,ind);
		% you will need to use "min()" which returns the minimum value and its index in a vector        

        % Fitted Error. Error between the real output and the fitted output
        fe=to-fO(:,s);
        fet=fet+fe.^2; % sum up the fitted error for each training sample
        
    end
    
    % Accumulate the total fitted error of all iterations
    ee(count,:)=(fet)/2.0;
    count=count+1;
    
end
fprintf(1,'----Learned data-----\n');
% We take the last Weights from the training stage as our result (as our NN's weights 
% for later evaluation)
fprintf(1,'Training ends with following learned weights\n');
Wi_hl=Wi_h
Wh_ol=Wh_o

fprintf(1,'----Training Error Statistics-----\n');

Ef=(Tr-fO).^2/2;

Efp=100*(abs(Ef)./abs(Tr));

%% Plot Training results
if plotF
    f1=figure(1);

    % Plot error evolution
    plot(ee,'LineWidth',2.5)
    hold on
    grid on
    title('Estimation Errors (Training)');
    se=size(ee);
    for i=1:se(2)
        s=sprintf("error %2d",i);
        l(i,1)=s;
    end
    legend(l)
    xlabel('epochs')
    ylabel('error')
    
    % Plot RGB values of the training data in a 3D figure. Each coordinate
    % corresponds to a color i.e., x-axis = red value, y-axis green value,
    % z-axis blue value. The color of each point is the output of training data
    f2=figure(2);
    for i=1:sXr(2)
        plot3(Xr(2,i),Xr(3,i),Xr(4,i),'Marker','o','Color',Tr(:,i),'MarkerSize',8,...
            'MarkerFaceColor',Tr(:,i),'LineWidth',2.5)
        hold on
    end
    
    grid on
    title('Training Data');
    xlabel('x_1 (Red)');
    ylabel('x_2 (Green)');
    zlabel('x_3 (Blue)');
    
    % Plot RGB values of the classification result in a 3D figure. Each coordinate
    % corresponds to a color i.e., x-axis = red value, y-axis green value,
    % z-axis blue value. The color of each point is the classified output by NN
    f3=figure(3);
    for i=1:sXr(2)
        plot3(Xr(2,i),Xr(3,i),Xr(4,i),'Marker','o','Color',fO(:,i),'MarkerSize',8,...
            'MarkerFaceColor',fO(:,i),'LineWidth',2.5)
        
        hold on
    end
    grid on
    title('Learned Data');
    xlabel('x_1 (Red)');
    ylabel('x_2 (Green)');
    zlabel('x_3 (Blue)');
    
end


%% Test
fprintf('Testing starts\n');
if test_size>sXt(2)
    warning('Test size number (%d) should be lower than the size of the DB (%d) and for the output (%d)',test_size,sXt(2));
    test_size=sXt(2)
end

% Store classified output after feeding all input vectors of test data into learned NN
Ttl=zeros(n_o,test_size);

% Store classified output after being fitted into RGB values
fOt=zeros(n_o,test_size);

% Counter to store the wrongly classified input vectors
count=1;

for s=1:test_size
    
    % Select an input vector from the test data
    xin=Xt(:,s);
    
    % TODO: Compute output (estimation) by feeding the LEARNED Weight matrices Wi_hl and Wh_ol
	% above and other input arguments into the "forwardPropagationv2" function  
    [O]=??????
    
    % store NN's output
    Ttl(:,s)=O(:,1);
    
    % Normalized Output. The values of the output should be in the range [0,1]
    miO=min(O(:,1));
    maO=max(O(:,1));
    nO=(O(:,1)-miO)/(maO-miO);
    
    % TODO: Fit real output vector Tt(:,s) into the three colors.
    % The real output should be fitted in the 3 available solutions R,G,B. 
    % You need to find out which of the column vectors in B, i.e. [1;0;0], 
    % [0;1;0], and [0;0;1] is closer to Tt(:,s) (n_o X 1) and assign the index of the column to 
    % the variable Tt1D that will be later used to calculate the confusion matrix 
    % matrix. Tt1D would contain the value 1 or 2 or 3.
    %?? what is ind !!!
    Tt1D(1,s)=ind; %<---- needed to build the confusion matrix
	% HINT: using min()
    
    % TODO: same as before, but in this case you will find out which of the column vectors in B 
	% is closer to estimated output nO(:,s) (n_o X 1) and assign the index of that column to the variable fOt1D 
    %?? what is ind !!!
    fOt(:,s)=B(:,ind);
    fOt1D(1,s)=ind; %<---- needed to build the confusion matrix
	% HINT: using min()
    
    % Get the wrong matches and visualize them in a plot
    ne=norm(fOt(:,s)-Tt(:,s));
    if ne>0
        wX(:,count)=xin(2:4);
        count=count+1;
    end
end

% Clasification Error vector
Te=Tt(:,1:test_size)-fOt;

% Total Quadratic Error
el=vecnorm(Te.^2/2);

count=count-1;
fprintf(1,'----Test Error Statistics-----\n');
fprintf(1,"Total error: %d\n",norm(el));
fprintf(1,"Incorrect Matches: %d(%d)\n",count,test_size);
fprintf(1,"Accuracy: %2.2f%%\n",100*(1-(count/test_size)));

%% Plotting
% Confusion Matrix (compares the output of test data vs the classified output)
f6=figure(6);

C=confusionmat(Tt1D,fOt1D);

confusionchart(C);

%Plot input vectors along with the real output (color) in test data, and the classified output (color)
if plotF
    % Test samples
    f4=figure(4);
    for i=1:test_size
        plot3(Xt(2,i),Xt(3,i),Xt(4,i),'Marker','o','Color',Tt(:,i),'MarkerSize',8,...
            'MarkerFaceColor',Tt(:,i),'LineWidth',2.5)
        hold on
    end
    grid on
    title('Input Test Data');
    xlabel('x_1 (Red)');
    ylabel('x_2 (Green)');
    zlabel('x_3 (Blue)');
    
    % Classified output
    f5=figure(5);
    for i=1:test_size
        
        plot3(Xt(2,i),Xt(3,i),Xt(4,i),'Marker','o','Color',fOt(:,i),'MarkerSize',8,...
            'MarkerFaceColor',fOt(:,i),'LineWidth',2.5)
        
        hold on
    end
    
    % Mark the wrongly classified samples to ease its identification
    if exist('wX','var') == 1
        for i=1:size(wX,2)
            plot3(wX(1,i),wX(2,i),wX(3,i),'Marker','o','Color',[1 0 1],'MarkerSize',18,...
                'MarkerFaceColor','none','LineWidth',0.2)
            
            hold on
        end
    end
    
    grid on
    title('Evaluated Test Data');
    xlabel('x_1 (Red)');
    ylabel('x_2 (Green)');
    zlabel('x_3 (Blue)');
    
end

end



