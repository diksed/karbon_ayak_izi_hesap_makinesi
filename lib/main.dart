import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/kaiBilgi.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await data.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karbon Ayak İzi Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Karbon Ayak İzi Hesap Makinesi"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/kai_logo.png",
              width: 120,
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,0,15,0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,20,10,20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Karbon Ayak İzi\nHesap Makinesi",style: TextStyle(fontSize: 40),),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0,5,0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,20,10,20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Yıllık bireysel ya da kurumsal bilgilerinizi ilgili alanlara\ngirerek tüketiminizden kaynaklanan karbon emisyon\nmiktarınızı ve doğaya kaç ağaç borçlu olduğunuzu\nhesaplayabilir ve bağış yapabilirsiniz.",style: TextStyle(fontSize: 15,height: 1.6),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.grey, // Button color
                    child: InkWell(
                      splashColor: Colors.green, // Splash color
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>kaiBilgi()));
                      },
                      child: SizedBox(width: 56, height: 56, child: Icon(Icons.question_mark,color: Colors.white,)),
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Colors.grey, // Button color
                    child: InkWell(
                      splashColor: Colors.green, // Splash color
                      onTap: () async {

                      },
                      child: SizedBox(width: 56, height: 56, child: Icon(Icons.chevron_right,color: Colors.white,)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
