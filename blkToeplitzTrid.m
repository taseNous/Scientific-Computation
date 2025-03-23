function [X] = blkToeplitzTrid(n,B,A,C)
%Author: Α. ΒΕΝΟΣ, AM 1067536, Date:13/1/2022

%arxikopoihsh mhtrwwn
A = [1 1; 1 1];
B = [2 2; 2 2];
C = [3 3; 3 3];

rows = size(A,1);
toepSize = rows*n;
X = zeros(toepSize,toepSize);

for i = 1:rows
    for j = 1:rows
        for w = 0:n-1
            X(i + rows*w,j + rows*w) = A(i,j);
            if(w<n-1)
            X(i + rows*w,j + rows + rows*w) = C(i,j);
            X(i + rows + rows*w, j + rows*w) = B(i,j);
            end
        end 
   end
end

latex_table = latex(sym(X))

end