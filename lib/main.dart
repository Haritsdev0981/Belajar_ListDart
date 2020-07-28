import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('List Bumbu Dapur'),
      ),
        body: ListView(
          children: <Widget>[
            Foods(
              nama: 'Garem Enak',
              deskripsi: 'Bumbu Dapur alami ',
              stok: '5.liter/5k',
              gambar: 'assets/images/garem.jpg',
            ),Foods(
              nama: 'Gula Manis kek Kamu',
              deskripsi: 'Manis banget kamu tuhh ',
              stok: '5.liter/10k',
              gambar: 'assets/images/gula.jpg',
            ),Foods(
              nama: 'Kecap Item',
              deskripsi: 'Item kayak gw ngapa lu',
              stok: '5 botol',
              gambar: 'assets/images/kecap.jpg',
            ),Foods(
              nama: 'Saos Andalan',
              deskripsi: 'Gk ada saos kayak hambar',
              stok: '10 botol',
              gambar: 'assets/images/saos.jpg',
            ),
          ],
        ),
    );
  }
}

final baseTextStyle =
    const TextStyle(color: Colors.white, fontFamily: 'Product Sans');
final bigHeaderTextStyle = baseTextStyle.copyWith(
    fontSize: 24.0, fontWeight: FontWeight.bold); // bigheader untuk judul nama product
final descTextStyle = baseTextStyle.copyWith(fontSize: 18.0,
    fontWeight: FontWeight.w200); // desctext itu untuk deskripsi product
final footerTextStyle = baseTextStyle.copyWith(fontSize: 14.0,fontWeight: FontWeight.w400);// footerText untuk stok product

class Foods extends StatelessWidget {
  final String nama, deskripsi, stok, gambar;

  const Foods({Key key, this.nama, this.deskripsi, this.stok, this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 250.0,
      child: Stack(
        children: <Widget>[
          backgroundImage(gambar),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: topContent(nama, deskripsi, stok),
            ),
          )
        ],
      ),
    );
  }

  backgroundImage(String gambar) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.luminosity),
              image: AssetImage(gambar))),
    );
  }

  topContent(String nama, String deskripsi, String stok) {
    return new Container(
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//agar seimbang
        mainAxisSize: MainAxisSize.max,// untuk menggatur banyak ruang maxsimal
        children: <Widget>[
          Text(
            nama, style: bigHeaderTextStyle,
          ),
          Text(
            deskripsi, style: descTextStyle,
          ),
          Container(
            width: 80.0,
            height: 2.0,
            color: Colors.lightGreenAccent,
          ),
          Text(
            stok, style: footerTextStyle,
          )
        ],
      ),
    );// new tidak dipakai juga tidak papa saya jg kurang tau knp yaa karna tidak dijelaskan tpi makai juga gpp
  }
}
