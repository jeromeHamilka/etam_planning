import 'package:etam_planning/providers/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Cells extends StatefulWidget {
  const Cells({Key? key}) : super(key: key);

  @override
  State<Cells> createState() => _CellsState();
}

class _CellsState extends State<Cells> {
  final ColorsProvider colorsProvider = ColorsProvider();

  @override
  Widget build(BuildContext context) {
    Color nathColors =
        Provider.of<ColorsProvider>(context, listen: true).nathColors;
    Color matildeColors =
        Provider.of<ColorsProvider>(context, listen: true).matildeColors;
    Color mairaColors =
        Provider.of<ColorsProvider>(context, listen: true).mairaColors;
    // Color togglenathColors =
    //     Provider.of<ColorsProvider>(context, listen: true).toggleColorNath();
    return Row(
      children: [
        Container(
          width: 33,
          child: InkWell(
            onTap: () {
              setState(() {
                nathColors = colorsProvider.toggleColorNath();
              });
            },
            child: Container(
              color: colorsProvider.nathColors,
            ),
          ),
        ),
        Container(
          width: 33,
          child: InkWell(
            onTap: () {
              setState(() {
                matildeColors = colorsProvider.toggleColorMatilde();
              });
            },
            child: Container(
              color: colorsProvider.matildeColors,
            ),
          ),
        ),
        Container(
          width: 33,
          child: InkWell(
            onTap: () {
              setState(() {
                mairaColors = colorsProvider.toggleColorMaira();
              });
            },
            child: Container(
              color: colorsProvider.mairaColors,
            ),
          ),
        ),
      ],
    );
  }
}
