import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => DestinationScreen(),
        '/login': (context) => Login(),
      },
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade700)),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Où partons-nous ?'),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()))
                    },
                icon: const Icon(Icons.account_box),
                color: Colors.pink.shade700),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: [
              Tab(
                text: 'Campagne',
                icon: Icon(Icons.house_siding),
              ),
              Tab(
                text: 'Sur l\'eau',
                icon: Icon(Icons.houseboat_outlined),
              ),
              Tab(
                text: 'Avec vue',
                icon: Icon(Icons.panorama),
              ),
              Tab(
                text: 'Bord de mer',
                icon: Icon(Icons.scuba_diving),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DestinationDetails(),
            Text('B'),
            Text('C'),
            Text('D'),
          ],
        ),
      ),
    );
  }
}

class DestinationDetails extends StatelessWidget {
  const DestinationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [DestinationPhoto(), const DestinationInfos()],
    );
  }
}

class DestinationPhoto extends StatelessWidget {
  const DestinationPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/przntr.appspot.com/o/48bc7a49-b260-457a-b207-70a47f14e13c.png?alt=media&token=103ba2cf-5800-43d8-b9cf-21b4d0fae2a2',
            fit: BoxFit.cover,
            errorBuilder: (context, _, __) =>
                const Icon(Icons.warning, color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
        ),
        Positioned(left: 8, top: 8, child: MembersFavorite())
      ],
    );
  }
}

class MembersFavorite extends StatelessWidget {
  const MembersFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white70,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, color: Colors.pink),
          /*SizedBox(width: 12),*/
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Coup de coeur Voyageurs'),
          )
        ],
      ),
    );
  }
}

class DestinationInfos extends StatelessWidget {
  const DestinationInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('Paris, France'),
              Spacer(),
              Icon(Icons.star, color: Colors.orange),
              Text('4.78')
            ],
          ),
          Text('3-9 avril'),
          Text('120€ nuit'),
        ],
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Map<String, dynamic> userData = {
    'email': null,
    'password': null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: const Text('Email'),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink.shade300, width: 2),
                ),
                filled: true,
                fillColor: Colors.pink.shade50,
              ),
              controller: emailController,
              validator: (String? value) {
                if (value == null || !value.contains('@')) {
                  return 'Veuillez entrer un email valide.';
                }
                return null;
              },
              inputFormatters: [],
              onSaved: (String? value) => userData['email'] = value,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Mot de passe'),
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.pink.shade300, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.pink.shade50,
                  ),
                  controller: passwordController,
                  validator: (String? value) {
                    return value?.isNotEmpty == true ? null : 'Obligatoire';
                  },
                  onSaved: (String? value) => userData['password'] = value,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Reset'),
                  onPressed: () => formKey.currentState!.reset(),
                ),
                ElevatedButton(
                  child: const Text('Valider'),
                  onPressed: () => formKey.currentState!.validate()
                      ? print('VALIDE')
                      : print('INVALID'),
                ),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    formKey.currentState!.save();
                    print('ONSAVE $userData');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
