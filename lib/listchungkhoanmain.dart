import 'package:flutter/material.dart';

class LayOutChungKhoan extends StatelessWidget {
  final String tencophieu;
  final String tencongty;
  final String san;
  final double gia;
  final int khoiluongGD;
  final double tanggiam;
  final double tangphantr;

  const LayOutChungKhoan(
      {required this.tencophieu,
      required this.tencongty,
      required this.gia,
      required this.san,
      required this.khoiluongGD,
      required this.tanggiam,
      required this.tangphantr,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          tencophieu.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        // gach doc
                        const VerticalDivider(
                          indent: 6,
                          endIndent: 6,
                          color: Color.fromRGBO(230, 230, 230, 1),
                          width: 8,
                        ),
                        Text(
                          san.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  //dong duoi
                  Text(
                    tencongty.toString(),
                    style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                  ),
                ],
              ),
              const Spacer(),
              //  cot 2
              Container(
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      gia.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      khoiluongGD.toString(),
                      style:
                          const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                  ],
                ),
              ),
              // cot 2
              Container(
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    setTextgia(tanggiam),
                    Text(
                      "$tangphantr%",
                      style: const TextStyle(
                        color: Color.fromRGBO(35, 134, 25, 1),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 0.3,
            height: 20,
            color: Color.fromRGBO(0, 0, 0, 0.4),
          ),
        ],
      ),
    );
  }
}

Widget setTextgia(double giaphantram) {
  String text = '';
  Color textColor;
  if (giaphantram < 0) {
    text = giaphantram.toString();
    textColor = Colors.red;
  } else {
    text = '+${giaphantram.toString()}';
    textColor = const Color.fromRGBO(35, 134, 25, 1);
  }

  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
  );
}
