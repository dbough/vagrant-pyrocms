vagrant-pyrocms
===============

Vagrant config for PyroCMS. (https://www.pyrocms.com/)

Requirements
------------

- Vagrant (http://www.vagrantup.com/)
- VirtualBox (https://www.virtualbox.org/)
- Internet Access

Instructions
------------

- Download and install Vagrant:  http://www.vagrantup.com/
- Download and install VirtualBox:  https://www.virtualbox.org/wiki/Downloads
- Clone this repo:  `git clone https://github.com/dbough/vagrant-pyrocms.git`
- Bring vagrant up:  `cd vagrant-pyrocms/`, `vagrant up`
- Set up PyroCMS: `http://localhost:5555`

Notes
-----

- You can choose which PyroCMS repo to use by changing `REPO` on line 8 of `boostrap.sh` (this has only been tested with `2.2/master`).
- If you don't have the precise32 box on your machine, it will automatically be downloaded.  This can take a few minutes the first time it runs.
- MySQL credentials are `root` / `password`

Author
------

Dan Bough  
daniel (dot) bough (at) gmail (dot) com  
http://www.danielbough.com

License
-------

Free to use and distribute under the GPLv3 license.