import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kFontPrimaryColor),
        title: const Text(
          "VacunApp Storage",
          style: TextStyle(
            color: kFontPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Text(
                "Mis carnets registrados",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Container(
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
                    Column(
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
                          "Elvis Barrionuevo",
                        ),
                        Text(
                          "Nro. DNI",
                        ),
                        Text(
                          "43115433",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
