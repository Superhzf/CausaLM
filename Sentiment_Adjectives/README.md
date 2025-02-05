## Sentiment Adjectives Experimental Pipeline

### Prerequisites
- Create the CausaLM conda environment: `conda env create --file causalm_gpu_env.yml`
- Install the [`en_core_web_lg`](https://spacy.io/models/en#en_core_web_lg) spaCy model. Zefu: It looks like this step is not necessary because this model is included by the YML file above.
- Download the *adjectives* [datasets](https://www.kaggle.com/amirfeder/causalm) and place them in the `./datasets` folder.
- Make sure the `CAUSALM_DIR` variable in `constants.py` is set to point to the path where the CausaLM datasets are located. Zefu: It should point to the project folder.

### Stage 2 training
Run the following scripts in sequence:
- `./lm_finetune/pregenerate_training_data.py`. Zefu: This takes ~20 mins
- `./lm_finetune/mlm_finetune_on_pregenerated.py`. Zefu: This takes ~20 mins
- `./lm_finetune/ima_finetune_on_pregenerated.py [--control_task]`. Zefu: This takes ~20 mins

This will save the intervened BERT language model which treats for Adjectives treatment (IMA), with the option of adding the PoS tagging control task.

### Stage 3 training and test
- `./pipeline/training.py [--pretrained_control]`. Zefu: This takes more than 8 hours.

This will train and test all the Sentiment classifiers for the full experimental pipeline for Adjectives treatment, with the option of utilizing the Stage 2 model which employs the PoS tagging control task.
