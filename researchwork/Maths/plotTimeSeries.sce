data=read_csv('sample.txt','|');
data=evstr(data);

close();    // close figure created at last run to avoid error in evstr()
//plot(data(:,1),data(:,2),data(:,1),data(:,3),[data(1,1),data($,1)],[40,40]);
plot(data(:,1),data(:,2),data(:,1),data(:,3));
//legend("RH","Temp","RH EUSAAR criterion");
legend("RH","Temp");
xtitle("RH/T vs. time (I did it !)","UTC","%RH / °C");
a=gca();
col=color("grey");
a.grid=[col col];

vStamp=evstr(a.x_ticks.labels);
[nr,nc]=size(vStamp);
labels=[];
for i=1:nr
    stamp=getdate(vStamp(i,1));
    s1=msprintf("%d-%02d-%02d",stamp(1),stamp(2),stamp(6));      // yyyy-mm-dd
    s2=msprintf("%02d:%02d:%02d",stamp(7),stamp(8),stamp(9));    // hh:mm:ss
    strStamp="$ \begin{matrix}\text{"+s1+"}\\ \text{"+s2+"}\end{matrix} $";    // "Latex trick" : 2-line label
    labels=[labels;strStamp];
end

a.x_ticks.labels=labels;
