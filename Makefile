# This is the name to give to kaggle to downoad the dataset
COMPETITION_NAME = spooky-author-identification


DATA = data
RAWDATA = $(DATA)/raw
SAMPLEDATA = $(DATA)/sample
INTERIMDATA = $(DATA)/interim
RAW_TRAIN = train.csv 
SAMPLE = sample_submission.csv 
DOWNLOAD_DATA = kaggle competitions download
DOWNLOAD_DATA_FLAGS = -c
TRAINVALSPLIT = src/trainvalsplit.py

PICKLE_DATA = src/features/pickle_data.py
PICKLE_TEXT = src/features/pickle_comments.py

TRAIN_INTERIM = train_interim
TEST_INTERIM = test_interim

SRC = src
FEATURES = $(SRC)/features

PROCESSED = $(DATA)/processed



# even if a file download_data is created, .PHONY  make will not consider downoad_data as a file, but just as a target
.PHONY: download_data
.PHONY: trainvalsplit

all: download_data trainvalsplit
	
##### DOWNLOAD THE DATA  ###########################

# FIX: this is run everytime because it is a phony target.
download_data: $(RAWDATA)/$(RAW_TRAIN) $(SAMPLEDATA)/$(SAMPLE) 

# the following command requires to have installed the kagle-api 
# For that you should install it as explained in the readme file of https://github.com/Kaggle/kaggle-api
# and also configure a ~/.kaggle/kaggle.json file as explained in the readme file


./data/raw/train.csv: 
	$(DOWNLOAD_DATA) $(DOWNLOAD_DATA_FLAGS)  $(COMPETITION_NAME) -p $(RAWDATA)
	# $$ means $ in make
	for z in $(RAWDATA)/*.zip; do unzip $$z -d $(RAWDATA); done
         
./data/sample/sample_submission.csv:
	mv $(RAWDATA)/$(SAMPLE) $(SAMPLEDATA) 

## Make train/val split:
trainvalsplit: download_data
	python3 $(TRAINVALSPLIT)


