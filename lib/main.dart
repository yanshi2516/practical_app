import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

///TASK 2
/*void main() {
  List<String> inputList = ["P", "P", "P", "P", "WE", "WE", "N", "N", "N", "N", "N", "S", "S", "P","P","Z"];

  List<String> outputList = [];
    for (int i = 0; i < inputList.length; i++) {
      if (outputList.contains(inputList[i]) == false) {
        List<String> sublist =
            inputList.where((element) => element == inputList[i]).toList();
        if (sublist.length > 1) {
          outputList.addAll([inputList[i], inputList[i]]);
        }
      }
    }
    print("OUTPUT LIST ${outputList}");
}
*/


///TASK 3
/*void main() {
    List<int> list = [3,2,4,6,1,7,8,5,9];
    int selectedNumber = 4;
    int selectedIndex = list.indexWhere((element) => element == selectedNumber);
    List<int> outputList = [];
    outputList.addAll(list.sublist(selectedIndex + 1).toList());
    outputList.addAll(list.sublist(0,selectedIndex));
    print("OUTPUT LIST $outputList");
}*/