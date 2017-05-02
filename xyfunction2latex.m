function str = xyfunction2latex(x,y,f)
%function str = xyfunction2latex(x,y)
%  converts the data from x and y into latex form to be pasted.
%  x and y must have same length
%  if option f is given, the data is resampled with a frequency of f Hz

if nargin > 2
 [x,y] = resample(y,x,f);
end

str='\addplot[] coordinates{';
for i=1:length(x)
    str = strcat(str,'(',num2str(x(i)),',',num2str(y(i)),') ');
end
str = strcat(str,'};');

