disp('creating two large matrices')
a=rand(20000);
b=rand(20000);
disp('multiplying two large matrices')
c = a*b;
disp('printing')
sum(c(:))
