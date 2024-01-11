import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mob_queker/global/toast.dart';

import '../global/Database.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  String? firstname, lastname, age, id;

  TextEditingController textcontroller = TextEditingController();
  TextEditingController ageController = TextEditingController();

  searchUser(String name) async {
    QuerySnapshot querySnapshot = await DatabaseMethods().getthisUserInfo(name);

    firstname = "${querySnapshot.docs[0]["First Name"]}";
    lastname = "${querySnapshot.docs[0]["Last Name"]}";
    age = "${querySnapshot.docs[0]["Age"]}";
    id = "${querySnapshot.docs[0].id}";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Write User First Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.0),
            _buildInputTextField(
              controller: textcontroller,
              hintText: 'Enter First Name',
            ),
            SizedBox(height: 20.0),
            _buildInputTextField(
              controller: ageController,
              hintText: 'Enter Age',
            ),
            SizedBox(height: 20.0),
            _buildActionButtons(),
            SizedBox(height: 20.0),
            _buildUserData(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFF4c59a5),
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white60),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          label: 'Search',
          onTap: () {
            searchUser(textcontroller.text);
          },
        ),
        _buildActionButton(
          label: 'Update',
          onTap: () async {
            String newAge = ageController.text;
            if (newAge.isNotEmpty) {
              await DatabaseMethods().UpdateUserData(newAge, id!);
              searchUser(textcontroller.text);
              showUpdate(message: 'User Data Updated Successfully!');
            } else {
              showUpdate(message: 'Please enter a valid age.');
            }
          },
        ),
        _buildActionButton(
          label: 'Delete',
          onTap: () async {
            await searchUser(textcontroller.text);
            await DatabaseMethods().DeleteUserData(id!);
            Fluttertoast.showToast(
              msg: "User Data Deleted Successfully!!!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (firstname != null)
          _buildUserDataItem(label: "First Name", value: firstname!),
        if (lastname != null)
          _buildUserDataItem(label: "Last Name", value: lastname!),
        if (age != null) _buildUserDataItem(label: "Age", value: age!),
      ],
    );
  }

  Widget _buildUserDataItem({
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "$label:  $value",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
