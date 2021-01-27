import 'package:flutter/cupertino.dart';

class SlideItemAnimationModel {
  final String id;
  final int entryDuration;
  final int entry;
  bool visible;

  SlideItemAnimationModel(
      {@required this.id,
      @required this.entryDuration,
      @required this.entry,
      this.visible = false});

  @override
  bool operator ==(other) {
    if (this.id == other.id) {
      return true;
    }

    return false;
  }

  @override
  int get hashCode => this.id.hashCode;
}

Duration getSlideItemAnimationDuration(
    String id, List<SlideItemAnimationModel> items) {
  return Duration(
      milliseconds: items.firstWhere((element) => element.id == id).visible
          ? items.firstWhere((element) => element.id == id).entryDuration
          : double.infinity);
}

bool getSlideItemAnimationVisibility(
    String id, List<SlideItemAnimationModel> items) {
  return items.firstWhere((element) => element.id == id).visible;
}

List<SlideItemAnimationModel> getSlideItemAnimationUpdate(
    double animationValue, List<SlideItemAnimationModel> items) {
  return items.map((e) {
    if (e.visible == false && animationValue >= e.entry) {
      e.visible = true;
      return e;
    } else if (e.visible == true && animationValue < e.entry) {
      e.visible = false;
      return e;
    }
    return e;
  }).toList();
}