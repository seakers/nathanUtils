function [ret]=compareVersionNum(versionA, versionB)
% use version() function to get current version
versionNum=regexp({versionA, versionB}, '[r,R]\d\d\d\d[a,b]','match');

if numel(versionNum{1})~=1
    error('unexpected number of matches in argument version A for strings like "r2013a"');
end
if numel(versionNum{2})~=1
    error('unexpected number of matches in argument version B for strings like "r2013a"');
end

vA=versionNum{1}{1}; vB=versionNum{2}{1};
% assert length of vA and vB is 6 characters.
yearA=str2num(vA(2:5)); yearB=str2num(vB(2:5));
if yearA<yearB
    ret= -1;
    return
elseif yearA>yearB
    ret= 1;
    return
else
    ret=vB(6)-vA(6);
    return
end