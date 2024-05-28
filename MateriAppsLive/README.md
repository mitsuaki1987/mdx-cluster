# MateriAppsLive_VM


## Ansibleのプロジェクトファイル構成
```
.
├── README.md
└── ansible
    ├── ubuntu-materiapps-live.yml
    └── tasks
        ├── ma-live //MateriAppsLiveの設定
        │   └── task.yml
        ├── packer-apt
        │   └── task.yml
        ├── passwd-reset
        │   └── task.yml
        ├── remote-desktop //RemoteDesktopの設定
        │   └── task.yml
        ├── sshd
        │   └── task.yml
        ├── toolset //ツール関連のパッケージインストール
        │   └── task.yml
        ├── ubuntu-cleanup
        │   └── task.yml
        ├── ubuntu-desktop
        │   └── task.yml
        └── vm-shrink
            └── task.yml
```


## MateriAppsLiveでインストールを行うアプリケーション

* DCore
* FermiSurfer
* HPhi
* mVMC
* OpenMX
* Quantum ESPRESSO
* RESPACK
* VESTA
* Xcrysden
* ALPS
* GAMESS
* LAMMPS
* VMD
* SALMON
* AkaiKKR
* SMASH
* CONQUEST
* Abinit
* xTAPP
* cp2k
* C-TOOLS


## MateriAppsLive環境設定について

以下の設定を`ma-live/task.yml`で行っています。

MateriAppsLiveリポジトリの追加
```
DEBIAN=$(lsb_release -c -s)

cat << EOF > /etc/apt/sources.list.d/materiapps-${DEBIAN}.list
# for MateriApps LIVE!
deb http://exa.phys.s.u-tokyo.ac.jp/archive/MateriApps/apt/${DEBIAN} ${DEBIAN} main non-free contrib
deb-src http://exa.phys.s.u-tokyo.ac.jp/archive/MateriApps/apt/${DEBIAN} ${DEBIAN} main non-free contrib
EOF

apt-get -o Acquire::AllowInsecureRepositories=true update
apt-get -y --allow-unauthenticated install materiapps-keyring
apt-get update
```

パッケージの更新
```
$ sudo apt-get update -qq
```

パッケージのインストール
```
$ sudo apt-get -y install --no-install-recommends materiappslive dx grace h5utils bsa fermisurfer libalpscore-dev physbo tapioca abinit akaikkr alamode casino-setup cif2cell conquest c-tools quantum-espresso quantum-espresso-data openmx openmx-data openmx-example respack salmon-tddft xtapp xtapp-ps xtapp-util gamess-setup smash gromacs gromacs-data gromacs-mpi lammps lammps-data lammps-examples octa octa-data alps-applications alps-tutorials ddmrg dsqss hphi mvmc tenes triqs triqs-cthyb triqs-dfttools triqs-hubbardi dcore cp2k cp2k-data xcrysden vmd-setup
```

パスと環境変数の設定
```
$ sudo echo "export PATH=$HOME/bin:$PATH" >> /etc/skel/.bashrc
$ sudo echo "export OMP_NUM_THREADS=1" >> /etc/skel/.bashrc
$ sudo echo "export OMPI_MCA_btl_vader_single_copy_mechanism=none" >> /etc/skel/.bashrc
$ sudo echo "export LIBGL_ALWAYS_INDIRECT=1" >> /etc/skel/.bashrc
```

エイリアスとシンタックスの無効化
```
$ sudo echo "unalias ls" >> /etc/skel/.bashrc
$ sudo echo "syntax off" > /etc/skel/.vimrc
```

Emacsの初期設定
```
$ sudo mkdir -p /etc/skel/.emacs.d
$ sudo echo "(setq inhibit-startup-screen t)" > /etc/skel/.emacs.d/init.el
$ sudo echo "(setq default-frame-alist '((height . 24)))" >> /etc/skel/.emacs.d/init.el
```

バージョン情報の設定
```
$ sudo echo 4.1 > /etc/malive_version
```

データ分析などに必要なツールセットのインストール
```
$ sudo apt-get -y install --no-install-recommends sudo lsb-release curl lftp wget build-essential gfortran cmake git liblapack-dev libopenblas-dev mpi-default-dev numactl emacs vim mousepad less evince gnuplot-x11 enscript time tree zip unzip bc xsel parallel python3-pip python3-venv jupyter-notebook python3-numpy python3-scipy python3-matplotlib python3-tk python3-sympy python3-dev ipython3
```






