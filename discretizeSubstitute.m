%%essentially MATLAB 2015a discretize
%%assumes vector inputs x, binEdges
function binIndxs=discretizeSubstitute(x,binEdges)
binIndxs=NaN(length(x),1);
for(indx=1:(length(binEdges)-1))
    binIndxs(binEdges(indx)<=x<binEdges(indx+1))=indx;
end
return