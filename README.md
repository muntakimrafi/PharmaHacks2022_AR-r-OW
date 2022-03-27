# PharmaHacks 2022 Microbiome Disease prediction with XGBoost

## __repo link__: https://github.com/muntakimrafi/PharmaHacks2022_AR-r-OW

## __devpost link__: https://devpost.com/software/microbiome-disease-prediction-with-xgboost

## Abstract

The human microbiome encompasses a diverse community of microorganisms living within the gastrointestinal tract. The state of the microbiome is deeply intertwined with human health and contains a wealth of information that can aid disease diagnosis. However, this information is obfuscated by the thousands of interactions between bacterial species, making it difficult to detangle by traditional analysis. In this work, we implement an eXtreme Gradient Boosting (XGBoost) classifier to predict disease classes from microbiome data. We then use statistical analysis to validate the model and inform feature reduction. Our model maintained high accuracy with reduced features informing optimal strategies to increase computational efficiency, reduce assay cost and identify biologically relevant species.

## Navigating the repo

We first perform an exploratory data analysis (see EDA notebook) where we build inspiration for a tree based approach. Then we go on to build our xgboost model (see model notebook) and see comparison between models trained using all bacteria and functionally enriched bacteria.

We also have the trained model weight files saved in the repo (model_final.pkl -> trained on all bacteria ,  model_71_bacteria.pkl-> trained on enriched bacteria). 

The differential enrichment analysis contains our differential analysis.

Also, we have the CPM (count per million) normalized train and test data (sum of all the microorganisms in each sample can vary substantially which is not biologically significant and in fact an artifact of the technology used to collect the data).

The python library requirements are mentioned in requirements.txt

Shinyapps folder contains an application which allows end-users to take advantage of model prediction using a user-friendly GUI. 

## Discovery 

During this challenge, we learned the value of statistical analysis for both validation and informing model architecture design. Statistical analysis both revealed the sparse structure of our dataset and key bacterial species within it. This allowed us to drastically reduce the features present in our model from 1094 to 71 (6.5%) while maintaining accuracy. This feature reduction has practical implications. It suggests an alternative metagenomic strategy of in-depth sampling of the 71 highly-informative bacteria, compared to shallowly sampling all 1094. It would also be interesting to follow up on these 71 species and identify their biological function.

## Contributions

All team members contributed equally to the team.

