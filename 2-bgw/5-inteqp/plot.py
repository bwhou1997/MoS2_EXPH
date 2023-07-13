import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt

data = np.loadtxt('bandstructure.dat')
bands = data[:,1]
kpts = data[:,2:5]
emf = data[:,5]
eqp = data[:,6]
emf -= np.amax(emf[bands==26])
eqp -= np.amax(eqp[bands==26])

def get_x(ks):
    # X axis is \int_0^k |dk|
    global dk_len
    dk_vec = np.diff(ks, axis=0)
    dk_len = np.linalg.norm(dk_vec, axis=1)
    return np.insert(np.cumsum(dk_len), 0, 0.)

xmin, xmax = np.inf, -np.inf
bands_uniq = np.unique(bands).astype(int)
f = open("band.dat","w")
for ib in bands_uniq:
    cond = bands==ib
    x = get_x(kpts[cond])
    xmin, xmax = min(xmin, x[0]), max(xmax, x[-1])
#    lmf, = plt.plot(x, emf[cond], '--', color='b', lw=1.5, zorder=2)
#    lqp, = plt.plot(x, eqp[cond], '-', color='r', lw=1.5, zorder=1)
    for i_n in range(len(x)):
        f.write("%.9f %.9f %.9f \n" % (x[i_n], emf[cond][i_n], eqp[cond][i_n]))
    f.write("\n")
f.close()
def to_mathrm(s):
    return r'$\mathrm{%s}$'%(s)
#ind = [0, 50, 100, 150]
#plt.xticks(x[ind], map(to_mathrm, ['K', 'Gamma', 'M','K']))
#for idx in ind:
#    plt.axvline(x[idx], color='k')
#
#plt.title('Bi2Se3 bandstructure: inteqp.cplx.x code')
#plt.axhline(0, color='#cccccc', zorder=-10)
#plt.xlim(xmin, xmax)
#plt.ylim(-1.5, 2.0)
#plt.legend([lmf, lqp], ['LDA', 'GW'], loc='lower right')
#plt.ylabel('Energy (eV)')
#plt.savefig('bandstructure_inteqp.pdf')
#
