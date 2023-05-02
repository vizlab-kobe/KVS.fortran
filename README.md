# KVS.fortran
KVS.fortran is a Fortran interface implemented by using KVS. By using fortran modules provided from KVS.fortran, visualization applications can be esily developed for scientific simulation dataset.

## Installation

### Pre-requisities

* [KVS](https://github.com/naohisas/KVS)

### Build
Clone KVS.fortran repository from GitHub as follows:
```bash
$ git clone https://github.com/vizlab-kobe/KVS.fortran.git
```

#### Lib
Build KVS.fortran library required to compile each application in App.
```bash
$ cd KVS.fortran
$ cd Lib
$ ./kvsmake.py
```

If necessary, rebuild the library as follows:
```bash
$ ./kvsmake.py rebuild
```
