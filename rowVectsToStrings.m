function strs=rowVectsToStrings(rowVects)
%     cellVects=mat2cell(rowVects, ones(size(rowVects,1),1),size(rowVects,2));
    cellVects=num2cell(rowVects,2);
    strs=cellfun(@num2str, cellVects, 'UniformOutput',false);