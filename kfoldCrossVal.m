%%produces a cell array of size numFold which contains indicies for the
%%fold for the cross-validation set of size numObj
%%elements are chosen to balance classes in each fold as much as possible.
%%folds is a cell array of length numFold with approximately the same
%%number of elements in each cell (can be different if numObj is not
%%divisible by numFold). folds elements are indicies of the set of elements
%%that goes 1:numObj
%%invFolds gives the indicies 
%%permMixer is the permutation array. put another way, if i is the ith
%%object originally, f_i is the number in the fold
% function [folds,permMixer,invPermMixer]=kfoldCrossVal(numObj,numFold,classes)
function [folds]=kfoldCrossVal(numObj,numFold,classes)
classVals=unique(classes);

clsSizes=arrayfun(@(cls) sum(classes==cls),classVals,'UniformOutput',true);

indxs=1:numObj;
clsIndxs=arrayfun(@(cls) indxs(classes==cls),classVals,'UniformOutput',false);
clsPerm=arrayfun(@(indx) randperm(clsSizes(indx)),1:length(classVals),'UniformOutput',false);

clsPermIndxs=cell(size(clsPerm));
for indx=1:length(clsIndxs)
    thisClsIndx=clsIndxs{indx};
    clsPermIndxs{indx}=thisClsIndx(clsPerm{indx});
end

folds=cell(numFold,1);
for(indx=1:length(folds))
    folds{indx}=nan(floor(numObj/numFold)+(indx<=mod(numObj,numFold)),1);
end
    
totalLeft=sum(clsSizes);
fillLevelFold=ones(numFold,1);
clsFillLevel=1;
while totalLeft>0
    for foldIndx=1:numFold
        thisFold=folds{foldIndx};
        
        for clsIndx=1:length(classVals)
            thisCls=clsPermIndxs{clsIndx};
            if(clsFillLevel<=length(thisCls))
                thisFold(fillLevelFold(foldIndx))=thisCls(clsFillLevel);
                fillLevelFold(foldIndx)=fillLevelFold(foldIndx)+1;
                totalLeft=totalLeft-1;
            end
        end
        folds{foldIndx}=thisFold;
        clsFillLevel=clsFillLevel+1;
    end
end

return