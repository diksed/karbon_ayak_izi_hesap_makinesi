import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/data.dart';
import 'package:url_launcher/url_launcher.dart';

class SayfaSonuc extends StatefulWidget {
  const SayfaSonuc({Key? key}) : super(key: key);

  @override
  State<SayfaSonuc> createState() => _SayfaSonucState();
}
class _SayfaSonucState extends State<SayfaSonuc> {
  int ucusSuresi = 0;
  int ucusSayisi = 0;
  int yakitLitre = 0;
  int elektrikTuketim = 0;
  int yakitTuketim = 0;
  String yakitTuru = "";
  String secilenIsinma="";
  @override
  initState(){
    getDataInt("ucusSuresi", ucusSuresi);
    getDataInt("ucusSayisi", ucusSayisi);
    getDataInt("yakitLitre", yakitLitre);
    getDataInt("elektrikTuketim", elektrikTuketim);
    getDataInt("yakitTuketim", yakitTuketim);
    getDataString("secilenIsinma");
    getDataString("yakitTuru");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("resimler/yaprak.png",
                    width: 50,
                    height: 50,
                  ),
                  Text("Sonuçlar",style: TextStyle(fontSize: 40),),
                ],
              ),
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Text("Yıllık karbon ayakizi miktarını oluşturan sera gazı salımı toplamınız aşağıda belirtilmiştir.",style: TextStyle(fontSize: 20),),
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
                      Text("Hava Ulaşımı",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                      Text(hesapHavaUlasim(ucusSuresi, ucusSayisi).toStringAsFixed(1)+" kg."),
                    ],
                  ),
                ),
              ),
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
                      Text("Kara Ulaşımı",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text(hesapKaraUlasim(yakitTuru, yakitLitre).toStringAsFixed(1)+" kg."),
                    ],
                  ),
                ),
              ),
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
                      Text("Elektrik Tüketimi",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${(elektrikTuketim*0.49).toStringAsFixed(1)} kg."),
                    ],
                  ),
                ),
              ),
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
                      Text("Isınma Değerleri",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text(hesapIsinma(secilenIsinma, yakitTuketim).toStringAsFixed(1)+" kg."),
                    ],
                  ),
                ),
              ),
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
                      Text("Toplam CO2 Salımı",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text(co2Hesap().toString()+" ton"),
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
                      splashColor: Colors.red, // Splash color
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(width: 56, height: 56, child: Icon(Icons.chevron_left,color: Colors.white,)),
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Colors.grey, // Button color
                    child: InkWell(
                      splashColor: Colors.green, // Splash color
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                                title: Text("BAĞIŞ YAP"),
                                content: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Doğaya yıllık '),
                                      TextSpan(text: '${agacSayisi()}', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' ağaç borcunuz var.\n\n'),
                                      TextSpan(text: '\"\$\"', style: TextStyle(decoration: TextDecoration.underline)),
                                      TextSpan(text: ' butonundan fidan dikerek\n\ndoğaya verdiğiniz zararı denkleştirebilirsiniz.'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.grey, // Button color
                                      child: InkWell(
                                        splashColor: Colors.red, // Splash color
                                        onTap: () {
                                          Navigator.of(context).popUntil((route) => route.isFirst);
                                        },
                                        child: SizedBox(width: 56, height: 56, child: Icon(Icons.close,color: Colors.white,size: 40,)),
                                      ),
                                    ),
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: Colors.grey, // Button color
                                      child: InkWell(
                                        splashColor: Colors.green, // Splash color
                                        onTap: () async {
                                          const url = 'https://www.tema.org.tr/tek-seferlik-genel-bagis';
                                          if(await canLaunchUrl(Uri.parse(url))){
                                            await launchUrl(Uri.parse(url));
                                          }else {
                                            throw '$url Başlatılamadı!';
                                          }
                                        },
                                        child: SizedBox(width: 56, height: 56, child: Icon(Icons.attach_money,color: Colors.white,size: 35,)),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      },
                      child: SizedBox(width: 56, height: 56, child: Icon(Icons.home,color: Colors.white,)),
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
  void getDataInt(String keyValue, int kayitValue){
    if(keyValue=="ucusSuresi"){
      data.getDataInt("ucusSuresi").then((value){
        setState(() {
          ucusSuresi=value!;
        });
      });
    }
    else if(keyValue=="ucusSayisi"){
      data.getDataInt("ucusSayisi").then((value){
        setState(() {
          ucusSayisi=value!;
        });
      });
    }
    else if(keyValue=="yakitLitre"){
      data.getDataInt("yakitLitre").then((value){
        setState(() {
          yakitLitre=value!;
        });
      });
    }
    else if(keyValue=="elektrikTuketim"){
      data.getDataInt("elektrikTuketim").then((value){
        setState(() {
          elektrikTuketim=value!;
        });
      });
    }
    else if(keyValue=="yakitTuketim"){
      data.getDataInt("yakitTuketim").then((value){
        setState(() {
          yakitTuketim=value!;
        });
      });
    }
  }
  void getDataString(String keyValue){
    if(keyValue=="yakitTuru"){
      data.getDataString("yakitTuru").then((value){
        setState(() {
          yakitTuru=value!;
        });
      });
    }
    else if(keyValue=="secilenIsinma"){
      data.getDataString("secilenIsinma").then((value){
        setState(() {
          secilenIsinma=value!;
        });
      });
    }
  }
  double hesapKaraUlasim(String yakitTuru, int litre){
    if(yakitTuru=="Benzin"){
      return litre*2.24;
    }
    else if(yakitTuru=="Dizel"){
      return litre*2.6;
    }
    else if(yakitTuru=="LPG"){
      return litre*1.68;
    }
    else{
      return 0.0;
    }
  }
  double hesapHavaUlasim(int ucusSuresi, int sayi){
    if(ucusSuresi*sayi==1){
      return 51.46;
    }
    else if(ucusSuresi*sayi>1){
      return ((ucusSuresi * sayi - 1) * 56.93) + 51.46;
    }
    else{
      return 0;
    }
  }
  double hesapIsinma(String Isinma, int yakitTuketim){
    if(Isinma=="Doğalgaz"){
      return yakitTuketim*2.02;
    }
    else if(Isinma=="Kömür"){
      return yakitTuketim*2.04;
    }
    else if(Isinma=="LPG"){
      return yakitTuketim*1.68;
    }
    else if(Isinma=="Fuel-Oil"){
      return yakitTuketim*2.96;
    }
    else{
      return 0.0;
    }
  }
  String co2Hesap(){
    double hava = hesapHavaUlasim(ucusSuresi, ucusSayisi);
    double kara = hesapKaraUlasim(yakitTuru, yakitLitre);
    double elektrik = elektrikTuketim*0.49;
    double isinma = hesapIsinma(secilenIsinma, yakitTuketim);
    return ((hava+kara+elektrik+isinma)/1000).toStringAsFixed(2);
  }
  String agacSayisi(){
    if(double.parse(co2Hesap())/0.411<0.411){
      return 1.toStringAsFixed(0);
    }
    else{
      return (double.parse(co2Hesap())/0.411).toStringAsFixed(0);
    }
  }
}