import 'package:flutter/material.dart';
import 'package:mob_queker/global/toast.dart';
import 'package:mob_queker/pages/search_page.dart';
import 'package:mob_queker/pages/show_data_screen.dart';
import '../global/Database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userfirstnamecontroller = TextEditingController();
  TextEditingController userlastnamecontroller = TextEditingController();
  TextEditingController useragecontroller = TextEditingController();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61A3BA),
      appBar: AppBar(
        backgroundColor: Color(0xff61A3BA),
        title: Text(
          'Queker',
          style: TextStyle(fontFamily: 'YourCustomFont', fontSize: 24),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildCard(_buildHorizontalScrollableList()),
              SizedBox(height: 20),
              Text(
                'Berita Seputar Gempa',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFDD),
                ),
              ),
              SizedBox(height: 20),
              _buildCard(_buildGridView()),
              SizedBox(height: 20),
              _buildCard(_buildTextField(
                controller: userfirstnamecontroller,
                hintText: 'Gempa News',
                prefixIcon: Icons.person,
              )),
              SizedBox(height: 20),
              _buildCard(_buildTextField(
                controller: userlastnamecontroller,
                hintText: 'Description',
                prefixIcon: Icons.person,
              )),
              SizedBox(height: 20),
              _buildCard(_buildTextField(
                controller: useragecontroller,
                hintText: 'Date',
                prefixIcon: Icons.person,
              )),
              SizedBox(height: 20),
              _buildCard(_buildUploadButton()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Status Gempa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Crud',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }

  Widget _buildUploadButton() {
    return ElevatedButton(
      onPressed: uploadData,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFA2C579),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Upload Data',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFDD),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD2DE32), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xFFD2DE32)),
              prefixIcon: Icon(prefixIcon, color: Color(0xFFFFFFDD)),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    List<Map<String, dynamic>> gridItems = [
      {"icon": Icons.star, "text": "Gempa dahsyat di Indonesia"},
      {"icon": Icons.favorite, "text": "Korban bencana gempa"},
      {"icon": Icons.music_note, "text": "Gempa dan kerugian harta"},
      {"icon": Icons.movie, "text": "Gempa terbesar di Indonesia"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: gridItems.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFA2C579),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                gridItems[index]["icon"],
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text(
                gridItems[index]["text"],
                style: TextStyle(
                  color: Color(0xFFFFFFDD),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHorizontalScrollableList() {
    List<String> image = [
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
      'assets/1.jpg',
    ];

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Card(
      elevation: 5,
      color: Color(0xFF61A3BA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "First Name": userfirstnamecontroller.text,
      "Last Name": userlastnamecontroller.text,
      "Age": useragecontroller.text,
    };
    await DatabaseMethods().addUserDetails(uploaddata);
    showUpload(message: 'Data Uploaded Successfully');
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowDataScreen()),
        );
      } else if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReadData()),
        );
      }
    });
  }
}
