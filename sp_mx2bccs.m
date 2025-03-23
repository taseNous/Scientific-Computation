function [val,brow_idx,bcol_ptr]= sp_mx2bccs(A,nb)
%Author: Α. ΒΕΝΟΣ, AM 1067536, Date:13/1/2022

    A=[1 0 0 0 3 4; 0 7 0 0 7 0; 0 0 1 5 0 0; 0 0 0 8 0 0; 7 5 0 0 2 0; 0 1 0 0 8 3]
    if nb==2
        fprintf("val = ")
        for i=1:2:size(A,2)-1
            for j=1:2:size(A,2)-1
                W=A(j:j+1,i:i+1);
                nonZeroIndices = W ~= 0;
                val = W(nonZeroIndices);
                fprintf(' %d ',val);
            end
        end
        
        latex_table = latex(sym(val))
        
    else
    end
    
    if nb==3
        for i=1:3:size(A,2)-2
            for j=1:3:size(A,2)-2
                W=A(j:j+2,i:i+2);
                nonZeroIndices = W ~= 0;
                val = W(nonZeroIndices);
                fprintf(' %d ',val);
            end
        end
    else
    end
end