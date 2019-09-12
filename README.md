# DMG to SD card in OSX

Simple scrip that allows users to restore a .DMG image file to a SD card, the only inputs needed are the path to the disk and the path to the image.

**MUST be run as root!**

## Before Runnig

To be able to run this script, please install Homebrew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
And after, install pv to visualize the transfer proccess:
```
brew install pv
```
> What is pv?

> pv - Pipe Viewer - is a terminal-based tool for monitoring the progress of data through a pipeline. It can be inserted into any normal pipeline between two processes to give a visual indication of how quickly data is passing through, how long it has taken, how near to completion it is, and an estimate of how long it will be until completion.

## How to run

To run this script just run this command in the terminal
```
sudo bash dmgtosd.sh
```
