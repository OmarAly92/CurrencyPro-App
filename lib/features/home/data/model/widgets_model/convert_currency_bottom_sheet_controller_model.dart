import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ConvertBottomSheetControllerModel extends Equatable {
  final TextEditingController convertController;
  final TextEditingController fromController;
  final TextEditingController toController;
  final GlobalKey<FormState> formKey;

  const ConvertBottomSheetControllerModel({
    required this.convertController,
    required this.fromController,
    required this.toController,
    required this.formKey,
  });

  @override
  List<Object> get props => [
        convertController,
        fromController,
        toController,
        formKey,
      ];
}
