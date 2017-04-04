% The function matrix2latex (xq,yq,vq,filename) creates a file "filename" that contains a meshgrid data that LaTeX, 
% more precisely Tikzpicture, understands. That allows you e.g. to use "shader=interp" to interpolate the data from MATLAB to 
% obtain a smooth graph in LaTeX Tikzpicture.
% Inputs of the function are xq, yq, and vq as described in 
% https://de.mathworks.com/help/matlab/ref/griddata.html?searchHighlight=xq%20yq%20vq&s_tid=doc_srchtitle
% Tikzpicture requires a meshgrid with (x,y,z) coordinates with each row seperated by an empty line, e.g.:
% \addplot3[surf,faceted color=none,shader=interp] 						
% 						coordinates {
%	(0.1,1,4.5385)(0.2,1,12.4954)(0.3,1,39.861)(0.4,1,41.557)(0.5,1,41.8667)(0.6,1,47.8733)(0.7,1,59.621)(0.8,1,64.1283)(0.9,1,71.2164)(1,1,66.5464)
% 
% (0.1,2,15.7315)(0.2,2,25.8292)(0.3,2,39.9948)(0.4,2,49.4326)(0.5,2,50.9354)(0.6,2,51.0483)(0.7,2,67.6746)(0.8,2,60.0651)(0.9,2,66.0433)(1,2,64.4639)
% 
% (0.1,3,29.4435)(0.2,3,30.4321)(0.3,3,57.9437)(0.4,3,56.0567)(0.5,3,52.6375)(0.6,3,50.3721)(0.7,3,49.6273)(0.8,3,57.2004)(0.9,3,55.1027)(1,3,59.5482)
% 	};
% \end{axis}
%
% This is what you will find in the file in your working direcotry

function matrix2latex (xq,yq,vq,filename)
[n,m] = size(vq);

fid = fopen(filename,'a');
header = '\\addplot3[surf,faceted color=none]coordinates {\r\n';

fprintf(fid,header);
for i=1:n
    line = '';
    for j=1:m
       line = strcat(line,['(' num2str(xq(j)) ',' num2str(yq(i)), ',' num2str(vq(i,j))  ') ']);
    end
    %disp(line)
    fprintf(fid,line);
    fprintf(fid,'\r\n\r\n');
    disp([num2str(round(i/n*100)) '%'])
end

footer = '};';
fprintf(fid,footer);
fclose(fid);
disp('done');
