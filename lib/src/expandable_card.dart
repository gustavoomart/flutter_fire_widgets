import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  /// The widget to display as the header/title of the expandable card.
  /// This is always visible and can be tapped to expand or collapse the card.
  final Widget? header;

  /// The widget to display as the expandable body content of the card.
  /// This content is shown when the card is expanded and hidden when collapsed.
  final Widget? body;

  /// The duration of the expand/collapse animation.
  /// Defaults to 300 milliseconds if not specified.
  final Duration? duration;

  /// The curve to use for the expansion animation.
  /// Defaults to [Curves.bounceOut].
  final Curve expandingCurve;

  /// The curve to use for the collapse animation.
  /// Defaults to [Curves.bounceIn].
  final Curve colapsingCurve;

  /// The background color of the header section.
  /// If null, uses the default [Material] color.
  final Color? headerColor;

  /// The splash color effect when tapping the header.
  /// This is the color of the circular effect that appears when tapping.
  final Color? splashColor;

  /// The background color of the card body.
  /// If null, uses the default [Card] color.
  final Color? bodyColor;

  /// The surface tint color for the card.
  /// Used for Material 3 surface tint overlay.
  final Color? surfaceTintColor;

  /// The z-coordinate at which to place this card.
  /// Controls the size of the shadow below the card.
  final double? elevation;

  /// The internal padding for both header and body contents.
  /// Applied separately to header and body widgets.
  final EdgeInsetsGeometry? padding;

  /// The margin around the entire card.
  /// Controls spacing between this card and other widgets.
  final EdgeInsetsGeometry? margin;

  /// The shape of the card.
  /// Use this to control the border radius or other shape properties.
  final ShapeBorder? cardShape;

  /// The shape of the bottom edge of the header.
  /// Defines the transition between header and body.
  final ShapeBorder headerBottomShape;

  /// The color of the card's shadow.
  /// Only visible when [elevation] is greater than zero.
  final Color? shadowColor;

  /// Whether to paint the border in front of the card's child.
  /// If true, the border is painted on top of the child.
  final bool borderOnForeground;

  /// Whether this widget represents a single semantic container.
  /// See [Card.semanticContainer] for more details.
  final bool semanticContainer;

  /// Whether the card should start in an expanded state.
  /// If true, the body is visible when the card is first built.
  final bool startExpanded;

  /// How to clip the content of the card.
  /// See [Clip] for more details about clipping options.
  final Clip clipBehavior;

  /// Whether to show an arrow icon indicating expand/collapse state.
  /// If true, an animated arrow will be shown in the header.
  final bool hasArrow;

  /// The icon to use for the expand/collapse indicator.
  /// This icon will be rotated based on the expand/collapse state.
  final IconData arrowIcon;

  /// The color of the expand/collapse arrow icon.
  /// If null, uses the default icon color for the theme.
  final Color? arrowColor;

  /// The alignment of the arrow icon within the header.
  /// Controls the positioning of the arrow relative to the header.
  final Alignment arrowAlignment;

  /// The size of the arrow icon in logical pixels.
  /// Controls the width and height of the arrow icon.
  final double arrowSize;

  /// The margin around the arrow icon.
  /// Used to position the arrow within the header.
  final EdgeInsetsGeometry arrowMargin;

  /// The highlight color that appears when the header is tapped.
  /// This is the color that fills the header when it's pressed.
  final Color? highlightColor;

  /// The color to use for the header when it has input focus.
  /// Only visible if the card can receive focus.
  final Color? focusColor;

  /// The color to use for the header when the mouse is hovering over it.
  /// Only visible on devices with pointer support.
  final Color? hoverColor;

  /// Factory for creating the splash effect when tapping the header.
  /// Allows customization of the ink splash effect.
  final InteractiveInkFeatureFactory? splashFactory;

  /// The border radius for the ink splash and highlight effects.
  /// Controls the shape of the ink response in the header.
  final BorderRadius? borderRadius;

  /// The radius for the circular ink splash effect.
  /// If specified, creates a circular splash rather than conforming to borders.
  final double? radius;

  /// Whether tapping the header should provide acoustic and/or haptic feedback.
  /// Defaults to true.
  final bool enableFeedback;

  /// Whether to exclude the ink well from semantics tree.
  /// See [InkWell.excludeFromSemantics] for more details.
  final bool excludeFromSemantics;

  /// Whether this widget can receive focus.
  /// If false, the header will not be focusable via keyboard navigation.
  final bool canRequestFocus;

  /// Whether this widget should be automatically focused when it appears.
  /// If true, the header will request focus when it's first built.
  final bool autoFocus;

  /// A callback that is called when the expansion/colapse animation ends.
  /// The bool isdicates whether the card is expanded (true) or collapsed (false).
  final void Function(bool isExpanded)? onEnd;

  const ExpandableCard({
    super.key,
    required this.header,
    required this.body,
    this.duration,
    this.expandingCurve = Curves.bounceOut,
    this.colapsingCurve = Curves.bounceIn,
    this.elevation,
    this.padding,
    this.margin,
    this.shadowColor,
    this.headerColor,
    this.splashColor,
    this.bodyColor,
    this.cardShape,
    this.headerBottomShape = const RoundedRectangleBorder(),
    this.surfaceTintColor,
    this.borderOnForeground = true,
    this.semanticContainer = true,
    this.clipBehavior = Clip.antiAlias,
    this.startExpanded = false,
    this.hasArrow = true,
    this.arrowIcon = Icons.keyboard_arrow_up,
    this.arrowColor,
    this.arrowAlignment = Alignment.centerRight,
    this.arrowSize = 24,
    this.arrowMargin = const EdgeInsets.only(right: 16.0),
    // Valores padrão para as novas propriedades
    this.highlightColor,
    this.focusColor,
    this.hoverColor,
    this.splashFactory,
    this.borderRadius,
    this.radius,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.canRequestFocus = true,
    this.autoFocus = false,
    this.onEnd,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _isExpanded = widget.startExpanded;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 600),
      value: _isExpanded ? 1.0 : 0.0,
    );

    _animation = _controller.drive(
      Tween(begin: 0.0, end: 1.0).chain(
        CurveTween(
          curve: _isExpanded ? widget.expandingCurve : widget.colapsingCurve,
        ),
      ),
    );
    _controller.addStatusListener(_animationStatusListener);

    if (_isExpanded) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_animationStatusListener);
    _controller.dispose();
    super.dispose();
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      widget.onEnd?.call(_isExpanded);
    }
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;

      _animation = _controller.drive(
        Tween(begin: 0.0, end: 1.0).chain(
          CurveTween(
            curve: _isExpanded ? widget.expandingCurve : widget.colapsingCurve,
          ),
        ),
      );

      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.bodyColor,
      shadowColor: widget.shadowColor,
      surfaceTintColor: widget.surfaceTintColor,
      elevation: widget.elevation,
      shape: widget.cardShape,
      borderOnForeground: widget.borderOnForeground,
      margin: widget.margin,
      clipBehavior: widget.clipBehavior,
      semanticContainer: widget.semanticContainer,
      child: Column(
        children: [
          // Header
          Material(
            color: widget.headerColor,
            shape: widget.headerBottomShape,
            child: InkWell(
              onTap: _toggleExpansion,
              // Novas propriedades customizáveis do InkWell
              splashColor: widget.splashColor,
              highlightColor: widget.highlightColor,
              focusColor: widget.focusColor,
              hoverColor: widget.hoverColor,
              splashFactory: widget.splashFactory,
              borderRadius: widget.borderRadius,
              radius: widget.radius,
              enableFeedback: widget.enableFeedback,
              excludeFromSemantics: widget.excludeFromSemantics,
              canRequestFocus: widget.canRequestFocus,
              autofocus: widget.autoFocus,
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    if (widget.header != null)
                      Padding(
                        padding: widget.padding ?? const EdgeInsets.all(0),
                        child: widget.header,
                      ),
                    if (widget.hasArrow)
                      Positioned.fill(
                        child: Padding(
                          padding: widget.arrowMargin,
                          child: Align(
                            alignment: widget.arrowAlignment,
                            child: RotationTransition(
                              turns: Tween<double>(
                                begin: 0.0,
                                end: 0.5,
                              ).animate(_animation),
                              child: Icon(
                                widget.arrowIcon,
                                color: widget.arrowColor,
                                size: widget.arrowSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Card body
          ClipRect(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.topCenter,
                  heightFactor: _animation.value,
                  child: SingleChildScrollView(child: child!),
                );
              },
              child:
                  widget.body != null
                      ? Padding(
                        padding: widget.padding ?? const EdgeInsets.all(0),
                        child: widget.body,
                      )
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}
