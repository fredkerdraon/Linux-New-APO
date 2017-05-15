// ---------- Calcul de exp(A)  (état matriciel)
A=[1,1;0,2];
function xdot=f(t, x),xdot=A*x;,endfunction 
ode(eye(A),0,1,f)
ode("adams",eye(A),0,1,f)

// ----------  Calcul de exp(A)  (état matriciel, cas raide, jacobien fourni)
A=[10,0;0,-1];
function xdot=f(t, x),xdot=A*x,endfunction 
function J=Jacobian(t, y),J=A,endfunction 
ode("stiff",[0;1],0,1,f,Jacobian)
exit
