import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  Reviews({Key key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ListView(
          children: [
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(2, 2))
                  ]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/opel.jpg'),
                              radius: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('They provide very good services.'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star_border_outlined, color: Colors.orange, size: 22,),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Just now',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
           Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/man.jpeg'),
                              radius: 30,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('They provide very good services.'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star, color: Colors.orange, size: 18,),
                                      Icon(Icons.star_border_outlined, color: Colors.orange, size: 22,),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Just now',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}