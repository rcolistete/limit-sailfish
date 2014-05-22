limit-sailfish
==============

Limit calculates mathematical limits using Python and SymPy.

This is the Sailfish OS version.

Use [http://talk.maemo.org/showthread.php?t=89294 Sailfish SDK] with this source-code to build the application (.rpm installation file).

To use Sailfish SDK Emulator to run Limit, first add my repository to install python3-sympy :
$ sudo zypper ar -f http://repo.merproject.org/obs/home:/rcolistete/latest_i486/ rcolistete-mer
$ sudo zypper ref
$ sudo zypper in python3-sympy
