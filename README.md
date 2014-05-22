limit-sailfish
==============

**Limit** calculates mathematical limits using Python and SymPy.

This is the [Sailfish OS](https://sailfishos.org/) version, using Python 3, [SymPy](http://sympy.org/), [PyOtherSide](http://thp.io/2011/pyotherside/), Qt 5, Qt Quick 2 (with Silica Components).

Use Sailfish SDK with this source-code to build the application (.rpm installation file).

Before running Limit on Sailfish SDK Emulator, add my repository to install python3-sympy :

    $ sudo zypper ar -f http://repo.merproject.org/obs/home:/rcolistete/latest_i486/ rcolistete-mer  
    $ sudo zypper ref  
    $ sudo zypper in python3-sympy  

See [the Sailfish SDK topic in Talk Maemo.org](http://talk.maemo.org/showthread.php?t=89294 ) about using the Sailfish SDK.
