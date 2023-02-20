// ignore_for_file: prefer_const_constructors

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_scheme_selector/theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          child: const Text('Items'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ItemsScreen()),
            );
          },
        ),
      ),
      body: _body(context),
    );
  }

  Container _colorItem(FlexScheme scheme) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      color: FlexColorScheme.light(scheme: scheme).primary,
      child: Center(child: Text(scheme.toString().split('.').last)),
    );
  }

  ListView _body(BuildContext context) {
    final cc = Theme.of(context).colorScheme;

    return ListView(
      children: [
        _item(cc.primary, cc.onPrimary, 'primary'),
        _item(cc.primaryContainer, cc.onPrimaryContainer, 'primaryContainer'),
        _item(cc.secondary, cc.onSecondary, 'secondary'),
        _item(cc.secondaryContainer, cc.onSecondaryContainer, 'secondaryContainer'),
        _item(cc.tertiary, cc.onTertiary, 'tertiary'),
        _item(cc.tertiaryContainer, cc.onTertiaryContainer, 'tertiaryContainer'),
        _item(cc.error, cc.onError, 'error'),
        _item(cc.errorContainer, cc.onErrorContainer, 'errorContainer'),
        _item(cc.background, cc.onBackground, 'background'),
        _item(cc.surface, cc.onSurface, 'surface'),
        _item(cc.inverseSurface, cc.onInverseSurface, 'inverseSurface'),
        _item(cc.surfaceVariant, cc.onSurfaceVariant, 'surfaceVariant'),

        // _colorItem(FlexScheme.aquaBlue),
        // _colorItem(FlexScheme.sakura),
        // _colorItem(FlexScheme.materialBaseline),
        // _colorItem(FlexScheme.shark),
        // _colorItem(FlexScheme.indigo),
        // _colorItem(FlexScheme.mandyRed),
        // _colorItem(FlexScheme.deepPurple),
        // _colorItem(FlexScheme.bigStone),
        // _colorItem(FlexScheme.outerSpace),
        // _colorItem(FlexScheme.blueWhale),
        // _colorItem(FlexScheme.sanJuanBlue),
        // _colorItem(FlexScheme.blumineBlue),
        // _colorItem(FlexScheme.flutterDash),
        // _colorItem(FlexScheme.damask),
        // _colorItem(FlexScheme.bahamaBlue),
        // _colorItem(FlexScheme.blue),
        // _colorItem(FlexScheme.hippieBlue),
        // _colorItem(FlexScheme.brandBlue),
        // _colorItem(FlexScheme.deepBlue),
        // _colorItem(FlexScheme.red),
        // _colorItem(FlexScheme.redWine),
        // _colorItem(FlexScheme.green),
        // _colorItem(FlexScheme.jungle),
        // _colorItem(FlexScheme.ebonyClay),
        // _colorItem(FlexScheme.dellGenoa),
      ],
    );
  }

  Widget _item(Color bgColor, Color fgColor, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      height: 100,
      color: bgColor,
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: fgColor),
        ),
      ),
    );
  }
}

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

enum SingingCharacter {
  lafayette,
  jefferson
}

class _ItemsScreenState extends State<ItemsScreen> {
  bool isChecked = false;
  SingingCharacter? _character = SingingCharacter.lafayette;

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    // ====================================================
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: _fab(),
      bottomNavigationBar: _bnav(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            _textField(),
            _textField2(),
            SizedBox(height: 30),
            _checkbox(),
            _radioButton(),
            Divider(),
            _card(),
            _card2(),
            Divider(),
            _elevatedButton1(style),
            _elevatedButton2(),
            _elevatedButton3(),
            Divider(),
            _textButton(),
            Divider(),
            _outlinedButton(),
            Divider(),
            _filledButton(),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  Center _filledButton() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(children: <Widget>[
            const SizedBox(height: 20),
            const Text('Filled'),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
            const SizedBox(height: 20),
            const FilledButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ]),
          const SizedBox(width: 20),
          Column(children: <Widget>[
            const SizedBox(height: 20),
            const Text('Filled tonal'),
            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
            const SizedBox(height: 20),
            const FilledButton.tonal(
              onPressed: null,
              child: Text('Disabled'),
            ),
          ])
        ],
      ),
    );
  }

  Widget _outlinedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: OutlinedButton(
            onPressed: null,
            child: const Text('Disable'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: OutlinedButton(
            onPressed: () {
              debugPrint('Received click');
            },
            child: const Text('Active'),
          ),
        ),
      ],
    );
  }

  Padding _textButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: null,
            child: const Text('Disabled'),
          ),
          const SizedBox(width: 20),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Enabled'),
          ),
        ],
      ),
    );
  }

  Padding _elevatedButton3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text('Press Me'),
        icon: Icon(Icons.swap_calls),
      ),
    );
  }

  Padding _elevatedButton2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: () {}, child: Text('Press Me')),
    );
  }

  Row _elevatedButton1(ButtonStyle style) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: style,
          onPressed: null,
          child: const Text('Disabled'),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: style,
          onPressed: () {},
          child: const Text('Enabled'),
        ),
      ],
    );
  }

  BottomNavigationBar _bnav() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  FloatingActionButton _fab() {
    return FloatingActionButton.extended(
      onPressed: () {
        // Add your onPressed code here!
      },
      label: const Text('Approve'),
      icon: const Icon(Icons.thumb_up),
    );
  }

  Padding _card2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }

  Padding _card() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _radioButton() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _checkbox() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ),
    );
  }

  Padding _textField2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter your username',
        ),
      ),
    );
  }

  Padding _textField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search term',
        ),
      ),
    );
  }
}
