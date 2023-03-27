import "package:flutter/material.dart";

import '../utils/break_points.dart';
import 'components/table_widgets.dart';

class StackTable extends StatefulWidget {
  final isOpen, size;
  StackTable({this.isOpen, this.size});

  @override
  State<StackTable> createState() => _StackTableState();
}

class _StackTableState extends State<StackTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: !widget.isOpen
          ? widget.size.width - 60
          : widget.size.width - (drawerWidth + 60),
      height: widget.size.height - 80,
      child: CustomTable(),
    );
  }
}
