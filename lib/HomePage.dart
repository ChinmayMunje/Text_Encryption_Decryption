import 'package:encryption_decryption_flutter/encryption.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textEditingController = new TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encryption"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(15),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Enter your text",
                ),
              ),
            ),
            Column(
              children: [
                Text("PLAIN TEXT",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.all(9),
                  child: Text(plainText == null ? "": plainText),
                ),
              ],
            ),
            Column(
              children: [
                Text("ENCRYPTED TEXT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.all(9),
                  child: Text(encryptedText == null ? "": encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText),

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: (){
                    plainText = textEditingController.text;
                    setState(() {
                      encryptedText = EncryptionDecryption.encryptAES(plainText);
                    });
                  },
                  child: Text("Encrypt",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 10),
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      encryptedText = EncryptionDecryption.decryptAES(encryptedText);
                    });
                  },
                  child: Text("Decrypt",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
