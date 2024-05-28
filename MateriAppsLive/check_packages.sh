#!/bin/bash

packages="dx grace h5utils bsa fermisurfer libalpscore-dev physbo tapioca abinit akaikkr alamode casino-setup cif2cell conquest c-tools quantum-espresso quantum-espresso-data openmx openmx-data openmx-example respack salmon-tddft xtapp xtapp-ps xtapp-util gamess-setup smash gromacs gromacs-data gromacs-mpi lammps lammps-data lammps-examples octa octa-data alps-applications alps-tutorials ddmrg dsqss hphi mvmc tenes triqs triqs-cthyb triqs-dfttools triqs-hubbardi dcore cp2k cp2k-data xcrysden vmd-setup"

for pkg in $packages; do
    echo "Package: $pkg"
    if dpkg -L $pkg &>/dev/null; then
        echo "Installation Successful"
    else
        echo "Package '$pkg' is not installed."
    fi
    echo "=============================="
done