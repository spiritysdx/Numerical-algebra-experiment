clear;clc;
all long;
A = [1,1,0.5;1,1,0.25;0.5,0.25,2];
e = 10;
u(:,1) = [1 1 1]';
v(:,1) = u(:,1);
i = 1;
while e>1e-10
    v(:,i+1) = A*u(:,i);
    u(:,i+1) = v(:,i+1)/max(v(:,i+1));
    e = abs(max(v(:,i+1))-max(v(:,i)));
    i = i+1;
   
    if i>100
        break;
    end
end
u(:,i)
max(v(:,i))
%https://blog.csdn.net/weixin_41170947/article/details/109677195?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1.essearch_pc_relevant&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1.essearch_pc_relevant
