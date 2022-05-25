import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/db/db_admin.dart';
import 'package:flutter_codigo5_sqflite_qr/models/license_model.dart';
import 'package:flutter_codigo5_sqflite_qr/pages/scanner_qr_page.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/widgets/item_list_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<LicenseModel> licenses = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    licenses = await DBAdmin.db.getLicenses2();
    setState(() {

    });
  }



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
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                const Text(
                  "Mis carnets registrados",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: licenses.length,
                    itemBuilder: (BuildContext context, int index){
                      return ItemListWidget(
                        name: licenses[index].name,
                        dni: licenses[index].dni,
                        url: licenses[index].url,
                      );
                    },
                  ),
                ),

              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 52.0,
              width: double.infinity,
              margin: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ScannerQRPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: kBrandPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                label: const Text(
                  "Escaner QR",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                icon: SvgPicture.asset(
                  'assets/icons/bx-qr-scan.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
