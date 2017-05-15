//Equations différentielles
// ---------- EDO Simple  (external : code C)
ccode=['#include <math.h>'
       'void myode(int *n,double *t,double *y,double *ydot)'
       '{'
       '  ydot[0]=y[0]*y[0]-y[0]*sin(*t)+cos(*t);'
       '}']
mputl(ccode,TMPDIR+'/myode.c') //create the C file
ilib_for_link('myode','myode.c',[],'c',TMPDIR+'/Makefile',TMPDIR+'/loader.sce');//compile
exec(TMPDIR+'/loader.sce') //incremental linking
y0=0;t0=0;t=0:0.1:%pi;
y=ode(y0,t0,t,'myode');

// ---------- Simulation de dx/dt = A x(t) + B u(t) avec u(t)=sin(omega*t),
// x0=[1;0]
// solution x(t) desired at t=0.1, 0.2, 0.5 ,1.
// A and u function are passed to RHS function in a list. 
// B and omega are passed as global variables
function xdot=linear(t, x, A, u),xdot=A*x+B*u(t),endfunction
function ut=u(t),ut=sin(omega*t),endfunction
A=[1 1;0 2];B=[1;1];omega=5;
ode([1;0],0,[0.1,0.2,0.5,1],list(linear,A,u))

// ----------Integration de l'équation différentielle de Riccati (état matriciel)
// Xdot=A'*X + X*A - X'*B*X + C , X(0)=Identity
// Solution at t=[1,2] 
function Xdot=ric(t, X),Xdot=A'*X+X*A-X'*B*X+C,endfunction  
A=[1,1;0,2]; B=[1,0;0,1]; C=[1,0;0,1];
t0=0;t=0:0.1:%pi;
X=ode(eye(A),0,t,ric)

//Equations différetielles
function y1=f(t,y),y1=[0 -1;1 0]*y,endfunction;
t=linspace(0,2*%pi);y=ode([1;0],0,t,f);
norm(y(1,:)-cos(t))

