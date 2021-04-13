//ios platform
import 'package:flutter/cupertino.dart';
//main library
import 'package:flutter/material.dart';
//qr generate library
import 'package:qr_flutter/qr_flutter.dart';
//date and time library
import 'package:intl/intl.dart';

TextEditingController name=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController address=TextEditingController();
TextEditingController customer=TextEditingController();

// class Generate extends StatefulWidget {
//   @override
//   _GenerateState createState() => _GenerateState();
// }
//
// class _GenerateState extends State<Generate> {
//   var now = new DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: QrImage(
//               version: QrVersions.auto,
//               // gapless: false,
//               // foregroundColor: Colors.red,
//               errorCorrectionLevel: QrErrorCorrectLevel.Q,
//               embeddedImageEmitsError: false,
//               embeddedImage: AssetImage('assets/131.png'),
//               embeddedImageStyle: QrEmbeddedImageStyle(
//                   size: Size(150, 150),
//                 color: Colors.red,
//               ),
//               data: name.text + '-' + phone.text + '-' + address.text +'-'
//                   + customer.text + '-'
//                   + new DateFormat("dd/MM/yyyy-hh:mm:ss").format(now),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var now = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('QR Code Flutter')),
        body: Center(
            child: Container(
                child: Stack(alignment: Alignment(0, 0), children: <Widget>[
                  // Gradient
                  Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            // stops: [0.0, 1],
                            colors: [Colors.blue, Colors.blue],
                          )
                      )),
                  // overlay
                  Container(
                    width: 340,
                    height: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                  ),
                  // QR Code
                  QrImage(
                    data: name.text + '-' + phone.text + '-' + address.text +'-'
                        + customer.text + '-'
                        + new DateFormat("dd/MM/yyyy-hh:mm:ss").format(now),
                    size: 339,
                    errorCorrectionLevel: QrErrorCorrectLevel.Q,
                    // gapless: false,
                    version: QrVersions.auto,
                    // foregroundColor: Colors.blue[800],
                  ),
                  // Logo background
                  Container(
                    width: 80,
                    height: 80,
                    child: Image.asset('assets/131.png',color: Colors.blueAccent[700],),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                  ),
                  // Logo
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   // decoration: BoxDecoration(
                  //   //     borderRadius: BorderRadius.circular(12),
                  //   //     gradient: LinearGradient(
                  //   //       begin: Alignment.bottomLeft,
                  //   //       end: Alignment.topRight,
                  //   //       stops: [0.0, 1],
                  //   //       colors: [Color(0xFFF7941F), Colors.blue],
                  //   //     )),
                  //   // child: Icon(Icons.home, color: Colors.white, size: 33),
                  //   child: Image.asset('assets/131.png'),
                  // )
                ]))));
  }
}