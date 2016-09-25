function [normalizedAxisCoor]=coor3dToNormAxes(pts) % that's a terrible name.
%

% see: https://www.mathworks.com/matlabcentral/answers/248362-screen-2d-projection-of-3d-plot
% and the two functions it uses:
% http://www.mathworks.com/help/matlab/ref/viewmtx.html
% http://www.mathworks.com/help/matlab/ref/makehgtform.html
%% get locations of limits for rescaling
XLim=get(gca(),'XLim');
YLim=get(gca(),'YLim');
ZLim=get(gca(),'ZLim');
[XL,YL,ZL]=meshgrid(XLim, YLim, ZLim);
vtxs=[XL(:),YL(:),ZL(:)];

boxVertexs2d=transPoints(vtxs);
axMins=min(boxVertexs2d,[],1);
axRanges=range(boxVertexs2d,1);

pointLocs=transPoints(pts);
normalizedAxisCoor=(pointLocs-repmat(axMins,size(pointLocs,1),1))./repmat(axRanges,size(pointLocs,1),1);
return 

function locs2d=transPoints(pts)
projMat=view()*makehgtform('scale',1./daspect());
pts2=(projMat*[pts,ones(size(pts,1),1)]')';
locs2d=pts2(:,1:2)./repmat(pts2(:,4),1,2);
return 