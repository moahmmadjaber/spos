import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spos/Data/model/login/user_model.dart';
import 'package:spos/business_logic/home/cubit/home_cubit.dart';
import 'package:spos/constants/enum_constant.dart';
import 'package:spos/constants/my_constant.dart';
import 'package:spos/presentation/notification/notification.dart';
import 'package:spos/utilis/routes.dart';
import 'package:spos/utilis/shared_pref.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var selectedItem;

  final UserModel _userModel = UserModel();

  @override
  void initState() {

    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SharedPref.getName().then((value) {
      setState(() {
        _userModel.first_name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: data(),
    );
  }

  Widget data() {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          showToast('يرجى الانتظار', ToastType.load);
          BlocProvider.of<HomeCubit>(context).getData();
          return loading();
        } else if (state is HomeLoading) {
          return loading();
        } else if (state is HomeComplete) {
          EasyLoading.dismiss();
          return form(state.model);
        } else if (state is HomeError) {
          EasyLoading.dismiss();
          showToast(state.err, ToastType.error);
          failed(retry);
        }
        return failed(retry);
      },
      listener: (context, state) {},
    );
  }

  Widget form(model) {

    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd('ar_SA').format(now);
    return Container(
      color: Colors.blue[800],
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // hi sponsor
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('مرحبا ${_userModel.first_name}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600)),

                          Text(
                            formattedDate,
                            style: TextStyle(color: Colors.blue[200],fontSize: 20,fontWeight: FontWeight.bold),
                          )
                        ]),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(7),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NoificationPage()),
                          );
                        },
                        icon: const Icon(
                          Icons.notifications,
                          size: 28,
                        ),
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
          Expanded(child: info(model))
        ],
      ),
    );
  }

  Widget info(model) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      child: model.beneficentname == null
          ? noData()
          : Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  //heading
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'بيانات الكفيل ',
                        style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      PopupMenuButton(onSelected: (value) {
                        // your logic
                        setState(() {
                          selectedItem = value.toString();
                        });
                      }, itemBuilder: (BuildContext bc) {
                        return const [
                          PopupMenuItem(
                            value: 'boxes',
                            child: Text("الصناديق"),
                          ),
                          PopupMenuItem(
                            value: 'expens',
                            child: Text("المالية"),
                          ),
                          PopupMenuItem(
                            value: 'spons',
                            child: Text("الكفالات"),
                          )
                        ];
                      })
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(child: check(model))
                  //listview
                ],
              ),
            ),
    );
  }

  Widget check(model) {
    if (selectedItem == 'expens') {
      return Container(child: expenes(model));
    } else if (selectedItem == 'boxes') {
      return Container(child: boxes(model));
    }
    return Container();
  }

  Widget expenes(model) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(model.paidAMOUNTS.toString(),
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold, fontSize: 20)),
          Text('كمية المبالغ المدفوعة',
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold, fontSize: 20))
        ],
      ),
    );
  }

  Widget boxes(model) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(model.beneficentOLDNO.toString(),
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold, fontSize: 20)),
          Text('كمية مبالغ الصناديق المدفوعة',
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold, fontSize: 20))
        ],
      ),
    );
  }

  Widget loading() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd('ar_SA').format(now);
    return Container(
      color: Colors.blue[800],
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // hi sponsor
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('مرحبا ${_userModel.first_name}',
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(color: Colors.blue[200]),
                          )
                        ]),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(7),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 28,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }

  void logout() {
    SharedPref.removeUser();
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginRoute, (route) => false);
  }

  void retry() {
    BlocProvider.of<HomeCubit>(context).getData();
    showToast('يرجى الانتظار', ToastType.load);
  }
}
