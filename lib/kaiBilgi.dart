import 'package:flutter/material.dart';

class kaiBilgi extends StatefulWidget {
  const kaiBilgi({Key? key}) : super(key: key);

  @override
  State<kaiBilgi> createState() => _kaiBilgiState();
}

class _kaiBilgiState extends State<kaiBilgi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/kai_logo.png",
              width: 60,
              height: 60,
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
                      Text("Karbon Ayak İzi Nedir?",style: TextStyle(fontSize: 30),),
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
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Bir bireyin, bir ülkenin veya bir kuruluşun sürdürdüğü\nfaaliyetler sonucu atmosfere saldığı sera gazlarının\nkarbondioksit cinsinden karşılığı ',style: TextStyle(fontSize: 15,height: 1.6)),
                            TextSpan(text: 'karbon ayak izi', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,height: 1.6)),
                            TextSpan(text: '\nolarak adlandırılır',style: TextStyle(fontSize: 15,height: 1.6)),
                          ],
                        ),
                      ),
                      //Text("Bir bireyin, bir ülkenin veya bir kuruluşun sürdürdüğü\nfaaliyetler sonucu atmosfere saldığı sera gazlarının\nkarbondioksit cinsinden karşılığı karbon ayak izi\nolarak adlandırılır",style: TextStyle(fontSize: 15,height: 1.6),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 56, height: 56, child: Icon(Icons.info_outlined,color: Colors.grey,size: 60.0,)),
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
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '2018 verilerine göre Türkiye\'de kişi başına düşen yıllık\nortalama karbon ayak izi ' ,style: TextStyle(fontSize: 15,height: 1.6)),
                            TextSpan(text: '3.287 ton ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,height: 1.6)),
                            TextSpan(text: 'karbondioksittir.' ,style: TextStyle(fontSize: 15,height: 1.6)),
                          ],
                        ),
                      ),
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
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'İstanbul, kişi başına düşen 5.2 ton karbondioksit ile\n' ,style: TextStyle(fontSize: 15,height: 1.6)),
                            TextSpan(text: 'Dünya\'da en yüksek karbon ayak izine sahip ' ,style: TextStyle(fontSize: 15,height: 1.6)),
                            TextSpan(text: '26. ili ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,height: 1.6)),
                            TextSpan(text: 'oldu.' ,style: TextStyle(fontSize: 15,height: 1.6)),
                          ],
                        ),
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
                      splashColor: Colors.red, // Splash color
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(width: 56, height: 56, child: Icon(Icons.chevron_left,color: Colors.white,)),
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
