import matplotlib.pyplot as plt
import matplotlib
import numpy as np

plt.rcParams['text.usetex'] = True
#plt.rcParams['figure.figsize'] = [12, 12]
plt.rcParams.update({'font.size':18})

vec = np.loadtxt('01-Test-Frac.txt',dtype='float')

plt.plot(vec[:,0],vec[:,1], color='black')
plt.xlabel(r'$\alpha_2$')
plt.ylabel(r'$K_m$')
plt.grid(color='gray', linestyle='-', linewidth=0.1)
plt.show()
