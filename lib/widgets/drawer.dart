import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageURL =
        "https://us.123rf.com/450wm/deadburnett/deadburnett2303/deadburnett230300651/201286789-doge-meme-funny-portrait-face-of-dog-closeup-classic-art-design-generative-ai.jpg?ver=6";
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 108, 100, 251),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets
                    .zero, //yeh krne se mera jo v padding aa rha tha woh chala gya
                child: UserAccountsDrawerHeader(
                  accountEmail: Text('gadrialhritik@gamil.com'),
                  accountName: Text('Hritik Anand'),
                  currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageURL)), //agr simple image.network(imageURL) kr rhe the toh simple rectangular image aa rha tha
                )),
                const ListTile(
                  leading: Icon(CupertinoIcons.home, color: Colors.white,),
                  title:Text('Home' , textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
                ),
                const ListTile(
                  leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
                  title:Text('Profile' , textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
                ),
                const ListTile(
                  leading: Icon(CupertinoIcons.mail, color: Colors.white,),
                  title:Text('Email me' , textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
                )                
          ],
        ),
      ),
    );
  }
}
