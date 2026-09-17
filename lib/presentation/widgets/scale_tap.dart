import 'package:flutter/material.dart';

class ScaleTap extends StatefulWidget {
  const ScaleTap({
    super.key,
    required this.child,
    this.scale = 0.96,
  });

  final Widget child;
  final double scale;

  @override
  State<ScaleTap> createState() => _ScaleTapState();
}

class _ScaleTapState extends State<ScaleTap> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => _pressed = true),
      onPointerUp: (_) => setState(() => _pressed = false),
      onPointerCancel: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 80),
        scale: _pressed ? widget.scale : 1,
        child: widget.child,
      ),
    );
  }
}
