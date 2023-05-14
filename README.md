# Anna
![twitter_header_1500x500](https://github.com/ScienceMau/Anna/assets/61286097/2bee5b71-544f-4d9b-92f7-a80fe917933f)


O projeto é para determinar a dinâmica não linear de sistemas fracionários aplicados em diversas áreas da ciência. Exemplo na física, química, biologia e nas engenharias. Os scripts disponibilizados aqui são descritos em linguagem Julia para o processamento dos dados e o Python para construir os gráficos dos resultados obtidos. Dessa forma, For better performance of the created scripts we indicate:

[![Blog](https://img.shields.io/badge/Julia%20Lang-Download-red?style=for-the-badge)](https://julialang.org/)
[![Blog](https://img.shields.io/badge/Ubuntu-Download-orange?style=for-the-badge)](www.ubuntu.org)
[![Blog](https://img.shields.io/badge/Python-Download-blue?style=for-the-badge)](www.python.org)

No entanto, o script podem ser utilizado em qualquer SO que possa rodar IDLE da linguagem Julia Lang, para a instalação da linguagem segue os passos:

## Installation

### Linux

Open a new terminal and type the commands:

To download Julia Lang's installation packages: `wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.2-linux-x86_64.tar.gz`

To extract .tar.gz: `tar -xvzf julia-1.8.5-linux-x86_64.tar.gz`

Copy and extract the folder to /opt: `sudo cp -r julia-1.8.5 /opt/`

Finally, create a symbolic link to julia inside the /usr/local/bin folder: `sudo ln -s /opt/julia-1.8.5/bin/julia/local/bin/local`

So, if everything went well, just type julia in your terminal and the interpreter starts working. Once that's done, just use the command in julia's terminal to install the necessary packages for the PAP scripts to work: `using Pkg; Pkg.add("Package Name");`

### Windows
 
For installation on Windows systems, just download from <a href="https://julialang.org/"><img align = "center" alt= "julia-lang" heigth = "50" width="70" src= "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/julia/julia-original-wordmark.svg" style="max-width100%;"/></a> the .exe for the system Windows operating system and follow the steps indicated by the app. And then click on the icon on your Desktop and install the libraries. To do so, just type in Julia's terminal: `using Pkg; Pkg.add("Package Name");`

### Ubuntu
For installation in particular use the command: `sudo snap install julia -classic`


### Packages

For its use it is necessary to install the following packages:
<ul>
<li><a href="https://docs.julialang.org/en/v1/manual/distributed-computing/">Distributed</a></li>
<li><a href="https://juliadynamics.github.io/DynamicalSystems.jl/dev/">Dynamical System</a></li>
<li><a href="https://docs.julialang.org/en/v1/stdlib/SharedArrays/">SharedArrays</a></li>
<li><a href="https://github.com/JuliaIO/MAT.jl">MAT</a></li>
<li><a href="https://docs.julialang.org/en/v1/stdlib/Statistics/">Statistics</a></li>
<li><a href="https://github.com/SciML/OrdinaryDiffEq.jl">OrdinaryDiffEq</a></li>
 <li><a href="https://docs.julialang.org/en/v1/stdlib/DelimitedFiles/">DelimitedFiles</a></li>
 <li><a href="https://github.com/JuliaTurkuDataScience/FdeSolver.jl">FdeSolver</a></li>
</ul>


## Codes 

### Julia Script

1. **01_test_frac.jl** : Calculate the 01-Test for fractional ordinary diferential equation. 

2. **bifurcation.jl** : Calculate the bifurcation diagram for fractional ordinary diferential equation.

### Python Script

1. **1_plot_01-test.py** : 
 
 Generate the 01-Test Plot

![01-test](https://github.com/ScienceMau/Anna/assets/61286097/7cd99f8c-7463-48d9-97b7-ac87420eee14)


2. **2_plot_bifurcation.py** 

Generate the Bifurcation Diagram Plot

![bifurcation](https://github.com/ScienceMau/Anna/assets/61286097/005ca912-9866-402e-81d7-dc343a26a421)

## Image example


The figure represents the behavior of the 01-Test that describes an estimate of fractional nonlinear dynamics based on fractional derivative operators applied to a set of differential equations.

![Km_2D](https://github.com/ScienceMau/Anna/assets/61286097/642435a7-0fde-4bce-9ba4-58adc649d77b)




## Publication

