%% X3
X3 = importdata('X3.mat');
X3 = X3(:,1:190);
[m, n] = size(X3);
mn = mean(X3, 2);
X3_sub = X3 - repmat(mn, 1, n);
[U3, S3, V3] = svd(X3_sub/sqrt(n-1));
% Y=U3'*X3_sub;
%%Plot energy

lamda3 = diag(S3).^2;
lamda3 = 100*lamda3/sum(lamda3);
scatter(1:6,lamda3);
title('Percentage of energy in Singular Values for Case 3');
ylabel('Percentage');
xlabel('n');


%% x, y plot
subplot(2, 1, 1);
plot(X3_sub(1,:));
hold on;
plot(X3_sub(3,:));
plot(X3_sub(5,:));
legend('cam1', 'cam2', 'cam3');
title('normalized X positions in Case 3');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X3_sub(2,:));
hold on;
plot(X3_sub(4,:));
plot(X3_sub(6,:));
title('normalized Y positions in Case 3');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

%% pca
j=2;
S_rank3 = S3;
S_rank3(j+1:end,j+1:end) = 0;
X3_new = U3*S_rank3*V3';
subplot(2, 1, 1);
plot(X3_new(1, :));
hold on;
plot(X3_new(3, :));
plot(X3_new(5, :));
title('X positions for Case 3, PCA mode 2');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

subplot(2, 1, 2);
plot(X3_new(2, :));
hold on;
plot(X3_new(4, :));
plot(X3_new(6, :));
title('Y positions for Case 3, PCA mode 2');
legend('cam1', 'cam2', 'cam3');
xlabel('Frame');
ylabel('Position');

