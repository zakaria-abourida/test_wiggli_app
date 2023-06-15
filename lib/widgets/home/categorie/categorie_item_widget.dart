import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_wiggli_app/models/categorie.dart';

class CategorieItemWidget extends StatefulWidget {
  final bool selected;
  final Categorie categorie;
  const CategorieItemWidget(
      {super.key, required this.categorie, required this.selected});

  @override
  State<CategorieItemWidget> createState() => _CategorieItemWidgetState();
}

class _CategorieItemWidgetState extends State<CategorieItemWidget> {
  bool isSelected = false;
  @override
  void initState() {
    setState(() {
      isSelected = widget.selected;
    });
    super.initState();
  }

  void toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
            onPressed: () => toggleSelected(),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              enableFeedback: true,
              backgroundColor: isSelected
                  ? const Color.fromRGBO(139, 92, 246, 1)
                  : const Color(0xFFf5f5f5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? const Color.fromRGBO(139, 92, 246, 1)
                      : const Color.fromRGBO(156, 163, 175, 1),
                  width: 1,
                ),
              ),
            ),
            child: Row(children: [
              Visibility(
                visible: widget.categorie.icon.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SvgPicture.asset(widget.categorie.icon,
                      color: isSelected
                          ? Colors.white
                          : const Color.fromRGBO(156, 163, 175, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(widget.categorie.title,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color.fromRGBO(156, 163, 175, 1),
                    )),
              )
            ])));
  }
}
