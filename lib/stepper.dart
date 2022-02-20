import 'package:flutter/material.dart';

import 'package:stepper_flutter/stepper_screen.dart';

class StepperUsage extends StatefulWidget {
  const StepperUsage({Key? key}) : super(key: key);

  @override
  StepperUsageState createState() => StepperUsageState();
}

class StepperUsageState extends State<StepperUsage> {
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  int _aktifStep = 0;
  String? isim, mail, sifre;
  bool hata = false;

  @override
  Widget build(BuildContext context) {
    var tumStepler = _tumSteppler();
    //! buarada bu olmaz build metodu triggerlanınca değer tekrardan 0 olur int _aktifStep = 0;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.teal),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Giriş yapınız',
                style: Theme.of(context).textTheme.headline4,
              ),
              margin: const EdgeInsets.only(bottom: 50),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stepper(
                  steps: tumStepler,
                  currentStep: _aktifStep,
                  /*       onStepTapped: (tiklanilenStep) {
                    setState(() {
                      _aktifStep = tiklanilenStep;
                    });
                  }, */
                  onStepContinue: () {
                    setState(() {
                      _ileriButonKontrolu();
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (_aktifStep != 0) {
                        _aktifStep--;
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //! Stepper list
  List<Step> _tumSteppler() {
    List<Step> stepler = [
      Step(
        title: const Text('Username Giriniz'),
        subtitle: const Text('user name alt başlik'),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: 'usernameLabel',
            hintText: 'usernameHint',
          ),
          validator: (deger) {
            if (deger!.length < 6) {
              return 'en az 6 karakter giriniz';
            }
          },
          key: key0,
          onSaved: (girilenUser) {
            isim = girilenUser;
          },
        ),
      ),
      Step(
        title: const Text('mail Giriniz'),
        subtitle: const Text('mail alt başlik'),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          validator: (deger) {
            if (deger!.length < 6 || deger.contains('@')) {
              return 'geçerli mail giriniz';
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'mailLabel',
            hintText: 'mailHint',
          ),
          key: key1,
          onSaved: (girilenMail) {
            mail = girilenMail;
          },
        ),
      ),
      Step(
        title: const Text('sifre Giriniz'),
        subtitle: const Text('sifre alt başlik'),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          validator: (deger) {
            if (deger!.length < 6) {
              return 'en az 6 karakter giriniz';
            }
          },
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            labelText: 'sifreLabel',
            hintText: 'sifreHint',
          ),
          key: key2,
          onSaved: (girilenSifre) {
            sifre = girilenSifre;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else if (oankiStep > _aktifStep) {
      return StepState.indexed;
    } else {
      return StepState.complete;
    }
  }

  void _ileriButonKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep++;
        } else
          hata = true;
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep++;
        } else
          hata = true;
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          formTamamlandi();
        } else
          hata = true;
        break;
    }
  }

  void formTamamlandi() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StepperScreen(isim)),
    );
  }
}
