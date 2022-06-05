import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/data.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SayfaUc extends StatefulWidget {
  const SayfaUc({Key? key}) : super(key: key);

  @override
  State<SayfaUc> createState() => _SayfaUcState();
}

class _SayfaUcState extends State<SayfaUc> {
  double percent = 0.28;
  var yakitList = <String>["Benzin","Dizel","LPG"];
  String? secilenYakit;
  int yakitLitre = 0;
  String? yakitTuru;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LinearPercentIndicator(
              width: 411,
              animation: false,
              lineHeight: 30,
              animationDuration: 2000,
              animateFromLastPercent: true,
              percent: percent,
              center:
              Text("Karbon ayak iziniz hesaplanıyor..",style: TextStyle(fontWeight: FontWeight.bold),),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("resimler/araba.png",
                  width: 50,
                  height: 50,
                ),
                Text("Kara Ulaşımı",style: TextStyle(fontSize: 40),),
              ],
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Text("Arabayı hızlı kullanmamak, hem daha az yakıt harcamak, hem de doğaya az zarar vermek demektir.",style: TextStyle(fontSize: 20),),
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,0,10,0),
                  child: Text("Yakıt Türü :",style: TextStyle(fontSize: 20),),
                ),
                DropdownButton<String>(
                  value: yakitTuru,
                  hint: Text("Tür Seçiniz"),
                  items: yakitList.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text("$value",style: TextStyle(fontSize: 20),),
                    );
                  }).toList(),
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String? selectedData){
                    setState(() {
                      secilenYakit=selectedData ?? "";
                      yakitTuru=secilenYakit;
                      percent = 0.38;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,5,0),
                  child: Text("Yıllık Toplam Tüketim :",style: TextStyle(fontSize: 20),),
                ),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,45,0),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Litre"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (String? data){
                        setState(() {
                          yakitLitre = int.parse(data!);
                          percent = 0.52;
                        });
                      },
                    ),
                  ),
                ),
              ],
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
                      onTap: () async {
                        await data.setDataInt("yakitLitre", yakitLitre);
                        await data.setDataString("yakitTuru", yakitTuru!);

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
