%% X1
X1 = importdata('X1.mat');
X1 = X1(:,1:150);
%%
[m, n] = size(X1);
mn = mean(X1, 2);
X1_sub = X1 - repmat(mn, 1, n);
[U1, S1, V1] = svd(X1_sub/sqrt(n-1));
Y1=U1'*X1_sub;

%% Plot energy

lamda1 = diag(S1).^2;
lamda1 = 100*lamda1/sum(lamda1);
scatter(1:6,lamda1);
title('Percentage of energy in Singular Values for Case 1');
ylabel('Percentage');
xlabel('n');


%% x, y plot
subplot(2, 1, 1);
plot(X1_sub(1,:));
hold on;
plot(X1_sub(3,:));
plot(X1_sub(5,:));
legend('cam1', 'cam2', 'cam3');
title('normalized X positions in Case 1');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X1_sub(2,:));
hold on;
plot(X1_sub(4,:));
plot(X1_sub(6,:));
title('normalized Y positions in Case 1');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

%% pca
j=1;
S_rank1 = S1;
S_rank1(j+1:end,j+1:end) = 0;
X1_new = U1*S_rank1*V1';
subplot(2, 1, 1);
plot(X1_new(1, :));
hold on;
plot(X1_new(3, :));
plot(X1_new(5, :));
title('X positions for Case 1, PCA mode 1');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X1_new(2, :));
hold on;
plot(X1_new(4, :));
plot(X1_new(6, :));
title('Y positions for Case 1, PCA mode 1');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
%%

[M,N] = size(X1);
% subtract off the mean for each dimension
mn = mean(X1,2);
X1 = X1 - repmat(mn,1,N);
% construct the matrix Y
Y = X1' / sqrt(N-1);
% SVD does it all
[u,S,PC] = svd(Y);
% calculate the variances
S = diag(S);
scatter(1:6, S);
V = S .* S;
% project the original data
signals = PC' * X1;
%%
X1_new = signals;
subplot(2, 1, 1);
plot(X1_new(1, :));
hold on;
plot(X1_new(3, :));
plot(X1_new(5, :));
title('X positions for Case 1, PCA mode 1');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X1_new(2, :));
hold on;
plot(X1_new(4, :));
plot(X1_new(6, :));
title('Y positions for Case 1, PCA mode 1');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');


