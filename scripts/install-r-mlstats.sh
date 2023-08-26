#!/bin/bash
install2.r --error --deps TRUE \
    AER \
    cluster \
    changepoint \
    dynlm \
    dynamac \
    e1071 \
    naivebayes \
    caret \
    fable \
    factoextra \
    forecast \
    feasts \
    fpp2 \
    rpart \
    RcppRoll \
    randomForest \
    TSA \
    quantreg \
    tidymodels \
    timetk \
    lightgbm \
    nowcasting \
    xgboost \
    stlplus \
    sandwich \
    TSclust \
    tsibble \
    zoo \
    tscount \
    survival \
    plm \
    smooth \
    hts

Rscript -e 'library(devtools);devtools::install_url("https://github.com/catboost/catboost/releases/download/v1.1/catboost-R-linux-1.1.tgz", INSTALL_opts = c("--no-multiarch", "--no-test-load"))'

