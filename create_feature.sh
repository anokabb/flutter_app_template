#!/bin/bash

# Get feature name and project name
FEATURE_NAME=$1
BUILD_RUNNER=${2:-null}

#TODO: Set the project name 
PROJECT_NAME='one_lock_center'

if [ -z "$FEATURE_NAME" ]; then
  echo "❌ Usage: ./create_feature.sh feature_name [pass 'build' to run build_runner]"
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


# Create API template
cat <<EOF > $BASE_PATH/data/api/${FEATURE_NAME}_api.dart
import 'package:$PROJECT_NAME/src/core/network/models/api_response.dart';
import 'package:$PROJECT_NAME/src/features/$FEATURE_NAME/data/models/${FEATURE_NAME}_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'gen/${FEATURE_NAME}_api.g.dart';

@RestApi()
abstract class ${FEATURE_CLASS_NAME}Api {
  factory ${FEATURE_CLASS_NAME}Api(Dio dio) = _${FEATURE_CLASS_NAME}Api;

  @GET('/$FEATURE_NAME')
  Future<ApiResponse<${FEATURE_CLASS_NAME}Model>> fetchSomething();
}
EOF

# Create Model template
cat <<EOF > $BASE_PATH/data/models/${FEATURE_NAME}_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/${FEATURE_NAME}_model.freezed.dart';
part 'gen/${FEATURE_NAME}_model.g.dart';

@freezed
class ${FEATURE_CLASS_NAME}Model with _\$${FEATURE_CLASS_NAME}Model {
  const factory ${FEATURE_CLASS_NAME}Model({
    required String id,
    required String name,
  }) = _${FEATURE_CLASS_NAME}Model;

  factory ${FEATURE_CLASS_NAME}Model.fromJson(Map<String, dynamic> json) => _\$${FEATURE_CLASS_NAME}ModelFromJson(json);
}
EOF

# Create Repository Interface
cat <<EOF > $BASE_PATH/data/repos/${FEATURE_NAME}_repo.dart
import 'package:fpdart/fpdart.dart';
import 'package:$PROJECT_NAME/src/core/network/models/app_error.dart';
import 'package:$PROJECT_NAME/src/features/$FEATURE_NAME/data/models/${FEATURE_NAME}_model.dart';

abstract class ${FEATURE_CLASS_NAME}Repo {
  Future<Either<AppError, ${FEATURE_CLASS_NAME}Model>> fetchSomething();
}
EOF

# Create Repository Implementation
cat <<EOF > $BASE_PATH/data/repos/${FEATURE_NAME}_repo_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:$PROJECT_NAME/src/core/network/models/app_error.dart';
import 'package:$PROJECT_NAME/src/features/$FEATURE_NAME/data/api/${FEATURE_NAME}_api.dart';
import 'package:$PROJECT_NAME/src/features/$FEATURE_NAME/data/models/${FEATURE_NAME}_model.dart';
import '${FEATURE_NAME}_repo.dart';

class ${FEATURE_CLASS_NAME}RepoImpl implements ${FEATURE_CLASS_NAME}Repo {
  final ${FEATURE_CLASS_NAME}Api _api;

  ${FEATURE_CLASS_NAME}RepoImpl(this._api);

  @override
  Future<Either<AppError, ${FEATURE_CLASS_NAME}Model>> fetchSomething() async {
    try {
      final response = await _api.fetchSomething();
      return right(response.data!);
    } catch (e) {
      return left(AppError.fromException(e));
    }
  }
}
EOF

# Create Cubit
cat <<EOF > $BASE_PATH/presentation/cubit/${FEATURE_NAME}_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:$PROJECT_NAME/src/core/network/models/app_error.dart';

part '${FEATURE_NAME}_state.dart';
part 'gen/${FEATURE_NAME}_cubit.freezed.dart';

class ${FEATURE_CLASS_NAME}Cubit extends Cubit<${FEATURE_CLASS_NAME}State> {
  ${FEATURE_CLASS_NAME}Cubit() : super(const ${FEATURE_CLASS_NAME}State.initial());
}
EOF

# Create State
cat <<EOF > $BASE_PATH/presentation/cubit/${FEATURE_NAME}_state.dart
part of '${FEATURE_NAME}_cubit.dart';

@freezed
class ${FEATURE_CLASS_NAME}State with _\$${FEATURE_CLASS_NAME}State {
  const factory ${FEATURE_CLASS_NAME}State.initial() = ${FEATURE_CLASS_NAME}StateInitial;
  const factory ${FEATURE_CLASS_NAME}State.loading() = ${FEATURE_CLASS_NAME}StateLoading;
  const factory ${FEATURE_CLASS_NAME}State.loaded() = ${FEATURE_CLASS_NAME}StateLoaded;
  const factory ${FEATURE_CLASS_NAME}State.error(AppError error) = ${FEATURE_CLASS_NAME}StateError;
}
EOF

# Create Page
cat <<EOF > $BASE_PATH/presentation/pages/${FEATURE_NAME}_page.dart
import 'package:flutter/material.dart';

class ${FEATURE_CLASS_NAME}Page extends StatefulWidget {
  const ${FEATURE_CLASS_NAME}Page({super.key});

  static const routeName = '/$FEATURE_NAME';

  @override
  State<${FEATURE_CLASS_NAME}Page> createState() => _${FEATURE_CLASS_NAME}PageState();
}

class _${FEATURE_CLASS_NAME}PageState extends State<${FEATURE_CLASS_NAME}Page> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('${FEATURE_CLASS_NAME}Page'),
      ),
    );
  }
}
EOF

# Run build_runner if BUILD_RUNNER is true
if [ "$BUILD_RUNNER" = 'build' ]; then
  echo "🚀 Running build_runner..."
  fvm flutter pub run build_runner build --delete-conflicting-outputs
fi

# Done!
echo ""
echo "✅ Feature '$FEATURE_NAME' created successfully!"
# Provide a link to open the created page file from the terminal
PAGE_FILE_PATH="$BASE_PATH/presentation/pages/${FEATURE_NAME}_page.dart"
echo "📂 Open the created page file:"
echo "code $PAGE_FILE_PATH"
echo ""
echo "📍 You can now add this to your router:"
echo ""
echo "GoRoute("
echo "  path: ${FEATURE_CLASS_NAME}Page.routeName,"
echo "  builder: (context, state) => const ${FEATURE_CLASS_NAME}Page(),"
echo "),"
