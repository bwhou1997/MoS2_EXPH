#!/bin/bash
#SBATCH --qos=preempt
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH -C cpu
#SBATCH -t 2:00:00
#SBATCH -J para
#SBATCH -A m2651
#SBATCH -e sigma.err

export OMP_NUM_THREADS=1
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

#QEPATH='/global/homes/b/bwhou/software/qe-6.7/bin'
BGWPATH='/global/homes/b/bwhou/software/BerkeleyGW-master/bin'

#module load espresso/7.0-libxc-5.2.2-cpu

conda deactivate

module load berkeleygw/3.0.1-cpu

#srun --cpu_bind=cores parabands.cplx.x |tee parabands.out
#./pseudobands.py WFN.h5 WFNo.h5 2 0.02
srun --cpu_bind=cores $BGWPATH/hdf2wfn.x BIN WFNo.h5 WFN

