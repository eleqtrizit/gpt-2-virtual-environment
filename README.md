# gpt-2-virtual-environment
A quick install script gpt-2 on Debian/Ubuntu distros.  Works on Raspberry Pi 4.

Clone the directory with:
```
	git clone https://github.com/eleqtrizit/gpt-2-virtual-environment.git
```

Setup gpt-2 virtual environment with:
```
	chmod 700 venv_gpt2_create.sh
	./venv_gpt2_create.sh
```

What will follow is the installation/upgrade of the OS, Python3 and Python3 packages.  When the script is finished, it will give further instructions on how to run the model.

Then endwill look something like this:
```
Activate environment with:
source /home/pi/gpt2-venv/bin/activate

Then run demo with...
cd /home/pi/gpt2-venv/gpt-2/
python -W ignore src/interactive_conditional_samples.py
```

Once you follow the above commands, you'll see a bunch of warnings (this is normal), then you will get the prompt to enter some text.  Do that, and give the model a few minutes to respond.

````
Model prompt >>> ENTER YOUR TEXT HERE
```

Inspired by Reddit user DelosBoard2052.
