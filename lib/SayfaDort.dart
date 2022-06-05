import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/SayfaBes.dart';
import 'package:karbon_ayak_izi_hesap_makinesi/data.dart';
import 'package:percent_indicator/percent_indicator.dart';


class SayfaDort extends StatefulWidget {
  const SayfaDort({Key? key}) : super(key: key);

  @override
  State<SayfaDort> createState() => _SayfaDortState();
}
class _SayfaDortState extends State<SayfaDort> {
  double percent = 0.52;
  int elektrikTuketim = 0;
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
                Image.asset("resimler/simsek.png",
                  width: 50,
                  height: 50,
                ),
                Text("Elektrik Tüketimi",style: TextStyle(fontSize: 40),),
              ],
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Text("Evinde kullandığın ürünlerin ve ampullerin enerji dostu olması doğa için çok faydalıdır.",style: TextStyle(fontSize: 20),),
            ),
            Container(
              height: 3,
              color: Colors.lightGreen[200],
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
                      decoration: InputDecoration(hintText: "kwh"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (String? data){
                        setState(() {
                          elektrikTuketim = int.parse(data!);
                          percent = 0.66;
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
                        await data.setDataInt("elektrikTuketim", elektrikTuketim);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SayfaBes()));
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
