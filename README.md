limit-sailfish
==============

[**Limit**](http://www.robertocolistete.net/Limit/) calculates mathematical limits using Python and SymPy.

This is the [Sailfish OS](https://sailfishos.org/) version, using Python 3, [SymPy](http://sympy.org/), [PyOtherSide](http://thp.io/2011/pyotherside/), Qt 5, Qt Quick 2 (with Silica Components).

See [Limit for Sailfish at OpenRepos.net](https://openrepos.net/content/rcolistete/limit-sailfish-os).

Use Sailfish SDK with this source-code to build the application (.rpm installation file).

Before running Limit on Sailfish SDK Emulator, add my repository to install python3-sympy[python3-sympy](https://build.merproject.org/package/show?package=python3-sympy&project=home%3Arcolistete) dependency :
    $ sudo zypper ar -f http://repo.merproject.org/obs/home:/rcolistete/latest_i486/ rcolistete-mer  
    $ sudo zypper ref  
    $ sudo zypper in python3-sympy  

See [the Sailfish SDK topic in Talk Maemo.org](http://talk.maemo.org/showthread.php?t=89294 ) about using the Sailfish SDK.
