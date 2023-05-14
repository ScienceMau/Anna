using FdeSolver, Plots, DelimitedFiles, MAT, Printf, Statistics, SharedArrays



function text_screen(text)
	
	for i in text
	print(i)		
	sleep(0.05)
	end
end

function kmedian(x)

    s = length(x);
    if s[1]==1;
        x = x'
    end

    N = length(x);
    j = 1:N;
    t = 1:round(N/10);
    M = zeros(Int(round(N/10)));
    c = 0.0.+rand(100)*pi;

    p = Any[];
    q = Any[];
    kcor = zeros(100); 
      

    for k = 1:1:100
        p = cumsum(x.*cos.(j*c[k]))
        q = cumsum(x.*sin.(j*c[k]))
        for n =1:1:Int(round(N/10))
            M[n] = mean( (p[n+1:N]-p[1:N-n]).^2 + (q[n+1:N]-q[1:N-n]).^2 )-mean(x)^2*(1-cos(n*c[k]))/(1-cos(c[k]));
           
        end
        kcor[k] = cor(t, M)
    end
   
    km = mean(kcor);
    if km < 0
       km = 0;
    end
    if km > 1
       km = 1;
    end
    return km;
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
a2=Int(round(0.8*a1))
	for i=a2:1:(a1-1)
		if(X[i]>X[i-1] && X[i]>X[i+1])
			push!(A,X[i])		
		end
	end

	for k=1:1:length(A)
		push!(B,var)		
	end

	return A
end

q2 = range(0.75,1.0,length=1000)
tSpan = [0, 1000]
y0    = [0.0, 0.0]
par   = [ 0.00001 ]
KM = SharedArray{Float64}(length(q2));

for i= 1:length(q2)

    alpha = [1.0, q2[i]]
    t, tr = FDEsolver(F, tSpan, y0, alpha, par, h = 0.01, nc =3, tol =1e-9)
	KM[i] = kmedian(bif(tr[:,1],q2[i]))
    println(i)
end


writedlm("01-Test-Frac.txt", [q2 KM])

matwrite("_01-Test-Frac_.mat", Dict(
	"q" => collect(q2),
	"t01" => collect(KM),
))

text_screen("######################################\n")
text_screen("## Developed by:Mauricio A. Ribeiro ##\n")
text_screen("## Email:mau.ap.ribeiro@gmail.com   ##\n")
text_screen("######################################\n")
