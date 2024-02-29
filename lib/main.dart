import 'package:flutter/material.dart';
import 'package:assignment_3/calc.dart';
import 'package:assignment_3/contact.dart';
import 'package:assignment_3/contact_page.dart';
import 'package:assignment_3/home.dart';
import 'package:assignment_3/pages/sign_in.dart';
import 'package:assignment_3/settings.dart';
import 'package:assignment_3/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: provider.themeMode,
        debugShowCheckedModeBanner: false,
        home: const Home(),
      );
    });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  int selectedDrawerIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    CalculatorPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assigments 2',
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.amber[50],
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'UWABERA Ange Scovia',
              //style: TextStyle(color: Colors.green),
            ),
            accountEmail: const Text(
              'uwaberaange143@gmail.com',
              //style: TextStyle(color: Colors.green),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/image1.jpg',
                ),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'images/image2.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 100,
            )),
          ),
          // const ListTile(
          //   title: Text('Home'),
          //   leading: Icon(Icons.home),
          // ),
          // const ListTile(
          //   title: Text('Calculator'),
          //   leading: Icon(Icons.calculate),
          // ),
          // const ListTile(
          //   title: Text('Contacts'),
          //   leading: Icon(Icons.person),
          // ),
          buildDrawerItem(0, 'Home', Icons.home),
          buildDrawerItem(1, 'Calculator', Icons.calculate),
          buildDrawerItem(2, 'Contacts', Icons.person),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
          const SizedBox(height: 40),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ]),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          const NavigationDestination(
              icon: Icon(Icons.calculate), label: 'Calculator'),
          const NavigationDestination(
              icon: Icon(Icons.person), label: 'Contact'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }

  ListTile buildDrawerItem(int index, String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        // Navigate to the corresponding page and update the selected index
        Navigator.pop(context); // Close the drawer
        setState(() {
          currentPage = index;
          selectedDrawerIndex = index;
        });
      },
      selected: selectedDrawerIndex == index, // Highlight the selected item
    );
  }
}
