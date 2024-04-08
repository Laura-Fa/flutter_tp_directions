import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Où partons nous ?'),
          actions: const [Icon(Icons.account_box, color: Colors.pink)],
          bottom: const TabBar(
            indicatorColor: Colors.pink,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                icon: Icon(Icons.house_siding),
                text: 'Campagne',
              ),
              Tab(icon: Icon(Icons.houseboat_outlined), text: 'Sur l\'eau'),
              Tab(icon: Icon(Icons.panorama), text: 'Avec vue'),
              Tab(icon: Icon(Icons.scuba_diving), text: 'Bord de mer'),
              Tab(icon: Icon(Icons.downhill_skiing), text: 'Ski'),
            ],
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.bottomCenter,
        body: TabBarView(
          children: [
            Column(children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/przntr.appspot.com/o/48bc7a49-b260-457a-b207-70a47f14e13c.png?alt=media&token=103ba2cf-5800-43d8-b9cf-21b4d0fae2a2',
                    fit: BoxFit.fill,
                    errorBuilder: (context, err, stacktrace) =>
                        const Icon(Icons.warning, color: Colors.red),
                  ))
            ]),
            Center(child: Text('Aucune destination disponible')),
            Center(child: Text('Aucune destination disponible')),
            Center(child: Text('Aucune destination disponible')),
            Center(child: Text('Aucune destination disponible')),
          ],
        ),
      ),
    );
  }
}
