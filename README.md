# Hands-on Pipelines and Gridsearch with scikit-learn
Material (jupyter notebook) for a talk about Pipelines and Gridsearch with scikit-learn.  
This talk was given on May 16, 2018 for a [PyData Munich Meetup](https://www.meetup.com/PyData-Munchen/) hosted at Jetbrains Event Space.

Authors: Florent Martin and Koen van Woerden

## Abstract
Building a data science model usually involves lots of steps: cleaning, preprocessing, vectorizing, predicting, etc. Especially with an interactive notebook, one easily loses track of the various intermediate data outputs. Changing the intermediate processing steps also gets very cumbersome. On top of that trying to optimize the hyperparameters takes a lot of work.
We will show a solution to these problems using Pipelines and Gridsearch with scikit-learn. These techniques will be demonstrated on an NLP classification problem. This talk will also serve as an introduction to scikit-learn.


##  How to read the notebook?

#### Where to launch the notebook
The jupyter notebook that has to be to run is 
`./notebooks/tutorial.ipynb`.
It should be run from the root directory of the git repository.

#### Download and prepare the data
To run the notebook, you need to to have the two files `data.csv` and `val.csv` in the directory `./data/talk/`.
There are two ways to do so:

* **The first way.** If the [kaggle api](https://github.com/Kaggle/kaggle-api) is installed on your computer (and if you have generated a [token API](https://github.com/Kaggle/kaggle-api#api-credentials)), and if you can use make, then simply run `make` in the root directory.
* **The second way**. Otherwise, you will need to download and prepare the data by hand. This means:
  1. Download the data from the kaggle competition 
[spooky author classification](https://www.kaggle.com/c/spooky-author-identification/data) in the directory `./data/raw/`. (At that point if you can run `make`, then run `make` and you don't need to run any other step). 
  2. You should unzip the file `train.zip` located in `./data/raw/` into `./data/raw/train.csv`. Concretely, from the root directory run
  ```
  unzip ./data/raw/train.zip -d ./data/talk/
  ```
  This should create a file `train.csv` inside the directory `./data/talk/`.
  3. Finally from the root directory of the repo, run 
  `python3 ./src/trainvalsplit.py` 
  which will create a training set `./data/talk/data.csv` and a validation set `./data/talk/val.csv`.

#### Convert the notebook into slides

This notebook was designed to be displayed during a presentation with a beamer.
For that we use [RISE](https://damianavila.github.io/RISE/).

## Authors
* Florent Martin
* Koen van Woerden

## Acknowledgments
* Many thanks to Nick Del Grosso for helpful suggestions.
