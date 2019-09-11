# What's my beer?

iOS project to show the *COREML* features and the power of `turicreate` library to create custom models.

This sample shows the track of the construction for this app, to follow it you need to `checkout` between thes branches:

- 001/
- 002/
- 003/
- 004/

Also, for the classifier model you should add inside `trainer/images` the folders with images you want to classify.

### Python

For the execution of python script I recommend you the use of virtualenv with support for `Python 3`. So to make sure you have these requirements in your local system:

- Python 3
- PIP3
- virtualenv

Create a virtualenv with the next command:

```
virtualenv .venv -p python3
```

Then activate it:

```
source .venv/bin/activate
```

Then you will be able to execute the classification script:

```
python beer_classifier.py
```

Feel free to send me a message in twitter if you need support or show me your smart apps.