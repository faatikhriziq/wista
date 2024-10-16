import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget marginAll(double margin) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: this,
    );
  }

  Widget marginSymmetric(
      {required double horizontal, required double vertical}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget marginOnly(
      {required double left,
      required double right,
      required double top,
      required double bottom}) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget align(AlignmentGeometry alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget sizedBox({double width = 0.0, double height = 0.0}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget safeArea() {
    return SafeArea(
      child: this,
    );
  }

  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool primary = true,
    ScrollController? controller,
    ScrollPhysics? physics,
    required List<Widget> slivers,
  }) {
    return CustomScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      primary: primary,
      controller: controller,
      physics: physics,
      slivers: slivers,
    );
  }

  Widget sliverList({
    required List<Widget> children,
  }) {
    return SliverList(
      delegate: SliverChildListDelegate(children),
    );
  }
}

extension RowSpacing on Row {
  Row gap(double spacing) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children
          .expand((widget) => [widget, SizedBox(width: spacing)])
          .toList()
        ..removeLast(),
    );
  }
}

extension ColumnSpacing on Column {
  Column gap(double spacing) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children
          .expand((widget) => [widget, SizedBox(height: spacing)])
          .toList()
        ..removeLast(),
    );
  }
}

extension ListWidgetGap on List<Widget> {
  List<Widget> gapWidth(double spacing) {
    return expand((widget) => [widget, SizedBox(width: spacing)]).toList()
      ..removeLast();
  }

  List<Widget> gapHeight(double spacing) {
    return expand((widget) => [widget, SizedBox(height: spacing)]).toList()
      ..removeLast();
  }
}
