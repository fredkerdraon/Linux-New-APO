fd=mopen(TMPDIR+'/Mat','w');
mfprintf(fd,'Some text.....\n');
mfprintf(fd,'Some text again\n');
a=rand(6,6);
for i=1:6 ,
  for j=1:6, mfprintf(fd,'%5.2f ',a(i,j));end;
  mfprintf(fd,'\n'); 
end
mclose(fd);
a1=fscanfMat(TMPDIR+'/Mat');
printf(TMPDIR);
//printf('%f',a1);
a1;
deviation=stdev(a1);
deviation
//var(a1);
//newBPolynomial.f(2, 0, -3, -1);
//draw f.getPath(-2, 2) transformed T;
//PV=100
//y=6/100
//T=10
//FV=PV*(1+y)^T



