src =
["/home/romsim/workspace/scilab/"];                                      
// path

files =list("qbas", "qges",
"etr");                                                         // files
to be read

for
i=1:length(dateien)                                                                      
// for file in files...
  a_src = [src  + files(i) +
".dat"];                                                        //
building current path
  myfile = mopen(a_src ,
"r");                                                              //
open file
  mgetl (myfile,
3);                                                                              
// reading first three rows (header)
  data = mfscanf(-1, myfile, "%i %i %i %i %e
%e");                           // reading data (six columns; the first
four are for the date)
  if i==1
then                                                                                      
// the first file gives the info for the date (it's the same for all files)
    y = data(:,1);                     // year
    m = data(:,2);                    // month
    d = data(:,3);                     // day
    t = data(:,4);                      // time
   
    dates = datenum(y, m, d)
;                                                            // building
date (serial)
    all =
[dates];                                                                                    
// initialising the main matrix
end

  all = [all, data(:,5)];         // appending the data from current file
   
 
mclose(myfile);                                                                                
// close file
end

plot(all(:,1), [all(:,2), all(:,3),
all(:,4)])                                                  // plotting
h =
gca();                                                                                          
// getting a handle on the axis entities
v1 =
h.x_ticks;                                                                                
// reading x-ticks
v_dat =
datevec(v1(2));                                                                  
// extracting and reformatting date
v_dat = [string(v_dat(:,2))
string(v_dat(:,1))];                                  // preparing
string-vector

v_neu=[];                                                                                          
// initialising new x-tick-vector
s=size(v_dat);                                                                                  
// reading vector-size
for k=1:s(1)  v_neu=[v_neu  v_dat(k,1) + "/" + v_dat(k,2)]; end     //
building new x-tick-vector
h.x_ticks.labels =
v_neu;                                                                
// set new x-tick-values

DateVector = [2009,4,2,11,7,18];
datestr(DateVector)
