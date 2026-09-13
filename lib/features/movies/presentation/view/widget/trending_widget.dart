// features/movies/presentation/view/widget/trending_widget.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/movie_player_view.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
  clipBehavior: Clip.none,
  children: [
    // 1. صورة الفيلم
    ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        'assets/images/Rectangle 48.png',
        width: double.infinity,
        height: 279,
        fit: BoxFit.cover,
      ),
    ),

    // 2. زر Watch Trailer فوق الصورة
    Positioned(
      right: 15,
      bottom: 70,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=> MoviePlayerView(
  movieUrl:
      'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
)));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Text(
                'Watch Now',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    ),

    // 3. الـ Movie Info اللي نازل على الصورة
    Positioned(
      left: 10,
      right: 10,
      bottom: -55,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xff242224),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TRENDING',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'EVIL DEAD RISE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'A. ENGLISH',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    'HORROR',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Book button
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    'Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '2D.3D.4DX',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ],
);}}