import 'package:flutter/material.dart';

class ScrollableScaffold extends StatefulWidget {
  final Widget Function(BuildContext context, ScrollController scrollController, double scrollY) builder;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;
  final ScrollController? scrollController;

  const ScrollableScaffold({
    super.key,
    required this.builder,
    this.backgroundColor,
    this.backgroundGradient,
    this.scrollController,
  });

  @override
  State<ScrollableScaffold> createState() => _ScrollableScaffoldState();
}

class _ScrollableScaffoldState extends State<ScrollableScaffold> {
  late final ScrollController _scrollController = widget.scrollController ?? ScrollController()
    ..addListener(() {
      if (_scrollController.hasClients) {
        setState(() {});
      }
    });

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double scrollY = !_scrollController.hasClients
        ? 0
        : _scrollController.offset > 100
        ? 100
        : _scrollController.offset < 0
        ? 0
        : _scrollController.offset;

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Container(
        decoration: widget.backgroundGradient != null ? BoxDecoration(gradient: widget.backgroundGradient) : null,
        child: InkWell(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: widget.builder(context, _scrollController, scrollY),
        ),
      ),
    );
  }
}
