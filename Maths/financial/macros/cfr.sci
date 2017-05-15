function [S]=cfr(varargin);
  
// PURPOSE: Compare two or more time series and eliminate
//          the data whose date is not in all the series
//---------------------------------------------------------
// INPUT:  
// As many two-clumn matrix as time series. The first column
// of any matrix must contain the dates, the second column
// must contain the data
// -------------------------------------------------------------
// OUTPUT:
// * S = a matrix containing the dates in the first clumn and
//       the times series in all the other columns
// -------------------------------------------------------------
// Francesco Menoncin (2010)

function [z]=cfr2(x,y);
z=[];
for i=1:size(x,1)
  [r,c]=find(y==x(i,1));
  if r<>[] then z=[z; x(i,:), y(r,2)]; else end;
end
endfunction

S=varargin(1);
for k=2:size(varargin)
  S=cfr2(S,varargin(k));
end;

endfunction
