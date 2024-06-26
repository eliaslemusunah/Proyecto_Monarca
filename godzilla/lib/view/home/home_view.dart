import 'package:flutter/material.dart';
import 'package:godzilla/common/color_extension.dart';
import '../../widget/custom_arc_painter.dart';
import '../../widget/segment_button.dart';
import '../../widget/status_button.dart';
import '../../widget/subscription_home_row.dart';
import '../../widget/upcoming_bill_row.dart';
import '../settings/settings_view.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99"
    },
  ];

  List bilArr = [
    {"name": "Spotify", "date": DateTime(2023, 07, 25), "price": "5.99"},
    {
      "name": "YouTube Premium",
      "date": DateTime(2023, 07, 25),
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2023, 07, 25),
      "price": "29.99"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: Scaffold(
        //backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: media.width * 1.1,
                decoration: BoxDecoration(
                    color: TColor.gray70,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/img/home_bg.png"),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          padding:  EdgeInsets.only(bottom: media.width * 0.05),
                          width: media.width * 0.72,
                          height: media.width * 0.72,
                          child: CustomPaint(
                            painter: CustomArcPainter(end: 230, ),
                          ),
                        ),
      
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SettingsView()));
                                  },
                                  icon: Image.asset("assets/img/settings.png",
                                      width: 25,
                                      height: 25,
                                      color: TColor.gray30
                                      ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        const Text(
                          "MONARCA",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 223, 223, 236)
                              ),
                        ),
                        SizedBox(
                          height: media.width * 0.07,
                        ),
                        const Text(
                          "5,500",
                          style: TextStyle(
                              color: Color.fromARGB(255, 223, 223, 236),
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: media.width * 0.077,
                        ),
                        const Text(
                          "Efectivo restante",
                          style: TextStyle(
                              color: Color.fromARGB(255, 223, 223, 236),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: media.width * 0.14,
                        ),
                        
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: StatusButton(
                                  title: "Eventos activos",
                                  value: "03",
                                  statusColor: TColor.secondary,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: StatusButton(
                                  title: "Futuros eventos",
                                  value: "20",
                                  statusColor: TColor.primary10,
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: StatusButton(
                                  title: "Total de eventos",
                                  value: "23",
                                  statusColor: TColor.secondaryG,
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                height: 50,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(63, 62, 76, 1),borderRadius: BorderRadius.all(Radius.circular(14))),
                child: Row(
                  children: [
                    Expanded(
                      child: SegmentButton(
                        title: "Eventos activos",
                        isActive: isSubscription,
                        onPressed: () {
                          setState(() {
                            isSubscription = !isSubscription;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: SegmentButton(
                        title: "Futuros eventos",
                        isActive: !isSubscription,
                        onPressed: () {
                          setState(() {
                            isSubscription = !isSubscription;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              if (isSubscription)
                ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: subArr.length,
                    itemBuilder: (context, index) {
                      var sObj = subArr[index] as Map? ?? {};
      
                      return SubScriptionHomeRow(
                        sObj: sObj,
                        onPressed: () {
      
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SubscriptionInfoView( sObj: sObj ) ));
                        },
                      );
                    }),
              if (!isSubscription)
                ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: subArr.length,
                    itemBuilder: (context, index) {
                      var sObj = subArr[index] as Map? ?? {};
      
                      return UpcomingBillRow(
                        sObj: sObj,
                        onPressed: () {},
                      );
                    }),
              const SizedBox(
                height: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
