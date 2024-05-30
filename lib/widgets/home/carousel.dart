import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        animateToClosest: true,
        autoPlayCurve: Curves.easeIn,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXFqXO2nFAxGgTn8Lzg0mNpZxXD8FhMn6wbA&s',
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://cdn.dribbble.com/users/7541902/screenshots/17912507/media/3786ac1fc4fffcc009d1d8fb47c556b6.jpg?resize=400x0',
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://img.freepik.com/premium-psd/medical-social-media-facebook-cover-web-banner-template_220159-141.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
