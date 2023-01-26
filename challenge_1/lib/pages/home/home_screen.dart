import 'package:challenge_1/pages/home/widgets/devices.dart';
import 'package:challenge_1/utils/hex_color.dart';
import 'package:flutter/material.dart';

import '../../models/device_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DeviceModel> devices = [
    DeviceModel(
      name: 'Smart Spotlight',
      isActive: true,
      color: "#ff5f5f",
      icon: 'assets/svg/light.svg',
    ),
    DeviceModel(
      name: 'Smart AC',
      isActive: true,
      color: "#7739ff",
      icon: 'assets/svg/ac.svg',
    ),
    DeviceModel(
      name: 'Smart TV',
      isActive: false,
      color: "#c9c306",
      icon: 'assets/svg/tv.svg',
    ),
    DeviceModel(
      name: 'Smart Sound',
      isActive: false,
      color: "#c207db",
      icon: 'assets/svg/speaker.svg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFFfce2e1),
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hi,Hany",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      minRadius: 16,
                      backgroundImage: AssetImage("assets/images/user.webp"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "A total of 4 devices",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    "Living Room",
                                    style: TextStyle(
                                      height: 1.1,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: Colors.grey[300],
                                size: 30,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: devices.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Devices(
                                  name: devices[index].name!,
                                  svg: devices[index].icon!,
                                  color: devices[index].color!.toColor(),
                                  isActive: devices[index].isActive!,
                                  onChanged: (val) {
                                    setState(() {
                                      devices[index].isActive =
                                          !devices[index].isActive!;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
