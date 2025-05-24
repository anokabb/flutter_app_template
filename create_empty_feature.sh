#!/bin/bash

# Get feature name
FEATURE_NAME=$1

if [ -z "$FEATURE_NAME" ]; then
  echo "❌ Usage: ./create_empty_feature.sh feature_name"
  exit 1
fi

# Convert feature_name to PascalCase (UserLocations)
FEATURE_CLASS_NAME=$(echo "$FEATURE_NAME" | awk -F_ '{for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) substr($i,2) } print}' OFS='')

# Base path
BASE_PATH="./lib/src/features/$FEATURE_NAME"

# Create folders
mkdir -p $BASE_PATH/data/api
mkdir -p $BASE_PATH/data/models
mkdir -p $BASE_PATH/data/repos
mkdir -p $BASE_PATH/presentation/cubit
mkdir -p $BASE_PATH/presentation/pages
mkdir -p $BASE_PATH/presentation/widgets

# Done!
echo ""
echo "✅ Empty feature '$FEATURE_NAME' folders created successfully!"