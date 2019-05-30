# Data Science Template

[![Build Status](https://travis-ci.org/NeowayLabs/data-science-template.svg?branch=master)](https://travis-ci.org/NeowayLabs/data-science-template)

This repository contains a project creation tool for Data Science
models. The main usage is quite simple, but we have a lot of features
working **OUT OF THE BOX**:

+ `Dockerfile` template;
+ Unit-tests architecture with coverage report;
+ Makefile for project management and Docker abstraction;
+ Python software distribution via `setup.py`;
+ Multiple releases formats into `/dist`: `.tar.gz`, `.egg` and `.whl`;
+ Documentation: Project Specification && Model Report;
+ Notebook template for data analysis;
+ Multiple linters to help catching bugs during development:
  + security: **bandit**;
  + style: **flake8**;
  + typing: **mypy**;
+ CI/CD configuration with 3 stages: test, build and pages
  + tests: run unit-tests;
  + build: build docker image and populate `/dist`;
  + pages: build html documentation using
  [Sphinx](http://www.sphinx-doc.org/en/master/) and publish using
  [Read The Docs](https://readthedocs.org/);

# Usage

So let's create a new model! You just need clone this repository and
use the bash script `create-model` as follow:

``` bash
git clone git@github.com:NeowayLabs/data-science-template.git
cd data_science_template
./create-model ~/awesome-model
```

The basic placeholders like `project name`, `python package name` are
automatically filled! If you have configured the git `user.name` and
`git user.email` the system will assume to be equal as `author` and
`email` and will replace these placeholders as well. The directory
created will be initialized as a git repository, but you still need
configure your remote url manually.

The `create-model` program will help you configure the remote printing
some instructions to do that correctly, keep **attention** to blue
exclamation marks `[!]` on output of `create-model`. But basically you
need do two steps:

1. Create a new project in [GitHub](https://github.com/).
2. Get the ssh or https remote from it.

You can test the remote address executing a git clone command:

```bash
git clone <your-repository-address-here>
```

To enable properly CI/CD functionality for your new repository you can
do the following:

1. Go to [Travis CI](https://travis-ci.org/).
2. Select your repository to use with Travis CI.
[These instructions](https://docs.travis-ci.com/user/tutorial/#to-get-started-with-travis-ci)
may help.


After this, update your git remote `origin` and do the
first commit:

``` bash
cd ~/awesome-model
make check  # check if everything is ok and tests are passing
git add .
git commit -m "Initial commit" # Or your desired message
git remote add origin <your-repository-address-here>
git push -u origin master
```

# Releasing Software

You can release a new version of your software with this command:

```bash
make release VERSION=X.Y.Z
```

That is all. That command will build the docker image, run the tests,
linters and if everything is ok: a new git tag will be created and
be pushed to GitHub.


# Author
Neoway @ Data Analytics Team
