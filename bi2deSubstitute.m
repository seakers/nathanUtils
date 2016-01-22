%%turns binary row vectors into decimal numbers.
function [nums] = bi2deSubstitute(binaries)
binaryKeys=repmat(2.^(0:(size(binaries,2)-1)),size(binaries,1),1);
nums=sum(binaryKeys.*binaries,2);
end

