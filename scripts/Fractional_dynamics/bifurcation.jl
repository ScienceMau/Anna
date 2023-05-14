using FdeSolver, Plots, DelimitedFiles, MAT, Printf


function text_screen(text)
	
	for i in text
	print(i)		
	sleep(0.05)
	end
end

function F(t, y, par)

    a     = 1.6;
    omega = 1.0;
    r     = 0.1;
    b     = 0.05;
    c     = 0.35;
    e     = 0.0001;
    p     = par[1];
    f0    = 0.2;
    d     = 4/27;
    beta  = 0.05;


	F1 = y[2];
 	F2 = -r*y[2]-b*y[1]-c*y[1]^3+(e/((a+y[1])^8))-(d/((a+y[1])^2))-(p*y[2]/((a+y[1])^3))+beta/((a+y[1])^4)+f0*cos(omega*t);
	
	return [F1,F2]

end

@inline @inbounds function bif(X, var)

A=Float64[];
B=Float64[];
C=Float64[];
a1=length(X);
a2=Int(round(0.9*a1))
	for i=a2:1:(a1-1)
		if(X[i]>X[i-1] && X[i]>X[i+1])
			push!(A,X[i])		
		end
	end

	for k=1:1:length(A)
		push!(B,var)		
	end


	C=[A, B]

	return C
end

q2 = range(0.75,1.0,length=1000)
tSpan = [0, 500]
y0    = [0.0, 0.0]
par   = [ 0.00001 ]
X1 = Any[];
for i= 1:length(q2)

    alpha = [1.0, q2[i]]
    t, tr = FDEsolver(F, tSpan, y0, alpha, par, h = 0.01, nc =3, tol =1e-9)
	append!(X1,bif(tr[:,1],q2[i]))
    println(i)
end

##################################################
#  Organize the arrays for Diagrama Bifurcation
##################################################



A=Any[];
B=Any[];

for k=1:1:Int(length(X1)/2)

	append!(A,X1[2*k])
	append!(B,X1[2*k-1])
end

###########################
# Figure and .mat output
###########################

writedlm("bifurcation.txt", [A B])

matwrite("_bifurcation_.mat", Dict(
	"A1" => collect(A),
	"A2" => collect(B),
))

text_screen("######################################\n")
text_screen("## Developed by:Mauricio A. Ribeiro ##\n")
text_screen("## Email:mau.ap.ribeiro@gmail.com   ##\n")
text_screen("######################################\n")
