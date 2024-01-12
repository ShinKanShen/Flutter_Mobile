import 'package:flutter/material.dart';

class LayOutChungKhoan extends StatelessWidget {
  const LayOutChungKhoan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 16),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          "VIX",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        // gach doc
                        VerticalDivider(
                          indent: 6,
                          endIndent: 6,
                          color: Color.fromRGBO(230, 230, 230, 1),
                          width: 8,
                        ),
                        Text(
                          "HOSE",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  //dong duoi
                  Text(
                    "NH TMCP Ngoai Thuong",
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                  ),
                ],
              ),
              //  cot 2
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "27.38",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "10.000.000",
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                  ),
                ],
              ),

              //  cot 3
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "+0.89",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(35, 134, 25, 1),
                    ),
                  ),
                  Text(
                    "+26.66%",
                    style: TextStyle(
                      color: Color.fromRGBO(35, 134, 25, 1),
                    ),
                  )
                ],
              ),
            ],
          ),
          Divider(
                thickness: 2,
                height: 20,
                color:  Color.fromRGBO(0, 0, 0, 0.4),
                ),
        ],
      ),
    );
  }
}
