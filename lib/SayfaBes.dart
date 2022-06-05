import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/data.dart';
import 'package:percent_indicator/percent_indicator.dart';


class SayfaBes extends StatefulWidget {
  const SayfaBes({Key? key}) : super(key: key);
  @override
  State<SayfaBes> createState() => _SayfaBesState();
}
class _SayfaBesState extends State<SayfaBes> {
  String? secilenBirim;
  double percent = 0.7;
  var isinmaList = <String>["Doğalgaz","Kömür","LPG","Fuel-Oil","Odun/Biyokütle/Biyogaz"];
  String? secilenIsinma;
  String? yakitTuru;
  int yakitTuketim = 0;
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
                Image.asset("resimler/alev.png",
                  width: 50,
                  height: 50,
                ),
                Text("Isınma Değerleri",style: TextStyle(fontSize: 40),),
              ],
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Text("Evinde kullandığın ısıtma cihazlarını ne kadar az veya verimli kullanırsan, küresel ısınma o kadar az etkilenir.",style: TextStyle(fontSize: 20),),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,20,0),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    value: yakitTuru,
                    hint: Text("Tür Seçiniz"),
                    items: isinmaList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text("$value",style: TextStyle(fontSize: 20),),
                      );
                    }).toList(),
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String? selectedData){
                      setState(() {
                        if(selectedData==isinmaList[0]){
                          secilenBirim="m3";
                        }
                        else if(selectedData==isinmaList[1]){
                          secilenBirim="Kilogram";
                        }
                        else if(selectedData==isinmaList[2]){
                          secilenBirim="Litre";
                        }
                        else if(selectedData==isinmaList[3]){
                          secilenBirim="Litre";
                        }
                        else if(selectedData==isinmaList[4]){
                          secilenBirim="m3/ton";
                        }
                        secilenIsinma=selectedData ?? "";
                        yakitTuru=secilenIsinma;
                        percent=0.84;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
                  child: Text("Yıllık Toplam Tüketim :",style: TextStyle(fontSize: 20),),
                ),
                SizedBox(
                  width: 115,
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,45,0),
                    child: TextField(
                      decoration: InputDecoration(hintText: secilenBirim),
                      onChanged: (String? data){
                        setState(() {
                          yakitTuketim=int.parse(data!);
                          percent=1;
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
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
                        await data.setDataString("secilenIsinma", secilenIsinma!);
                        await data.setDataInt("yakitTuketim", yakitTuketim);

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