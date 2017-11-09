%% X4
X4 = importdata('X4.mat');
X4 = X4(:,1:190);
[m, n] = size(X4);
mn = mean(X4, 2);
X4_sub = X4 - repmat(mn, 1, n);
[U4, S4, V4] = svd(X4_sub/sqrt(n-1));
Y=U4'*X4_sub;
%% Plot energy

lamda4 = diag(S4).^2;
lamda4 = 100*lamda4/sum(lamda4);
scatter(1:6,lamda4);
title('Percentage of each Singular Value for Case 4');
ylabel('Percentage');
xlabel('n');


%% x, y plot
subplot(2, 1, 1);
plot(X4_sub(1,:));
hold on;
plot(X4_sub(3,:));
plot(X4_sub(5,:));
legend('cam1', 'cam2', 'cam3');
title('normalized X positions in Case 4');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X4_sub(2,:));
hold on;
plot(X4_sub(4,:));
plot(X4_sub(6,:));
title('normalized Y positions in Case 4');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

%% pca
j=4;
S_rank4 = S4;
S_rank4(j+1:end,j+1:end) = 0;
X4_new = U4*S_rank4*V4';
subplot(2, 1, 1);
plot(X4_new(1, :));
hold on;
plot(X4_new(3, :));
plot(X4_new(5, :));
title('X positions for Case 4, PCA mode 4');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X4_new(2, :));
hold on;
plot(X4_new(4, :));
plot(X4_new(6, :));
title('Y positions for Case 4, PCA mode 4');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

