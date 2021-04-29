import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_messanger/authentica/auth.dart';
import 'package:my_messanger/database/constaint.dart';
import 'package:my_messanger/database/user_record.dart';
import 'package:my_messanger/screens/toggle_screen.dart';
import 'package:my_messanger/shared_preferences/save_data.dart';
import 'package:my_messanger/widgets/searchTile.dart';
import 'package:my_messanger/widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchTextEditingController =
      new TextEditingController();
  Database db = new Database();
  QuerySnapshot snapshot;

  Widget search() {
    return snapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              return SearchTile(
                username: snapshot.docs[index].get("name"),
                email: snapshot.docs[index].get("email"),
              );
            })
        : Container();
  }

  searchUserName() {
    db.searchUser(searchTextEditingController.text).then((val) {
      setState(() {
        snapshot = val;
      });
    });
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  // part 3 20 minutes

  getUserInfo() async {
    Constants.myNAme = await SaveUserFunction.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Search Screen',
          style: GoogleFonts.abel(fontSize: 24.0, color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              Authenticate().logOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ToggleScreen()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Icon(Icons.exit_to_app, size: 25.0)),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SearchTextField(
              controller: searchTextEditingController,
              hintText: 'search username...',
              icon: Icons.search_sharp,
              onTab: () => searchUserName(),
            ),
            SizedBox(
              height: 10.0,
            ),
            search(),
          ],
        ),
      ),
    );
  }
}
