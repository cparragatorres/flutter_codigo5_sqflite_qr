import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_sqflite_qr/db/db_admin.dart';
import 'package:flutter_codigo5_sqflite_qr/models/license_model.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/widgets/input_textfield_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegisterPage extends StatefulWidget {
  String url;
  RegisterPage({
    required this.url,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      "Registrar nuevo carnet",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputFieldWidget(
                      text: "Nombres completos",
                      icon: "bx-user",
                      isDNI: false,
                    ),
                    InputFieldWidget(
                      text: "DNI",
                      icon: "bx-card",
                      isDNI: true,
                    ),
                    Row(
                      children: [
                        Text(
                          "Carner QR: ",
                          style: TextStyle(
                            color: kFontPrimaryColor.withOpacity(0.6),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    QrImage(
                      data: widget.url,
                      version: QrVersions.auto,
                      size: 220.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 52.0,
              margin: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBrandPrimaryColor,
                  // primary: Color(0xff04CD8B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                onPressed: () {
                  LicenseModel licenseModel = LicenseModel(
                    name: "Juana",
                    dni: "23232322",
                    url: "https://carnetvacunacion.minsa.gob.pe/#publico/certificado/index?Tk=v3-J4cMCIPqW7QWLX5wFJPZiZTc637whHDP5NcoPhJXKxU=",
                  );

                  DBAdmin.db.insertLincese();
                },
                child: const Text(
                  "Finalizar registro",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
