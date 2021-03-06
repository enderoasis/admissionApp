import 'package:flutter/material.dart';

typedef FocusNodeBuilder = Widget Function(
    BuildContext context, FocusNode focusNode);

class FocusWidget extends StatefulWidget {
  final FocusNode focusNode;
  final Widget child;

  const FocusWidget({
    Key key,
    this.focusNode,
    this.child,
  })  : assert(child != null && focusNode != null),
        super(key: key);

  @override
  FocusWidgetState createState() => FocusWidgetState();

  static FocusWidget builder(BuildContext context, FocusNodeBuilder builder) {
    final focusNode = FocusNode();
    return FocusWidget(
      focusNode: focusNode,
      child: builder(
        context,
        focusNode,
      ),
    );
  }
}

class FocusWidgetState extends State<FocusWidget> {
  OverlayEntry _overlayEntry;
  Offset topLeft, bottomRight;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_focusEvent);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_focusEvent);
    super.dispose();
  }

  void update() {
    if (!widget.focusNode.hasFocus) return;
    final RenderBox renderBox = context.findRenderObject();
    final size = renderBox.size;
    topLeft = renderBox.localToGlobal(Offset.zero);
    bottomRight = topLeft + Offset(size.width, size.height);
  }

  void _focusEvent() {
    if (widget.focusNode.hasFocus) {
      update();
//      print('focus ${_focusNode.hasFocus} \n'
//          'topLeft:$topLeft \n'
//          'bottomRight: $bottomRight');
      _overlayEntry = new OverlayEntry(
        builder: (context) {
          return Stack(
            children: [
              Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (PointerDownEvent e) {
//                  print('onPointerDown \n'
//                      'dx ${e.position.dx} ${topLeft.dx} ${bottomRight.dx}\n'
//                      'dy ${e.position.dy} ${topLeft.dy} ${bottomRight.dy}');
                  final overX = e.position.dx <= topLeft.dx ||
                      e.position.dx >= bottomRight.dx;
                  final overY = e.position.dy <= topLeft.dy ||
                      e.position.dy >= bottomRight.dy;
                  // print('dx: $overX \ndy: $overY');
                  if (overX || overY) {
                    // print('超出');
                    widget.focusNode?.unfocus();
                  }
                },
              ),
            ],
          );
        },
      );
      Overlay.of(context).insert(_overlayEntry);
    } else {
      _overlayEntry?.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}