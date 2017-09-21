function vect=makeColumnVect(vect)
    [n,m]=size(vect);
    if n==1
        if m~=1
            vect=vect';
        end
    elseif m~=1
        error(['input something not a vector into makeColumnVect; size of input is: ',num2str(size(vect))]);
    end
return