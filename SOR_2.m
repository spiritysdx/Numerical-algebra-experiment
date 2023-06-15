A=[-4 1 1 1;1 -4 1 1;1 1 -4 1;1 1 1 -4];
b=[1 1 1 1]';
x0=[0 0 0 0]';
times=9;
w=1.3;
[M, x]=SOR(A,b,x0,times,w);
function [M,x]=SOR(A,b,x0,times,w)
%[M,x]=SOR(A,b,x0,times,w)
%
%M为jacobi迭代矩阵
%x为方程组的解
%A为系数矩阵
%b为矩阵右侧
%times为迭代次数
%x0为初始x0
%w为参数因子
D=diag(diag(A));
L=D-tril(A);
U=D-triu(A);
M=(D-w.*L)\((1-w).*D+w.*U);
if vrho(M)>=1     %求B的谱
    error('jacobi迭代法不收敛！');
end
i=1;
while i<=times
    x=M*x0+(D-w.*L)\(w.*b);    %来自书上
    x0=x;
    disp(['第',num2str(i),'次']);
    disp(x);
    i=i+1;
end
end
