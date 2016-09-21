function setDataCursorFont(figureHndl, fontSize)
    %%sets the data cursor of the figureHndl to fontSize
    %%see: http://undocumentedmatlab.com/blog/controlling-plot-data-tips
    %%http://www.mathworks.com/matlabcentral/answers/95968-how-can-i-set-the-text-font-style-of-a-data-cursor-object
%     cursorMode=datacursormode(figureHndl)
%     set(cursorMode.CurrentDataCursor, 'FontSize', fontSize)
    set(findall(figureHndl, 'type', 'hggroup'),'FontSize', fontSize)
    