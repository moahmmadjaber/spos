
import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spos/utilis/routes.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class NoificationPage extends StatefulWidget {
  const NoificationPage({Key? key}) : super(key: key);

  @override
  State<NoificationPage> createState() => _NoificationPageState();
}

class _NoificationPageState extends State<NoificationPage> {
  bool switchValue=true;

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
      setState(() {

      });
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [

            /*SizedBox(
              height: 80,child:
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.lightBlue[300]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(0.1),
                child: Image(
                      image: new AssetImage("assets/aynf.png"),
                      width: 90,
                      height: 90,),
              ),

            ),*/
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(7),
                        child: IconButton(
                          color: Colors.white, onPressed: () { Navigator.pop(context);}, icon:const Icon( Icons.arrow_back_ios_new, size: 28,),
                        ),
                      ),
                      // hi sponsor
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الاشعارات',
                              style: GoogleFonts.tajawal(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                      //notification
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(7),
                        child: IconButton(
                          color: Colors.white, onPressed:  () =>   {UrlLauncher.launch("tel://6777") }, icon:const Icon( Icons.call, size: 28,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      //heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ايقاف او تشغيل الاشعارات',
                            style: GoogleFonts.tajawal(fontWeight: FontWeight.bold,fontSize: 20),),
                          Switch(
                            value: switchValue ??= true,
                            onChanged: (newValue) async {
                              setState(() => switchValue = newValue!);
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      //listview
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child:
                        Visibility(
                          visible: false,
                          replacement:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [ CardLoading(
                            height: 30,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            width: 100,
                            margin: EdgeInsets.only(bottom: 10),
                          ),
                            CardLoading(
                              height: 100,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              margin: EdgeInsets.only(bottom: 10),
                            ),
                            CardLoading(
                              height: 30,
                              width: 200,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              margin: EdgeInsets.only(bottom: 10),
                            ),]
                          ),
                          child: const ListTile(horizontalTitleGap: 20,
                            tileColor: Colors.lightBlue,
                            leading: Icon(Icons.info_outlined),
                            title: Text('العنوان'),
                            subtitle: Text('التفاصيل'),
                          ),

                        )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
