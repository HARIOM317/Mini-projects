import 'dart:io';
import 'package:aadhar/components/custom_textfield.dart';
import 'package:aadhar/utils/constants.dart';
import 'package:aadhar/widget/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Get Details Page 1
class GetDetailsPage1 extends StatefulWidget {
  const GetDetailsPage1({super.key});

  static TextEditingController name = TextEditingController();
  static TextEditingController gender = TextEditingController();
  static TextEditingController dob = TextEditingController();
  static TextEditingController fatherName = TextEditingController();
  static TextEditingController townOrCity = TextEditingController();
  static TextEditingController district = TextEditingController();
  static TextEditingController state = TextEditingController();
  static TextEditingController pinCode = TextEditingController();
  static String? selectedGender;
  static String? selectedState;

  @override
  State<GetDetailsPage1> createState() => _GetDetailsPage1State();
}

class _GetDetailsPage1State extends State<GetDetailsPage1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: bgColor),
          child: Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // app icon
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/images/icons/logo.png",
                          width: 120,
                        ),
                      ),

                      // login text
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Enter Your Details",
                          style: TextStyle(
                              fontSize: 28,
                              color: primaryColor,
                              fontFamily: 'OpenSans-Regular',
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Full Name
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextField1(
                                  hintText: "Full Name",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: GetDetailsPage1.name,
                                  validate: (name) {
                                    if (name!.isEmpty || name.length < 3) {
                                      return "Incorrect name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              // Father's Name
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextField1(
                                  hintText: "Father's Name",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: GetDetailsPage1.fatherName,
                                  validate: (name) {
                                    if (name!.isEmpty || name.length < 3) {
                                      return "Incorrect father's name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              // Gender
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: bgColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFF909A9E))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 4, bottom: 4),
                                    child: Center(
                                      child: DropdownButton<String>(
                                          borderRadius: BorderRadius.circular(20),
                                          isExpanded: true,
                                          hint: const Text("Gender"),
                                          value: GetDetailsPage1.selectedGender,
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 35,
                                          ),
                                          dropdownColor: Colors.white,
                                          underline: Container(), //empty line
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87),
                                          iconEnabledColor:
                                              const Color(0xFF909A9E),
                                          items: const [
                                            DropdownMenuItem<String>(
                                                value: "MALE",
                                                child: Text("MALE")),
                                            DropdownMenuItem<String>(
                                                value: "FEMALE",
                                                child: Text("FEMALE")),
                                          ],
                                          onChanged: (newValue) {
                                            setState(() {
                                              GetDetailsPage1.selectedGender =
                                                  newValue!;
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                              ),

                              // DOB
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextField1(
                                  hintText: "DOB",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: GetDetailsPage1.dob,
                                  suffix: GestureDetector(
                                    onTap: () async {
                                      String date = "00";
                                      String month = "00";

                                      DateTime? datePicked = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2050));
                                      if (datePicked != null) {
                                        if (datePicked.day < 10) {
                                          date = "0${datePicked.day}";
                                        } else {
                                          date = "${datePicked.day}";
                                        }

                                        if (datePicked.month < 10) {
                                          month = "0${datePicked.month}";
                                        } else {
                                          month = "${datePicked.month}";
                                        }
                                        GetDetailsPage1.dob.text =
                                            "$date/$month/${datePicked.year}";
                                      }
                                    },
                                    child: const Icon(Icons.calendar_today),
                                  ),
                                  validate: (dob) {
                                    if (dob!.length != 10) {
                                      return "Invalid DOB";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              // Town or City
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextField1(
                                  hintText: "Town or City",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: GetDetailsPage1.townOrCity,
                                  validate: (name) {
                                    if (name!.isEmpty) {
                                      return "Town or City name is required";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              // District
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextField1(
                                  hintText: "District",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: GetDetailsPage1.district,
                                  validate: (name) {
                                    if (name!.isEmpty) {
                                      return "District is required";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),

                              // State
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: bgColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFF909A9E))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 4, bottom: 4),
                                    child: Center(
                                      child: DropdownButton<String>(
                                          borderRadius: BorderRadius.circular(20),
                                          isExpanded: true,
                                          hint: const Text("State"),
                                          value: GetDetailsPage1.selectedState,
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 35,
                                          ),
                                          dropdownColor: Colors.white,
                                          underline: Container(), //empty line
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87),
                                          iconEnabledColor:
                                          const Color(0xFF909A9E),
                                          items: const [
                                            DropdownMenuItem<String>(value: "Andhra Pradesh", child: Text("Andhra Pradesh")),
                                            DropdownMenuItem<String>(value: "Arunachal Pradesh", child: Text("Arunachal Pradesh")),
                                            DropdownMenuItem<String>(value: "Assam", child: Text("Assam")),
                                            DropdownMenuItem<String>(value: "Andaman and Nicobar Islands", child: Text("Andaman and Nicobar Islands")),
                                            DropdownMenuItem<String>(value: "Bihar", child: Text("Bihar")),
                                            DropdownMenuItem<String>(value: "Chhattisgarh", child: Text("Chhattisgarh")),
                                            DropdownMenuItem<String>(value: "Chandigarh", child: Text("Chandigarh")),
                                            DropdownMenuItem<String>(value: "Delhi", child: Text("Delhi")),
                                            DropdownMenuItem<String>(value: "Dadra & Nagar Haveli and Daman & Diu", child: Text("Dadra & Nagar Haveli and Daman & Diu")),
                                            DropdownMenuItem<String>(value: "Goa", child: Text("Goa")),
                                            DropdownMenuItem<String>(value: "Gujarat", child: Text("Gujarat")),
                                            DropdownMenuItem<String>(value: "Haryana", child: Text("Haryana")),
                                            DropdownMenuItem<String>(value: "Himachal Pradesh", child: Text("Himachal Pradesh")),
                                            DropdownMenuItem<String>(value: "Jharkhand", child: Text("Jharkhand")),
                                            DropdownMenuItem<String>(value: "Jammu and Kashmir", child: Text("Jammu and Kashmir")),
                                            DropdownMenuItem<String>(value: "Karnataka", child: Text("Karnataka")),
                                            DropdownMenuItem<String>(value: "Kerala", child: Text("Kerala")),
                                            DropdownMenuItem<String>(value: "Lakshadweep", child: Text("Lakshadweep")),
                                            DropdownMenuItem<String>(value: "Ladakh", child: Text("Ladakh")),
                                            DropdownMenuItem<String>(value: "Madhya Pradesh", child: Text("Madhya Pradesh")),
                                            DropdownMenuItem<String>(value: "Maharashtra", child: Text("Maharashtra")),
                                            DropdownMenuItem<String>(value: "Manipur", child: Text("Manipur")),
                                            DropdownMenuItem<String>(value: "Meghalaya", child: Text("Meghalaya")),
                                            DropdownMenuItem<String>(value: "Mizoram", child: Text("Mizoram")),
                                            DropdownMenuItem<String>(value: "Nagaland", child: Text("Nagaland")),
                                            DropdownMenuItem<String>(value: "Odisha", child: Text("Odisha")),
                                            DropdownMenuItem<String>(value: "Punjab", child: Text("Punjab")),
                                            DropdownMenuItem<String>(value: "Puducherry", child: Text("Puducherry")),
                                            DropdownMenuItem<String>(value: "Rajasthan", child: Text("Rajasthan")),
                                            DropdownMenuItem<String>(value: "Sikkim", child: Text("Sikkim")),
                                            DropdownMenuItem<String>(value: "Tamil Nadu", child: Text("Tamil Nadu")),
                                            DropdownMenuItem<String>(value: "Telangana", child: Text("Telangana")),
                                            DropdownMenuItem<String>(value: "Tripura", child: Text("Tripura")),
                                            DropdownMenuItem<String>(value: "Uttar Pradesh", child: Text("Uttar Pradesh")),
                                            DropdownMenuItem<String>(value: "Uttarakhand", child: Text("Uttarakhand")),
                                            DropdownMenuItem<String>(value: "West Bengal", child: Text("West Bengal")),
                                          ],
                                          onChanged: (newValue) {
                                            setState(() {
                                              GetDetailsPage1.selectedState =
                                              newValue!;
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                              ),

                              // Pin Code
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomTextField1(
                                  hintText: "Pin Code",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  controller: GetDetailsPage1.pinCode,
                                  validate: (pinCode) {
                                    if (pinCode!.length != 6) {
                                      return "Invalid Pin Code";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          )),

                      // Next Button
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const GetDetailsPage2()));
                              }
                            },
                            child: const Text("Next"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to close the app?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    exit(0);
                  },
                  child: const Text("Yes"))
            ],
          );
        });

    return exitApp ?? false;
  }
}

// Get Details Page 2
class GetDetailsPage2 extends StatefulWidget {
  const GetDetailsPage2({super.key});

  static TextEditingController hindiName = TextEditingController();
  static TextEditingController hindiGender = TextEditingController();
  static TextEditingController hindiFatherName = TextEditingController();
  static TextEditingController hindiTownOrCity = TextEditingController();
  static TextEditingController hindiDistrict = TextEditingController();
  static TextEditingController hindiState = TextEditingController();
  static String? selectedHindiGender;
  static String? selectedHindiState;

  @override
  State<GetDetailsPage2> createState() => _GetDetailsPage2State();
}

class _GetDetailsPage2State extends State<GetDetailsPage2> {
  final _formKey = GlobalKey<FormState>();

  Future<bool> _onPop() async {
    goTo(context, const GetDetailsPage1());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,

      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: primaryColor),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GetDetailsPage1())),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: bgColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // app icon
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 10),
                    child: Image.asset(
                      "assets/images/icons/logo.png",
                      width: 120,
                    ),
                  ),

                  // login text
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Enter Your Details in Hindi",
                      style: TextStyle(
                          fontSize: 24,
                          color: primaryColor,
                          fontFamily: 'OpenSans-Regular',
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Full Name
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField1(
                              hintText: "पूरा नाम",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage2.hindiName,
                              validate: (name) {
                                if (name!.isEmpty || name.length < 3) {
                                  return "Incorrect name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          // Father's Name
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField1(
                              hintText: "पिता का नाम",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage2.hindiFatherName,
                              validate: (name) {
                                if (name!.isEmpty || name.length < 3) {
                                  return "Incorrect father's name";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          // Gender
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xFF909A9E))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                child: Center(
                                  child: DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(20),
                                      isExpanded: true,
                                      hint: const Text("लिंग"),
                                      value: GetDetailsPage2.selectedHindiGender,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        size: 35,
                                      ),
                                      dropdownColor: Colors.white,
                                      underline: Container(), //empty line
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87),
                                      iconEnabledColor:
                                      const Color(0xFF909A9E),
                                      items: const [
                                        DropdownMenuItem<String>(
                                            value: "पुरुष",
                                            child: Text("पुरुष")),
                                        DropdownMenuItem<String>(
                                            value: "महिला",
                                            child: Text("महिला")),
                                      ],
                                      onChanged: (newValue) {
                                        setState(() {
                                          GetDetailsPage2.selectedHindiGender =
                                          newValue!;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),

                          // Town or City
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField1(
                              hintText: "गाँव या शहर का नाम",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage2.hindiTownOrCity,
                              validate: (name) {
                                if (name!.isEmpty) {
                                  return "Town or City name is required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          // District
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField1(
                              hintText: "जिला",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage2.hindiDistrict,
                              validate: (name) {
                                if (name!.isEmpty) {
                                  return "District is required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          // State
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xFF909A9E))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                child: Center(
                                  child: DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(20),
                                      isExpanded: true,
                                      hint: const Text("राज्य"),
                                      value: GetDetailsPage2.selectedHindiState,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        size: 35,
                                      ),
                                      dropdownColor: Colors.white,
                                      underline: Container(), //empty line
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87),
                                      iconEnabledColor:
                                      const Color(0xFF909A9E),
                                      items: const [
                                        DropdownMenuItem<String>(value: "आंध्र प्रदेश", child: Text("आंध्र प्रदेश")),
                                        DropdownMenuItem<String>(value: "अरुणाचल प्रदेश", child: Text("अरुणाचल प्रदेश")),
                                        DropdownMenuItem<String>(value: "असम", child: Text("असम")),
                                        DropdownMenuItem<String>(value: "अंडमान व नोकोबार द्वीप समूह", child: Text("अंडमान व नोकोबार द्वीप समूह")),
                                        DropdownMenuItem<String>(value: "बिहार", child: Text("बिहार")),
                                        DropdownMenuItem<String>(value: "छत्तीसगढ", child: Text("छत्तीसगढ")),
                                        DropdownMenuItem<String>(value: "चंडीगढ़", child: Text("चंडीगढ़")),
                                        DropdownMenuItem<String>(value: "दिल्ली", child: Text("दिल्ली")),
                                        DropdownMenuItem<String>(value: "दादर और नगर हवेली एवं दमन और दिउ", child: Text("दादर और नगर हवेली एवं दमन और दिउ")),
                                        DropdownMenuItem<String>(value: "गोवा", child: Text("गोवा")),
                                        DropdownMenuItem<String>(value: "गुजरात", child: Text("गुजरात")),
                                        DropdownMenuItem<String>(value: "हरियाणा", child: Text("हरियाणा")),
                                        DropdownMenuItem<String>(value: "हिमाचल प्रदेश", child: Text("हिमाचल प्रदेश")),
                                        DropdownMenuItem<String>(value: "झारखंड", child: Text("झारखंड")),
                                        DropdownMenuItem<String>(value: "जम्मू और कश्मीर", child: Text("जम्मू और कश्मीर")),
                                        DropdownMenuItem<String>(value: "कर्नाटक", child: Text("कर्नाटक")),
                                        DropdownMenuItem<String>(value: "केरल", child: Text("केरल")),
                                        DropdownMenuItem<String>(value: "लक्षद्वीप", child: Text("लक्षद्वीप")),
                                        DropdownMenuItem<String>(value: "लदाख", child: Text("लदाख")),
                                        DropdownMenuItem<String>(value: "मध्य प्रदेश", child: Text("मध्य प्रदेश")),
                                        DropdownMenuItem<String>(value: "महाराष्ट्र", child: Text("महाराष्ट्र")),
                                        DropdownMenuItem<String>(value: "मणिपुर", child: Text("मणिपुर")),
                                        DropdownMenuItem<String>(value: "मेघालय", child: Text("मेघालय")),
                                        DropdownMenuItem<String>(value: "मिजोरम", child: Text("मिजोरम")),
                                        DropdownMenuItem<String>(value: "नगालैंड", child: Text("नगालैंड")),
                                        DropdownMenuItem<String>(value: "ओडिशा", child: Text("ओडिशा")),
                                        DropdownMenuItem<String>(value: "पंजाब", child: Text("पंजाब")),
                                        DropdownMenuItem<String>(value: "पुदुचेरी", child: Text("पुदुचेरी")),
                                        DropdownMenuItem<String>(value: "राजस्थान", child: Text("राजस्थान")),
                                        DropdownMenuItem<String>(value: "सिक्किम", child: Text("सिक्किम")),
                                        DropdownMenuItem<String>(value: "तमिलनाडु", child: Text("तमिलनाडु")),
                                        DropdownMenuItem<String>(value: "तेलंगाना", child: Text("तेलंगाना")),
                                        DropdownMenuItem<String>(value: "त्रिपुरा", child: Text("त्रिपुरा")),
                                        DropdownMenuItem<String>(value: "उत्तर प्रदेश", child: Text("उत्तर प्रदेश")),
                                        DropdownMenuItem<String>(value: "उत्तराखंड", child: Text("उत्तराखंड")),
                                        DropdownMenuItem<String>(value: "पश्चिम बंगाल", child: Text("पश्चिम बंगाल")),
                                      ],
                                      onChanged: (newValue) {
                                        setState(() {
                                          GetDetailsPage2.selectedHindiState =
                                          newValue!;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),

                  // Next Button
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    const GetDetailsPage3()));
                          }
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// Get Details Page 3
class GetDetailsPage3 extends StatefulWidget {
  const GetDetailsPage3({super.key});

  static TextEditingController phoneNumber = TextEditingController();
  static TextEditingController enrolmentNumber = TextEditingController();
  static TextEditingController aadharNumber = TextEditingController();
  static TextEditingController vid = TextEditingController();

  @override
  State<GetDetailsPage3> createState() => _GetDetailsPage3State();
}

class _GetDetailsPage3State extends State<GetDetailsPage3> {
  final _formKey = GlobalKey<FormState>();

  Future<bool> _onPop() async {
    goTo(context, const GetDetailsPage2());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: primaryColor),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GetDetailsPage2())),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: bgColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // app icon
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 10),
                    child: Image.asset(
                      "assets/images/icons/logo.png",
                      width: 120,
                    ),
                  ),

                  // login text
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Enter Required Details",
                      style: TextStyle(
                          fontSize: 28,
                          color: primaryColor,
                          fontFamily: 'OpenSans-Regular',
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Phone Number
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField2(
                              label: const Text("Phone Number"),
                              hintText: "XXXXXXXXXX",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage3.phoneNumber,
                              validate: (number) {
                                if (number?.length != 10) {
                                  return "Phone Number should be 10 digits (XXXXXXXXXX)";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          // Enrolment No.
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField2(
                              label: const Text("Enrolment No."),
                              hintText: "XXXX/XXXXX/XXXXX",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage3.enrolmentNumber,
                              validate: (number) {
                                if (number?.length != 16) {
                                  return "Please follow the given format (XXXX/XXXXX/XXXXX)";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          // Aadhar Number
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField2(
                              label: const Text("Aadhar Number"),
                              hintText: "XXXX XXXX XXXX",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage3.aadharNumber,
                              validate: (number) {
                                if (number?.length != 14) {
                                  return "Aadhar should be 12 digits with 4 digit format (XXXX XXXX XXXX)";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                          // VID
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomTextField2(
                              label: const Text("VID"),
                              hintText: "XXXX XXXX XXXX XXXX",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: GetDetailsPage3.vid,
                              validate: (number) {
                                if (number?.length != 19) {
                                  return "VID should be 16 digits with 4 digit format (XXXX XXXX XXXX XXXX)";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),

                        ],
                      )
                  ),

                  const SizedBox(height: 100,),

                  // Generate Aadhar Button
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          goTo(context, const HomePage());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                      ),
                      child: const Text("Generate Aadhar", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
