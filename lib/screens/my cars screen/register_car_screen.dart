import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nedaj/export.dart';

class RegisterCarScreen extends StatefulWidget {
  const RegisterCarScreen({super.key});

  @override
  _RegisterCarScreenState createState() => _RegisterCarScreenState();
}

class _RegisterCarScreenState extends State<RegisterCarScreen> {
  String plateCode = '';
  String plateRegion = '';
  String plateNumber = '';

  Color _getColorForCode(String code) {
    switch (code) {
      case '1':
        return Colors.red;
      case '2':
        return Colors.blue;
      case '3':
        return Colors.green;
      case '4':
        return Colors.black;
      default:
        return Colors.grey;
    }
  }

  String _getDisplayRegion(String region) {
    switch (region) {
      case 'Ethiopia(ET)':
        return 'ኢ\nት';
      case 'Addis Ababa(AA)':
        return 'አ\nአ';
      case 'Afar(AF)':
        return 'አ\nፋ';
      case 'Dire Dawa(DR)':
        return 'ድ\nሪ';
      case 'Amhara(AM)':
        return 'አ\nማ';
      case 'Benshangul Gumuz(BG)':
        return 'ቢ\nግ';
      case 'Gambella(GB)':
        return 'ጋ\nብ';
      case 'Harari(HR)':
        return 'ሀ\nረ';
      case 'Oromia(OR)':
        return 'ኦ\nሮ';
      case 'Somali(SM)':
        return 'ሱ\nማ';
      case 'Tigray(TG)':
        return 'ት\nግ';
      case 'Debub Hizboch(DH)':
        return 'ደ\nሃ';
      default:
        if (region.length >= 2) {
          return region.substring(0, 2).toUpperCase();
        } else {
          return region.toUpperCase();
        }
    }
  }

  bool get _isFormValid =>
      plateCode.isNotEmpty && plateRegion.isNotEmpty && plateNumber.length == 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register Car'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add your car',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 32,
                      )),
              Text(
                  'Get your Nedaj QR Code ready to pay instantly at your nearest fuel station.',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                      )),
              SizedBox(height: 20),
              // info container
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                ),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gap(20),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: _getColorForCode(plateCode), width: 1),
                          ),
                          child: Text(
                            plateCode,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: _getColorForCode(plateCode),
                                ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          _getDisplayRegion(plateRegion),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: _getColorForCode(plateCode),
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        Text(
                          plateNumber,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: _getColorForCode(plateCode),
                                fontSize: 40,
                              ),
                        ),
                        Spacer(),
                        Gap(30),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // plate code
              Text('Plate Code',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                      )),
              SizedBox(height: 4),
              GestureDetector(
                onTap: () => _showPlateCodeBottomSheet(context),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Plate Code',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.grey.shade500,
                                fontSize: 18,
                              ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      suffixIcon: Icon(Icons.keyboard_arrow_down),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    controller: TextEditingController(text: plateCode),
                  ),
                ),
              ),
              SizedBox(height: 18),
              // plate region
              Text('Plate Region',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                      )),
              SizedBox(height: 4),
              GestureDetector(
                onTap: () => _showPlateRegionBottomSheet(context),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Plate Region',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.grey.shade500,
                                fontSize: 18,
                              ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      suffixIcon: Icon(Icons.keyboard_arrow_down),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    controller: TextEditingController(text: plateRegion),
                  ),
                ),
              ),
              SizedBox(height: 18),
              // plate number
              Text('Plate Number',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                      )),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Plate Number',
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (value) {
                  setState(() {
                    plateNumber = value;
                  });
                },
              ),
              SizedBox(height: 220),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isFormValid
                      ? () {
                          // Handle car registration
                          print('Car registered');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isFormValid ? Colors.green : Colors.grey.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Register Car',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPlateCodeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              for (var code in ['1', '2', '3', '4'])
                ListTile(
                  title: Text('Code $code'),
                  onTap: () {
                    setState(() {
                      plateCode = code;
                    });
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _showPlateRegionBottomSheet(BuildContext context) {
    final regions = [
      'Ethiopia(ET)',
      'Addis Ababa(AA)',
      'Afar(AF)',
      'Amhara(AM)',
      'Dire Dawa(DR)',
      'Benshangul Gumuz(BG)',
      'Gambella(GB)',
      'Harari(HR)',
      'Oromia(OR)',
      'Somali(SM)',
      'Tigray(TG)',
      'Debub Hizboch(DH)'
    ];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Select Plate Region',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: regions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(regions[index]),
                      onTap: () {
                        setState(() {
                          plateRegion = regions[index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
