
import 'package:flutter/material.dart';

enum CoursePriceFilter { all, free, paid }

class ExploreCourse {
  const ExploreCourse({
    required this.category,
    required this.title,
    required this.instructor,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
    required this.price,
    required this.imageUrl,
    this.discountPrice,
  });

  final String category;
  final String title;
  final String instructor;
  final double rating;
  final String reviews;
  final String duration;
  final String level;
  final double price;
  final double? discountPrice;
  final String imageUrl;
}

enum PathColor { blue, yellow, purple }

class LearningPath {
  const LearningPath({
    required this.title,
    required this.description,
    required this.courses,
    required this.duration,
    required this.colorType,
    required this.icon,
  });

  final String title;
  final String description;
  final String courses;
  final String duration;
  final PathColor colorType;
  final IconData icon;
}

class ExploreMokeupData {
  ExploreMokeupData._();
 static  final  List<String> categories = const [
    'Development',
    'Design',
    'Business',
    'Marketing',
    'Data Science',
    'Photography',
    'Personal Development',
  ];

  
  static final List<ExploreCourse> courses = const [
    ExploreCourse(
      category: 'Development',
      title: 'Full-Stack Web Development with React & Node.js',
      instructor: 'Ahmed Hassan',
      rating: 4.8,
      reviews: '3,241',
      duration: '42h',
      level: 'Beginner',
      price: 49,
      discountPrice: 29,
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=1200&auto=format&fit=crop',
    ),
    ExploreCourse(
      category: 'Design',
      title: 'UI/UX Design Masterclass',
      instructor: 'Sarah Ahmed',
      rating: 4.9,
      reviews: '1,842',
      duration: '28h',
      level: 'Intermediate',
      price: 59,
      discountPrice: 39,
      imageUrl:
          'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=1200&auto=format&fit=crop',
    ),
    ExploreCourse(
      category: 'Business',
      title: 'Business Strategy & Entrepreneurship',
      instructor: 'Omar Khaled',
      rating: 4.7,
      reviews: '1,204',
      duration: '19h',
      level: 'Beginner',
      price: 39,
      imageUrl:
          'https://images.unsplash.com/photo-1556761175-b413da4baf72?q=80&w=1200&auto=format&fit=crop',
    ),
    ExploreCourse(
      category: 'Marketing',
      title: 'Digital Marketing from Zero to Expert',
      instructor: 'Maya Ibrahim',
      rating: 4.6,
      reviews: '982',
      duration: '24h',
      level: 'Intermediate',
      price: 44,
      discountPrice: 24,
      imageUrl:
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=1200&auto=format&fit=crop',
    ),
    ExploreCourse(
      category: 'Data Science',
      title: 'Python for Data Science',
      instructor: 'Youssef Ali',
      rating: 4.9,
      reviews: '4,120',
      duration: '36h',
      level: 'Intermediate',
      price: 69,
      discountPrice: 49,
      imageUrl:
          'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=1200&auto=format&fit=crop',
    ),
    ExploreCourse(
      category: 'Development',
      title: 'Flutter App Development',
      instructor: 'Mohamed Samir',
      rating: 4.8,
      reviews: '2,432',
      duration: '31h',
      level: 'Intermediate',
      price: 55,
      imageUrl:
          'https://images.unsplash.com/photo-1551650975-87deedd944c3?q=80&w=1200&auto=format&fit=crop',
    ),
    ExploreCourse(
      category: 'Design',
      title: 'Motion Design with After Effects',
      instructor: 'Lina Hassan',
      rating: 4.8,
      reviews: '1,124',
      duration: '22h',
      level: 'Advanced',
      price: 49,
      discountPrice: 34,
      imageUrl:
          'https://images.unsplash.com/photo-1558655146-d09347e92766?q=80&w=1200&auto=format&fit=crop',
    ),
    ExploreCourse(
      category: 'Development',
      title: 'Backend Engineering with Node.js',
      instructor: 'Karim Mostafa',
      rating: 4.7,
      reviews: '1,531',
      duration: '27h',
      level: 'Intermediate',
      price: 54,
      imageUrl:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=1200&auto=format&fit=crop',
    ),
  ];
  static 
  final List<LearningPath> paths = const [
    LearningPath(
      title: 'Become a Full-Stack Developer',
      description:
          'Go from the fundamentals to building and deploying complete web applications.',
      courses: '8 courses',
      duration: '120+ hours',
      colorType: PathColor.blue,
      icon: Icons.code_rounded,
    ),
    LearningPath(
      title: 'Master UI/UX Design',
      description:
          'Build strong design foundations and create polished digital experiences.',
      courses: '6 courses',
      duration: '78 hours',
      colorType: PathColor.yellow,
      icon: Icons.design_services_rounded,
    ),
    LearningPath(
      title: 'Data Science Career Path',
      description:
          'Learn Python, data analysis, visualization and machine learning.',
      courses: '7 courses',
      duration: '96 hours',
      colorType: PathColor.purple,
      icon: Icons.insights_rounded,
    ),
  ];

}