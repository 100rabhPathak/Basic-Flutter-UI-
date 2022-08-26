import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

enum Gender { male, female }

class _BusinessPageState extends State<BusinessPage> {
  String dropdownvalue = 'India';
  String dropdownvalue1 = 'Andhra Pradesh';

  var items1 = [
    'India',
  ];
  var items2 = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Goa',
    'Gujurat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerela',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    ' Delhi',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal'
  ];
  Gender char = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: const AssetImage("assets/hjk.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.15), BlendMode.dstATop),
              ),
            ),
            child: ListView(padding: const EdgeInsets.all(15.0), children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                  icon: Icon(Icons.person),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  icon: Icon(Icons.lock),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  hintText: 'Renter Your Password',
                  icon: Icon(Icons.lock),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Address',
                  hintText: 'Enter Your Address',
                  icon: Icon(Icons.place),
                ),
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text(
                      "Select Country",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: false,
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items1.map((String items1) {
                              return DropdownMenuItem(
                                value: items1,
                                child: Text(items1),
                              );
                            }).toList(),
                            hint: const Align(
                              child: Text(
                                "Select Country",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            onChanged: (String? selectedValue) {
                              setState(() {
                                dropdownvalue = selectedValue!;
                              });
                            })),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text(
                      "Select State",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: false,
                            value: dropdownvalue1,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items2.map((String items2) {
                              return DropdownMenuItem(
                                value: items2,
                                child: Text(items2),
                              );
                            }).toList(),
                            onChanged: (String? selectedValue1) {
                              setState(() {
                                dropdownvalue1 = selectedValue1!;
                              });
                            })),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Select Your Gender",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),

                    // RadioListTile<Gender>(
                    //   title: const Text('Male'),
                    //   value: Gender.male,
                    //   groupValue: char,
                    //   onChanged: (Gender? value) {
                    //     setState(() {
                    //       char = value!;
                    //     });
                    //   },
                    // ),
                    // RadioListTile<Gender>(
                    //     title: const Text('Female'),
                    //     value: Gender.female,
                    //     groupValue: char,
                    //     onChanged: (Gender? value) {
                    //       setState(() {
                    //         char = value!;
                    //       });
                    //     })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio<Gender>(
                        value: Gender.male,
                        groupValue: char,
                        onChanged: (Gender? value) {
                          setState(() {
                            char = value!;
                          });
                        }),
                    const Text('Male'),
                    Radio<Gender>(
                        value: Gender.female,
                        groupValue: char,
                        onChanged: (Gender? value) {
                          setState(() {
                            char = value!;
                          });
                        }),
                    const Text('Female')
                  ],
                ),
              ]),
            ])));
  }
}
