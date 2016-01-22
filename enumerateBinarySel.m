%%enumerates the space of {0,1}^(len) vectors. useful when don't have
%%communications toolbox and hence de2bi(0:2^(len-1)) doesn't work.
function space=enumerateBinarySel(len)
space=reshape(str2num(reshape(dec2bin(0:(2^len-1)),len*2^len,1)),2^len,len);
return