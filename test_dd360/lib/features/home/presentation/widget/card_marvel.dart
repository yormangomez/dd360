import 'package:flutter/material.dart';
import 'package:test_dd360/core/helper/format_helpers.dart';
import 'package:test_dd360/core/util/ap_size.dart';
import 'package:test_dd360/core/util/ap_text_style.dart';
import 'package:test_dd360/core/util/apcolors.dart';

class CardMarvel extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String date;

  void Function()? onTap;
  CardMarvel({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: APColors.whitePure,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: APColors.primaryMain.withOpacity(.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          width: double.infinity,
          height: APScreenSize.height(context) / 5,
          child: Table(
            columnWidths: const {
              0: FractionColumnWidth(0.4),
              1: FractionColumnWidth(0.6),
            },
            children: [
              TableRow(children: [
                Container(
                  height: APScreenSize.height(context) / 5,
                  decoration: BoxDecoration(
                    color: APColors.secondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: APScreenSize.height(context) / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'titulo: ',
                          style: APTextStyle.textMD.bold.copyWith(
                            color: APColors.secondaryDark,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          title,
                          style: APTextStyle.textMD.semibold.copyWith(
                            color: APColors.secondaryDark,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Ultima modificación: ',
                          style: APTextStyle.textMD.bold.copyWith(
                            color: APColors.secondaryDark,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          child: Text(
                            AppFormatters.instance.dateFormatUtil(
                              dateTime: DateTime.parse(date),
                              typeFormat: TypeFormat.yyyyMMMdd,
                            ),
                            style: APTextStyle.textMD.semibold.copyWith(
                              color: APColors.secondaryDark,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Descripción: ',
                          style: APTextStyle.textMD.bold.copyWith(
                            color: APColors.secondaryDark,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          style: APTextStyle.textMD.semibold.copyWith(
                            color: APColors.secondaryDark,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
