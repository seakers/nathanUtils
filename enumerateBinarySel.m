%enumerates the space of {0,1}^(expo) vectors. useful when don't have
%communications toolbox and hence de2bi(0:2^(expo-1)) doesn't work.
function space=enumerateBinarySel(expo)
space=reshape(str2num(reshape(dec2bin(0:(2^expo-1)),expo*2^expo,1)),2^expo,expo);
return