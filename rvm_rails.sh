#!/bin/sh

\curl -L https://get.rvm.io | bash -s stable --eails

brew install python
pip install --upgrade setuptools
pip install --upgrade pip
brew linkapps
