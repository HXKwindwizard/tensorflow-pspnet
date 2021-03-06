#!/bin/bash

TRAIN_DIR=./train/skynet_tmp
DATASET_DIR=/home/pudae/dataset/ade20k/records
CHECKPOINT_PATH=./train/skynet/skynet_v1_50.ckpt
CHECKPOINT_EXCLUDE_SCOPES=global_step:0,pspnet_v1_50/pyramid_pool_module,pspnet_v1_50/fc1,pspnet_v1_50/logits

python train_semantic_segmentation.py \
  --train_dir=${TRAIN_DIR} \
  --dataset_dir=${DATASET_DIR} \
  --dataset_name=ade20k \
  --dataset_split_name=training \
  --model_name=pspnet_v1_50 \
  --optimizer=momentum \
  --weight_decay=0.0001 \
  --learning_rate_decay_type=polynomial \
  --learning_rate_decay_factor=0.9 \
  --checkpoint_path=${CHECKPOINT_PATH} \
  --train_image_size=224 \
  --checkpoint_exclude_scopes=${CHECKPOINT_EXCLUDE_SCOPES} \
  --classes=3 \
  --batch_size=8
