function contour2latex(HT)
%Creation of a contour plot in latex with contour data from MATLAB
clc
    CM=HT.ContourMatrix';
    len=length(CM);
    p1 = '\addplot [color=black,mark=nomark] coordinates {';
    p3 = '};';
    
    i=1;
    while i<len
        disp(' ');
        disp(['%Z: ' num2str(CM(i,1))]);
        disp(p1);
        for j=i+1:i+CM(i,2)
            disp([ '(' num2str(CM(j,1)) ',' num2str(CM(j,2)) ')' ]);
        end
        disp(p3);
        disp(['\node[right,font=\tiny] at (axis cs:' num2str(max(CM(j,1))) ',' num2str(CM(j,2)) '){ ' num2str(CM(i,1)) '};']);
        
        i=i+round(CM(i,2)+1);
    end
end

