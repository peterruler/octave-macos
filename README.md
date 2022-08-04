# Instructions on Octave on MacOS
Gnu Octave is the best Matlab compatible Numeric Calculations solution.
See https://wiki.octave.org/Octave_for_macOS for more info.


## Steps to install Octave on Mac as an App and with working Symbolic Module activated

1. You will need Homebrew installed on your MacOS:
see https://brew.sh/index_de for instructions or open a Terminal and execute

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)` 

2. Then execute the installation commands found on this page: https://wiki.octave.org/Octave_for_macOS. In a Terminal execute:

`brew update`

`brew upgrade`

`brew install octave`

3. To run Octave on MacOS create a new App on your own. You will need to make the files executable by executing following command in your Terminal, while being located in the working directory of the downloaded scripts (`cd /toyourdirectory`):

`sudo chmod +x ./appify`.

Eventually you also need to make other files executable: 

`sudo chmod +x ./octave.sh`.

In your Terminal type in:

`sudo ./appify octave.sh "Octave"`

Appify is taken from https://mathiasbynens.be/notes/shell-script-mac-apps.

octave.sh consists of hashbang line and Terminal output of:

`which octave`

with the ` --gui` option.


to get a newly created Octave.app.


4. Manually you can execute Octave by running 

`/opt/homebrew/bin/octave --gui`

in your Terminal. By using the App, this step is no longer needed.

## In order to use the symbolic package do the following
1. Install Anaconda from https://www.anaconda.com/products/distribution. (I chose the installation for a single user)
2. From a Terminal window execute: `pip install sympy==1.5.1`.
3. Open Octave and in the command window type in the following, and press ENTER:

`pkg install -forge symbolic`

`pkg load symbolic` 

This and the setenv command must be executed at the start of your symbolic algebra calculation (see: /Exercise/Exercise02.m)
Most important: Set Python path, by pasting in the command window and pressing ENTER:

`setenv PYTHON /Users/<yourusername>/opt/anaconda3/bin/python`

replace `<yourusername>` with the Terminal output of `whoami`

4. To test use the Octave command window and type in syms x y z and press ENTER. 

No errors should result.
