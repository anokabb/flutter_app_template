// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:shimmer/shimmer.dart';

enum ViewType { list, grid }

class InfiniteScrollView extends StatefulWidget {
  const InfiniteScrollView({
    super.key,
    required this.onLoadMore,
    required this.itemCount,
    required this.itemBuilder,
    required this.hasNext,
    this.controller,
    this.padding,
    this.gridDelegate,
    this.viewType = ViewType.list,
    this.separatorBuilder,
    this.placeholder,
  });

  final int itemCount;
  final Future Function() onLoadMore;
  final IndexedWidgetBuilder itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final SliverGridDelegate? gridDelegate;
  final ViewType viewType;
  final bool hasNext;
  final Widget? placeholder;

  @override
  _InfiniteScrollViewState createState() => _InfiniteScrollViewState();

  static InfiniteScrollView listView({
    Key? key,
    required Future Function() onLoadMore,
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    required bool hasNext,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    Widget Function(BuildContext, int)? separatorBuilder,
  }) {
    return InfiniteScrollView(
      key: key,
      onLoadMore: onLoadMore,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      controller: controller,
      padding: padding,
      viewType: ViewType.list,
      hasNext: hasNext,
      separatorBuilder: separatorBuilder,
    );
  }

  static InfiniteScrollView gridView({
    Key? key,
    required Future Function() onLoadMore,
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    required bool hasNext,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    SliverGridDelegate? gridDelegate,
  }) {
    return InfiniteScrollView(
      key: key,
      onLoadMore: onLoadMore,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      controller: controller,
      padding: padding,
      gridDelegate: gridDelegate,
      viewType: ViewType.grid,
      hasNext: hasNext,
    );
  }
}

class _InfiniteScrollViewState extends State<InfiniteScrollView> {
  @override
  Widget build(BuildContext context) {
    return widget.viewType == ViewType.list ? _buildListView() : _buildGridView();
  }

  Widget _buildListView() {
    if (widget.itemCount == 0) {
      return const Center(
        child: Text('No results found'),
      );
    }
    return InfiniteListView.separated(
      controller: widget.controller,
      itemBuilder: widget.itemBuilder,
      padding: widget.padding,
      itemCount: widget.itemCount,
      hasNext: widget.hasNext,
      nextData: widget.onLoadMore, // callback called when end to the list is reach and hasNext is true
      separatorBuilder: widget.separatorBuilder ?? (context, index) => const SizedBox(),
    );
  }

  Widget _buildGridView() {
    if (widget.itemCount == 0) {
      return const Center(
        child: Text('No results found'),
      );
    }
    return InfiniteGridView(
      controller: widget.controller,
      itemBuilder: widget.itemBuilder,
      padding: widget.padding,
      itemCount: widget.itemCount,
      hasNext: widget.hasNext,
      nextData: widget.onLoadMore,
      gridDelegate: widget.gridDelegate ?? const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      loadingWidget: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: widget.placeholder ?? const SizedBox.shrink(),
      ),
    );
  }
}
