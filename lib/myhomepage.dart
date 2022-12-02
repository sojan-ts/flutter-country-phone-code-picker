import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var countrycodephone = '+91';
  var countryflag = '🇮🇳';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(
                prefixIcon: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              print('Select country: ${country.displayName}');
                              setState(() {
                                countrycodephone = '+' + country.phoneCode;
                                countryflag = country.flagEmoji;
                                print(countryflag);
                              });
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              child: countryflag != null
                                  ? Text(countryflag,
                                      style: TextStyle(
                                          fontFamily: '', fontSize: 20))
                                  : null,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 22, 22),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                countrycodephone,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                border: InputBorder.none,
                labelText: "Enter phone no."),
          )
        ],
      ),
    );
  }
}
