import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproj/domain/Models/card.dart';
import 'package:testproj/presentation/details_page/details_page.dart';

part 'card.dart';

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
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      CardData(
        'Екатеринбург Арена ',
        descriptionText: 'Вмещает 35000 зрителей.',
        information:
            'Уникальный стадион тем, что боковые трибуны выходят '
            'за пределы крыши арены. '
            'Стадион является домашним для команды «Урал Екатеринбург».',
        icon: Icons.stadium,
        imageUrl:
            'https://avatars.mds.yandex.net/i?id=2a777b2401f86874b16cf29776daf1c6_l-8350343-images-thumbs&n=13',
      ),
      CardData(
        'Открытие банк арена ',
        descriptionText: 'Вмещает 45000 зриетелей.',
        information: 'Является домашним стадионом «команды «Спартак Москва».',
        icon: Icons.sports_football,
        imageUrl:
            'https://photobooth.cdn.sports.ru/preset/wysiwyg/c/82/bad48e68e443aac15b36e62a86b8b.jpeg?q=90&w=730',
      ),
      CardData(
        'Нижний Новгород ',
        descriptionText: 'Вмещает 44000 зрителей.',
        information:
            'На арене свои домашние матчи проводит команда '
            '«Нижний Новгород», уникальней этот стадион тем, '
            'что находится на слиянии двух больших рек.',
        icon: Icons.sports,
        imageUrl:
            'https://photobooth.cdn.sports.ru/preset/wysiwyg/1/d8/28844b4be4defb50c5cc09edafba6.jpeg?q=90&w=730',
      ),
    ];
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((data) {
            return _Card.fromData(
              data,
              onLike: (String title, bool isLiked) =>
                  _showSnackBar(context, title, isLiked),
              onTap: () => _navToDetails(context, data),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Стадион $title ${isLiked ? 'добавлен в Избранное!' : 'убран из Избранное.'}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          backgroundColor: Colors.lightGreen,
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }
}
