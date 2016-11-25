function diffsGrouping=generalUniqueID(diffFeat, clsMergeSz, sortEdgesByWeight)
    if size(diffFeat,2)==0
        error('size errord: diffFeat is empty in countDiffsGeneral')
    else
        
    end
return

function diffsGrouping=countDiffsGeneral_R(diffFeat,clsMergeSz, sortEdgesByWeight, returnableBuild, returnableCell)    
    % assign uniue numbers to every unique feature set.
    % most of the logic can just copy-paste countDiffs
    if size(diffFeat,2)==1
        [uniqueFeat,uniqueDiffFeatIndx, ~]=unique(diffFeat);
        counts=accumarray(uniqueFeat,1);
        diffsGrouping=cell(size(diffFeat,1),3);
        for indx=1:size(uniqueFeat,1)
            diffsGrouping{indx,1}= indx; % unique identifier array. Build up recursively. TODO: speed up by preallocating
            diffsGrouping{indx,2}= uniqueFeat(indx,:); % the identity of the element. Buid up recursively. TODO: speed up by preallocating
            diffsGrouping{indx,3}= counts(indx);% count. fixed at this point.
        end
        return 
    else
        % http://stackoverflow.com/questions/5641111/split-a-matrix-by-value-in-matlab
        % take out the first column, recall witht he array borken into
        % sub-units. if run out of elements to take out, find all the unique
        % elemetns and add up to create hte count. send information back with returnVect and
        % add to returnCell

        % inputs:
        % outputs: 
        sorted=sortrows(diffFeat,1);
        [~,~,uniqIndx]=unique(sorted(:,1));
        cellLoc=accumarray(uniqIndx(:),1);
        uniqCells=mat2cell(sorted, cellLoc ,size(difFeat,2));
        for uniqValIndx=1:size(uniqCells,1)
            diffsGrouping=countDiffsGeneral_R(uniqCells{uniqValIndx},clsMergeSz, sortEdgesByWeight, returnableBuild, returnableCell);

        end

        % undo sort
    end
return
