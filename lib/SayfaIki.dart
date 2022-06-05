import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/data.dart';
import 'package:percent_indicator/percent_indicator.dart';


class SayfaIki extends StatefulWidget {
  const SayfaIki({Key? key}) : super(key: key);

  @override
  State<SayfaIki> createState() => _SayfaIkiState();
}

class _SayfaIkiState extends State<SayfaIki> {
  var saatList = <int>[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
  double percent = 0.0;
  int secilenSaat = 0;
  int ucusSuresi = 0;
  int ucusSayisi = 0;

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
                Image.asset("resimler/ucak.png",
                  width: 50,
                  height: 50,
                ),
                Text("Hava Ulaşımı",style: TextStyle(fontSize: 40),),
              ],
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Text("Uçaklar, yüksek derecede fosil yakıt kullanırlar ve doğaya ciddi anlamda zarar verirler.",style: TextStyle(fontSize: 20),),
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Uçuş Süresi (Tek Yön) :",style: TextStyle(fontSize: 20),),
                DropdownButton<int>(
                  menuMaxHeight: 250,
                  value: secilenSaat,
                  items: saatList.map<DropdownMenuItem<int>>((int value){
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text("$value saat",style: TextStyle(fontSize: 20),),
                    );
                  }).toList(),
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (int? selectedData){
                    setState(() {
                      secilenSaat=selectedData!;
                      ucusSuresi = secilenSaat;
                      percent=0.14;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Uçuş Sayısı :",style: TextStyle(fontSize: 20),),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: SpinBox(
                    min: 0,
                    max: 50,
                    value: 0,
                    onChanged: (data){
                      setState(() {
                        ucusSayisi = data.toInt();
                        percent = 0.28;
                      });
                    },
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
                        await data.setDataInt("ucusSuresi", ucusSuresi);
                        await data.setDataInt("ucusSayisi", ucusSayisi);

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
