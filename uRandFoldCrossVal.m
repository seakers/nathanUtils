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
%%whichFold is the fold number for an indexed object, cell array as objects
%%might be in multiple folds. empty entries denote not present in any fold.
%%<><><><>
%%right now thi is just kFoldCrossVal with allowed repetitions. 
%%TODO: enable arbitrary resampling (including more than numObj)
%%TODO: randoly allocate balance of folds.
function [folds,whichFold]=uRandFoldCrossVal(numObj,numFold,classes)
classVals=unique(classes);

clsSizes=arrayfun(@(cls) sum(classes==cls),classVals,'UniformOutput',true);

indxs=1:numObj;
clsIndxs=arrayfun(@(cls) indxs(classes==cls),classVals,'UniformOutput',false);
clsSelect=arrayfun(@(indx) randi(clsSizes(indx),clsSizes(indx),1),1:length(classVals),'UniformOutput',false);

clsPermIndxs=cell(size(clsSelect));
for indx=1:length(clsIndxs)
    thisClsIndx=clsIndxs{indx};
    clsPermIndxs{indx}=thisClsIndx(clsSelect{indx});
end

folds=cell(numFold,1);
for(indx=1:length(folds))
    folds{indx}=nan(floor(numObj/numFold)+(indx<=mod(numObj,numFold)),1); % wrong, apparently. Try 1683, 10 with funny unbalanced classes.
end
    
totalLeft=sum(clsSizes);
fillLevelFold=ones(numFold,1);
clsFillLevel=1;
whichFold=cell(numObj,1);
while totalLeft>0
    for foldIndx=1:numFold
        thisFold=folds{foldIndx};
        
        for clsIndx=1:length(classVals)
            thisCls=clsPermIndxs{clsIndx};
            if(clsFillLevel<=length(thisCls))
                placeObj=thisCls(clsFillLevel);
                thisFold(fillLevelFold(foldIndx))=placeObj;
                whichFold{placeObj}=[whichFold{placeObj},foldIndx];
                fillLevelFold(foldIndx)=fillLevelFold(foldIndx)+1;
                totalLeft=totalLeft-1;
            end
        end
        folds{foldIndx}=thisFold;
        clsFillLevel=clsFillLevel+1;
    end
end

for(indx=1:length(folds))
    tmp=folds{indx};
    tmp=tmp(~isnan(tmp));
    folds{indx}=tmp;
end

return