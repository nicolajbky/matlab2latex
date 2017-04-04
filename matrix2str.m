function str = matrix2str(A,p)
%converts matrix A into text form
% p is set for precision - maximum of significant digits of precision

if nargin < 2
  p = 5;
end

[n,m]=size(A);
str = '[';
for i=1:n-1
    for j=1:m-1
    str=strcat(str,num2str(A(i,j)),',');
    end
    j=m;
    str=strcat(str,num2str(A(i,j)));
    str=strcat(str,'; ');
end

i=n;
for j=1:m-1
    str=strcat(str,num2str(A(i,j)),',');
end
j=m;
str=strcat(str,num2str(A(i,j)));


str=strcat(str,']');
end

