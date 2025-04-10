import 'package:flutter/material.dart';

class ExpandableBottomSheetPage extends StatefulWidget {
  /// The total time duration of the bottom sheet animation in miliseconds.
  final int animationDuration;

  /// The alignment of the bottom sheet arrow.
  final Alignment arrowAlignment;

  /// If the bottom sheet has the animated arrow. If set to false ignore others arrow settings.
  final bool hasArrow;

  /// The color of the arrow.
  final Color arrowColor;

  /// The size of the arrow.
  final double arrowSize;

  /// The height of the bottom sheet header relative to the context widget this value is a percentage
  /// meaning that goes from 0 to 1. Example: if the owner of the ExpandableBottomSheetPage have
  /// 1000 pixels height and this field is 0.1 the height of the header will be 100 pixels.
  final double headerHeightPercentage;

  /// The total height of the bottom sheet when opened relative to the context widget this value is a percentage
  /// meaning that goes from 0 to 1. Example: if the owner of the ExpandableBottomSheetPage have
  /// 1000 pixels height and this field is 0.5 the height of the opened bottom sheet will be 500 pixels.
  final double openedHeightPercentage;

  /// The icon of arrow.
  final IconData arrowIcon;

  /// The content of the header. The arrow will always be in the header positioned on the [arrowAlignment].
  final Widget? header;

  /// The body content of the page.
  final Widget? body;

  /// The content of the bottom sheet.
  final Widget? bottomSheetBody;

  /// The decorration of the header.
  final Decoration headerDecoration;

  /// The decorration of the header.
  final Decoration bottomSheetDecoration;

  /// The curve easing of bottom sheet animation.
  final Curve animationCurve;

  /// Callback that is triggered on end of the bottom sheet animation,
  final VoidCallback? onEnd;

  const ExpandableBottomSheetPage({
    super.key,
    this.header,
    this.body,
    this.bottomSheetBody,
    this.hasArrow = true,
    this.arrowIcon = Icons.keyboard_arrow_up,
    this.animationDuration = 400,
    this.arrowAlignment = Alignment.centerRight,
    this.arrowSize = 24,
    this.headerDecoration = const BoxDecoration(
      color: Color.fromARGB(255, 255, 0, 0),
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2)),
      ],
    ),
    this.bottomSheetDecoration = const BoxDecoration(
      color: Color.fromARGB(255, 255, 107, 107),
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    this.arrowColor = Colors.black,
    this.headerHeightPercentage = 0.05,
    this.openedHeightPercentage = 0.5,
    this.animationCurve = Curves.bounceOut,
    this.onEnd,
  });

  @override
  State<ExpandableBottomSheetPage> createState() =>
      _ExpandableBottomSheetPageState();
}

class _ExpandableBottomSheetPageState extends State<ExpandableBottomSheetPage> {
  bool isExpanded = false;

  void toggleSheet() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Main content of the page
        widget.body ?? Placeholder(),

        /// Bottom Sheet
        AnimatedPositioned(
          duration: Duration(milliseconds: widget.animationDuration),
          curve: widget.animationCurve,
          onEnd: widget.onEnd,
          bottom: 0,
          left: 0,
          right: 0,
          height:
              isExpanded
                  ? MediaQuery.of(context).size.height *
                      widget.openedHeightPercentage
                  : MediaQuery.of(context).size.height *
                      widget.headerHeightPercentage,

          /// Bottom sheet
          child: Container(
            decoration: widget.bottomSheetDecoration,
            child: Column(
              children: [
                /// Sheet header
                GestureDetector(
                  onTap: toggleSheet,
                  child: Container(
                    height:
                        MediaQuery.of(context).size.height *
                        widget.headerHeightPercentage,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: widget.headerDecoration,
                    child: Stack(
                      children: [
                        if (widget.header != null) widget.header!,
                        if (widget.hasArrow)
                          Align(
                            alignment: widget.arrowAlignment,
                            child: AnimatedRotation(
                              turns: isExpanded ? -0.5 : 0.0,
                              duration: Duration(
                                milliseconds: widget.animationDuration,
                              ),
                              curve: widget.animationCurve,
                              child: Icon(
                                widget.arrowIcon,
                                color: widget.arrowColor,
                                size: widget.arrowSize,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                /// Sheet content
                widget.bottomSheetBody ?? Placeholder(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
