import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/widgets/input_textfield_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  ),
                  InputFieldWidget(
                    text: "DNI",
                    icon: "bx-card",
                  ),

                  QrImage(
                    data: "https://www.youtube.com/watch?v=34Na4j8AVgA&ab_channel=TheWeekndVEVO",
                    version: QrVersions.auto,
                    size: 220.0,
                  ),

                ],
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
