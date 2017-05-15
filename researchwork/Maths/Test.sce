//EOMDAY End of month.
//  D = EOMDAY(Y,M) returns the last day of the month for the given
//  year, Y, and month, M.
//  Algorithm:
//    "Thirty days hath September, ..."
//
//  See also WEEKDAY, DATENUM, DATEVEC.

function d = eomday(y, m)

if argn(2)==1
  m = y(:, 2);
  y = y(:, 1);
end

// Number of days in the month.
dpm = [31 28 31 30 31 30 31 31 30 31 30 31]';

// Make result the right size and orientation.
d(:) = dpm(m);
d((m==2) & ((pmodulo(y,4)==0 & pmodulo(y,100)~=0) | pmodulo(y,400)==0)) = 29;

endfunction

function [d, w] = weekday(t, old)

  if argn(2)==1 then
    old = 0;
  end
 
  if size(t, 2) > 1 then
    select size(t,2)
      case 3
      case 5
        t = [t, zeros(t(:,1))];
      case 6
      else
        error("T must have 1, 3, 5, or 6 columns.")
    end
    t = datenum(t);
  end

  if old then
    week = [ "Sun" ; "Mon" ; "Tue" ; "Wed" ; "Thu" ; "Fri" ; "Sat"];
    d = pmodulo(fix(t)-2, 7) + 1;
  else
    week = ["Mon" ; "Tue" ; "Wed" ; "Thu" ; "Fri" ; "Sat"; "Sun"];
    d = pmodulo(fix(t)-3, 7) + 1;
  end  
 
  if argn(1)==2
    w = week(d);
  end

endfunction

function weektick(ax)
//WEEKTICK(AX, 'XY')
// Set XTick at each Monday and XTickLabel as "mm-dd" in axes AX - default gca()

if argn(2)==0 then
  ax = gca();
elseif argn(2)>1
  error("There may be at most one input argument.")
end

t = ax.data_bounds(:,1);
t = (ceil(t(1)):floor(t(2)))';

n = weekday(t);

// Mondays
t = t(n==1);

tl = datestr(t, 3);  // "yyyy-mm-dd"
tl = part(tl, 6:10); // "mm-dd"

ax.x_ticks = tlist(["ticks","locations","labels"], t, tl);

endfunction

function dv = trimdv(dv, integersec)

if argn(2)==1
  integersec = 0;
end

if size(dv, 2)==6 then
  if integersec
    dv(:, 6) = round(dv(:, 6));
  else
    err = ceil(dv(:, 6))-dv(:, 6);
    errindex = err>0 & err<0.000005;
    dv(errindex, 6) = dv(errindex, 6) + 0.000005; // 0 to 5 microsec
  end
  minadd = floor(dv(:, 6)/60);
  dv(:, 5) = dv(:, 5) + minadd;      
  dv(:, 6) = dv(:, 6) - minadd*60;
end
if size(dv, 2)>4 then
  hhadd = floor(dv(:, 5)/60);
  dv(:, 4) = dv(:, 4) + hhadd;      
  dv(:, 5) = dv(:, 5) - hhadd*60;

  ddadd = floor(dv(:, 4)/24);
  dv(:, 3) = dv(:, 3) + ddadd;      
  dv(:, 4) = dv(:, 4) - ddadd*24;
end

eday = eomday(dv(:,1), dv(:,2));
decmon = find(dv(:, 3) < 1);              // newmon
dv(decmon, 2) = dv(decmon, 2) - 1;

incmon = find(dv(:, 3) > eday);
dv(incmon, 3) = dv(incmon, 3) - eday(incmon);
dv(incmon, 2) = dv(incmon, 2) + 1;

decyr = find(dv(:, 2) < 1);
dv(decyr, 2) = dv(decyr, 2) + 12;
dv(decyr, 1) = dv(decyr, 1) - 1;
incyr = find(dv(:, 2) > 12);
dv(incyr, 2) = dv(incyr, 2) - 12;
dv(incyr, 1) = dv(incyr, 1) + 1;

dv(decmon, 3) = dv(decmon, 3) + eomday(dv(decmon,1), dv(decmon,2));

endfunction 

function str = datestr(t, n)
 
  if ~exists("n", "local")
    n = 5;
  end
  tlen = size(t, 2);
  str = "";
 
  select tlen
    case 1
      t = datevec(t);
      tlen = 6;
    case 3
    case 5
    case 6
  else
    error("T must have rows of length 1, 3, 5, or 6.")
  end
 
  t = trimdv(t);

  if n<tlen then
    t(:,n+1:$) = [];
  elseif n>tlen then
    t(:,$+1:n) = zeros(size(t,1),n-tlen);
  end  

  select n
    case 3
      str = msprintf("%4i-%02i-%02i\n", t(:, 1:3));
    case 5
      str = msprintf("%4i-%02i-%02i %02i:%02i\n", t(:, 1:5));
    case 6
      str = msprintf("%4i-%02i-%02i %02i:%02i:%02i\n", t(:, 1:6));
    else
      error("n must be 3, 5, or 6.")
  end

endfunction 

years = [2001; 2001; 2002; 2002; 2003; 2003];
months = [1 7 1 7 1 7];
days = ones(1,6);

for k = 1:6
	years(k)
	months(k)
	days(k)
  dates(k) = datenum(years(k), months(k), days(k));
end

dates

plot(dates, 100 + 20*rand(1,6), 'o')

gca = gca()
labels = datestr(dates, 3);
set(gca, 'XTick', dates);
labels_2 = datevec(dates);
//set(gca, 'XTickLabel', labels_2);
set(gca, 'XTickLabel', labels);

xlabel('Date')
ylabel('Sales')
title('Example of Date Axis')



