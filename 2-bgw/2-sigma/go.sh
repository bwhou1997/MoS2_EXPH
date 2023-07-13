#!/bin/bash
#SBATCH -J MoS2       # Job name
#SBATCH -o myjob.o%j       # Name of stdout output file
#SBATCH -e myjob.e%j       # Name of stderr error file
#SBATCH -p normal          # Queue (partition) name
#SBATCH -N 40              # Total # of nodes
#SBATCH -n 2240           # Total # of mpi tasks
#SBATCH -t 03:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-type=all    # Send email at begin and end of job
#SBATCH -A PHY20032       # Project/Allocation name (req'd if you have more than 1)
#SBATCH --mail-user=username@tacc.utexas.edu

# Any other commands must follow all #SBATCH directives...
module list
pwd
date

# Path setting
BGWPATH="/home1/08237/bwhou/software/BerkeleyGW-3.0.1/bin/"
QEPATH="/home1/08237/bwhou/software/qe-6.7/bin"
# Start mpi running for 1-mf

pwd
date

module load impi/19.0.9
ibrun $BGWPATH/sigma.cplx.x |tee  sigma.out

