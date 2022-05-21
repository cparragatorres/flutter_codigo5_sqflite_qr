import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_svg/svg.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10.0,
      ),
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bx-user.svg',
                      color: kFontPrimaryColor.withOpacity(0.6),
                      height: 13.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Nombres",
                      style: TextStyle(
                        color: kFontPrimaryColor.withOpacity(0.6),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Elvis Barrionuevo asdasdas asdadasd asdasdsad asdasd",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bx-card.svg',
                      color: kFontPrimaryColor.withOpacity(0.6),
                      height: 13.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Nro. DNI",
                      style: TextStyle(
                        color: kFontPrimaryColor.withOpacity(0.6),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "43115433",
                  style: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/bx-link.svg',
              color: kFontPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}