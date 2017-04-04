function str = xyfunction2latex(x,y)
%function str = xyfunction2latex(x,y)
%   converts the data from x and y into LaTeX form to be pasted.
%  x and y must have same length

str='\addplot[] coordinates{';
for i=1:length(x)
    str = strcat(str,'(',num2str(x(i)),',',num2str(y(i)),') ');
end
str = strcat(str,'};');

