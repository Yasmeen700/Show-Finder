import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YearPickerWidget extends StatelessWidget {
  YearPickerWidget(
      {Key? key, required this.showYear, required this.selectedYear,required this.yearTextController})
      : super(key: key);
  Rx<String> showYear;
  Rx<DateTime> selectedYear;
  TextEditingController yearTextController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Select Year"),
                content: SizedBox(
                  width: 300,
                  height: 300,
                  child: YearPicker(
                    firstDate: DateTime(DateTime.now().year - 50, 1),
                    lastDate: DateTime.now(),
                    initialDate: null,
                    selectedDate: selectedYear.value,
                    onChanged: (DateTime dateTime) {
                      selectedYear.value = dateTime;
                      showYear.value = "${dateTime.year}";
                      yearTextController.text="${dateTime.year}";
                      Get.back();
                    },
                  ),
                ),
              );
            },
          ).then((value) {
            if (value != null) {
              selectedYear = value;
            }
          });
        },
        child: AbsorbPointer(
          child: TextField(
            controller: yearTextController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: '${showYear.value}Year',
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
