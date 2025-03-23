function [val,row_ip,col_ip] = sp_mat2latex(A,sp_type)
%Author: Α. ΒΕΝΟΣ, AM 1067536, Date:13/1/2022

    A=[1 0 0 3; 0 7 2 0; 1 0 0 5; 0 8 6 0]
    if sp_type=='csr'
        %Emfanizei val kai tis times tou pinaka A
        fprintf('val  = ');
        for i=1:size(A,1)
            W=A(i,:);
            nonZeroIndices = W ~= 0;
            val1 = W(nonZeroIndices);
            val2(:,i)=val1;
            fprintf(' %d ',val1);
        end
        val = reshape(val2,1,[]);
        latex_table = latex(sym(val))
        
        %Emfanizei col_ip kai se poia sthlh einai ka8e stoixeio
        fprintf('\ncol_ip =');
        for i=1:size(A,1)
            W=A(i,:);
            %nonZeroIndices=0;
            nonZeroIndices = W ~= 0;
            [row_ip, col_ip1] = find(nonZeroIndices);
            col_ip2(:,i)=col_ip1;
            fprintf(' %d ',col_ip1);
            %disp(nonZeroIndices)
        end
        col_ip = reshape(col_ip2,1,[]);
        latex_table = latex(sym(col_ip))
        
        %Emfanizei row_ip kai se poia grammh einai ka8e stoixeio
        fprintf('\nrow_ip =');
        for i=1:size(A,1)
            W=A(i,:);
            nonZeroIndices = W ~= 0;
            [row_ip, col_ip] = find(nonZeroIndices);
            fprintf(' %d ',row_ip);
        end
        
    elseif sp_type=='csc'
        %Emfanizei val kai tis times tou pinaka A
        for i=1:size(A,1)
            W=A(i,:);
            nonZeroIndices = W ~= 0;
            val1 = W(nonZeroIndices);
            val2(i,:)=val1;
            %fprintf(' %d ',val1);
        end
        val = reshape(val2,1,[]);
        latex_table = latex(sym(val))
        
        
        %Emfanizei col_ip kai se poia sthlh einai ka8e stoixeio
        fprintf('\ncol_ip =');
        for i=1:size(A,2)
            W=A(:,i);
            nonZeroIndices = W ~= 0;
            [col_ip, row_ip] = find(nonZeroIndices);
            fprintf(' %d ',row_ip);
        end
        
        %Emfanizei row_ip kai se poia grammh einai ka8e stoixeio
        fprintf('\nrow_ip =');
        for i=1:size(A,2)
            W=A(:,i);
            nonZeroIndices = W ~= 0;
            [row_ip1, col_ip] = find(nonZeroIndices);
            row_ip2(:,i)=row_ip1;
            fprintf(' %d ',row_ip1);
        end
        row_ip = reshape(row_ip2,1,[]);
        latex_table = latex(sym(row_ip))
        
    else
        fprintf('Invalid input, please try again');
    end
end