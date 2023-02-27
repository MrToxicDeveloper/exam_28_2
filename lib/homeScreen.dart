import 'package:exam_28_2/ModalClass.dart';
import 'package:exam_28_2/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black38,
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: Colors.black38,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: //Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: [
              //   Text(
              //     "My Contact",
              //     style: TextStyle(color: Colors.black38, fontSize: 20),
              //   ),
              //   SizedBox(
              //     height: 20,
              //   ),
              //   Container(
              //     height: 50,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //             blurRadius: 5,
              //             spreadRadius: 0.1,
              //             offset: Offset(-1, 1),
              //             color: Colors.black26),
              //       ],
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(7),
              //       ),
              //     ),
              //     alignment: Alignment.center,
              //     child: Padding(
              //       padding: EdgeInsets.all(12),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "Type Name or Number",
              //             style: TextStyle(color: Colors.black54),
              //           ),
              //           Icon(
              //             Icons.search_rounded,
              //             color: Colors.black38,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              //   SizedBox(
              //     height: 20,
              //   ),
              ListView.builder(
            itemBuilder: (context, index) =>
                Ans(All[index].Name!, All[index].Number!),
            itemCount: All.length,
          ),
          //   ],
          // ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () async{
                        ImagePicker img = ImagePicker();

                        XFile? imag = await img.pickImage(source: ImageSource.gallery);
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text("Pick Image"),
                      ),
                    ),
                    TextField(
                      controller: txtName,
                    ),
                    TextField(
                      controller: txtNumber,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Modal m1 =
                            Modal(Name: txtName.text, Number: txtNumber.text);
                        setState(() {
                          All.add(m1);
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget Ans(String name, String number) {
    return ListTile(
      leading: CircleAvatar(child: Image.asset(imag)),
      title: Text("$name"),
      subtitle: Text("$number"),
      
      trailing: IconButton(
          onPressed: () {
            Uri launchUri = Uri(
              scheme: 'tel',
              path: number,
            );
          },
          icon: Icon(Icons.call)),
      // trailing: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     IconButton(onPressed: () {
      //
      //     }, icon: Icon(Icons.call)),
      //     IconButton(onPressed: () {
      //
      //     }, icon: Icon(Icons.message_outlined))
      //   ],
      // ),
    );
  }
}
