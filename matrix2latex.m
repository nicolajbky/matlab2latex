%% Ausgabe der Contourdaten für MATRIXAUSGABE in LaTeX
% Damit können surfs, meshs und contourplots in pgfplot erzeugt werden
% matrix2latex (xq,yq,vq,filename)
%xq = A_us_v.*1000;
%yq = omega_us_v./1000;
%vq = F_mat;

function matrix2latex (xq,yq,vq,filename)


[n,m] = size(vq);

%fid = fopen('result9.txt','a');
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