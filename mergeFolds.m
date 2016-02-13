function [merged]=mergeFolds(toMerge,folds)
merged=cell(length(toMerge),1);

[foldSizeM,foldSizeN]=cellfun(@size,folds,'UniformOutput',true); %foldSizeM is incase ever get manual and start filling and need to pre-allocate.

if(any(foldSizeN>1))
    error('do not yet support folds being listed as column vectors');
end

horFolds=cellfun(@(fld) reshape(fld,1,numel(fld)),folds,'UniformOutput',false);

for(indx=1:length(toMerge))
    mergeArray=toMerge{indx};
    
    merged{indx}=[horFolds{mergeArray}]'; %YAY MATLAB SYNTAX!!! merges things horizontally...apparently.
end