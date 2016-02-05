%%turns binary row vectors into decimal numbers.
%%little endian (left-msb)
function [nums] = bi2deSubstitute(binaries)
binaryKeys=repmat(2.^(0:fliplr(size(binaries,2)-1)),size(binaries,1),1);
nums=sum(binaryKeys.*binaries,2);
end

