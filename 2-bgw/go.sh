#!/bin/bash
#SBATCH --qos=development
#SBATCH --nodes=40
#SBATCH -C knl
#SBATCH -t 02:00:00
#SBATCH -J l_gw_1/1 
#SBATCH -A m3331

QEPATH='/global/homes/b/bwhou/software/qe-6.7/bin'
BGWPATH1='/global/homes/b/bwhou/software/BerkeleyGW-master/bin'

cd 1-epsilon
#srun -n 2160 --cpu_bind=cores $BGWPATH1/epsilon.cplx.x > epsilon.out

cd ../2-sigma
rm vxc.dat
rm x.dat
srun -n 2160 --cpu_bind=cores $BGWPATH1/sigma.cplx.x > sigma.out


