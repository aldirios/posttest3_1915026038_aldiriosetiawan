import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { unknown, jantan, betina }
enum Jenis { unknown, kucing, anjing, kelinci }

class _MyHomePageState extends State<MyHomePage> {
  final namaCtrl = TextEditingController();
  final umurCtrl = TextEditingController();
  Gender gender = Gender.unknown;
  Jenis jenis = Jenis.unknown;

  String nama = "";
  String umur = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namaCtrl.dispose();
    umurCtrl.dispose();
    super.dispose();
  }

  String getGender(Gender? value) {
    if (value == Gender.jantan) {
      return "jantan";
    } else if (value == Gender.betina) {
      return "betina";
    }
    return "Tidak Diketahui";
  }

  String getJenis(Jenis? value) {
    if (value == Jenis.kucing) {
      return "kucing";
    } else if (value == Jenis.anjing) {
      return "anjing";
    } else if (value == Jenis.kelinci) {
      return "kelinci";
    }
    return "Tidak Diketahui";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "PET ADOPTER (1915026038-ALDI RIO SETIAWAN)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical:20),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  maxLines: 1,
                  controller: namaCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Hewan",
                    hintText: 'Isi nama hewan yang akan diadopsikan',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  maxLines: 1,
                  controller: umurCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Usia Hewan',
                      labelText: "Isi usia hewan yang akan diadopsikan"),
                ),            
                const SizedBox(height: 20),
                const Text(
                  "Kelamin Hewan : ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text("Jantan"),
                        leading: Radio(
                          groupValue: gender,
                          value: Gender.jantan,
                          onChanged: (Gender? value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Betina"),
                        leading: Radio(
                          groupValue: gender,
                          value: Gender.betina,
                          onChanged: (Gender? value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Jenis Hewan : ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text("Kucing"),
                        leading: Radio(
                          groupValue: jenis,
                          value: Jenis.kucing,
                          onChanged: (Jenis? value) {
                            setState(() {
                              jenis = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Anjing"),
                        leading: Radio(
                          groupValue: jenis,
                          value: Jenis.anjing,
                          onChanged: (Jenis? value) {
                            setState(() {
                              jenis = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Kelinci"),
                        leading: Radio(
                          groupValue: jenis,
                          value: Jenis.kelinci,
                          onChanged: (Jenis? value) {
                            setState(() {
                              jenis = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nama = namaCtrl.text;
                  umur = umurCtrl.text;
                });
              },
              child: const Text("Submit"),
            ),            
            const SizedBox(height: 20),
            Text('Nama hewan $nama'),
            Text('Usia hewan $umur'),
            Text('Gender hewan ${getGender(gender)} '),
            Text('Jenis hewan ${getJenis(jenis)} '),
          ],
        ),
      ),
    );
  }
}
