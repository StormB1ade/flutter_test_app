import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const MyHomePage(title: 'Stadiums of Russia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const MyWidget(),
    );
  }
}

class _CardData {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;

  _CardData(
      this.text, {
      required this.descriptionText,
      this.icon = Icons.ac_unit_outlined,
      this.imageUrl,
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      _CardData(
        'Екатеринбург Арена ',
        descriptionText:
        'Вмещает 35000 зрителей.',
        icon: Icons.stadium,
        imageUrl: 'https://avatars.mds.yandex.net/i?id=2a777b2401f86874b16cf29776daf1c6_l-8350343-images-thumbs&n=13',
      ),
      _CardData(
        'Открытие банк арена ',
        descriptionText: 'Вмещает 45000 зриетелей.',
        icon: Icons.sports_football,
        imageUrl: 'https://photobooth.cdn.sports.ru/preset/wysiwyg/c/82/bad48e68e443aac15b36e62a86b8b.jpeg?q=90&w=730',
      ),
      _CardData(
        'Стадион Нижний Новгород ',
        descriptionText: 'Вмещает 44000 зрителей.',
        icon: Icons.sports,
        imageUrl: 'https://photobooth.cdn.sports.ru/preset/wysiwyg/1/d8/28844b4be4defb50c5cc09edafba6.jpeg?q=90&w=730',
      )
    ];
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((e) => _Card.fromData(e)).toList(),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;

  const _Card(
      this.text, {
      this.icon = Icons.ac_unit_outlined,
      required this.descriptionText,
      this.imageUrl,
  });

  factory _Card.fromData(_CardData data) => _Card(
    data.text,
    descriptionText: data.descriptionText,
    icon: data.icon,
    imageUrl: data.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(.5),
            spreadRadius: 4,
            offset: const Offset(0, 5),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                imageUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Placeholder(),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    descriptionText,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}