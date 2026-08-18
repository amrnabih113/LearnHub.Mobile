import 'package:flutter/material.dart';
import 'package:learnhub/features/common/data/models/course_model.dart';
import 'package:learnhub/features/landing/data/datasources/remote/landing_remote_data_source.dart';
import 'package:learnhub/features/landing/data/models/category_model.dart';
import 'package:learnhub/features/landing/data/models/learning_path_model.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';

/// Mock remote data source delivering rich mock datasets for testing and development.
class MockLandingRemoteDataSource implements LandingRemoteDataSource {
  const MockLandingRemoteDataSource();

  @override
  Future<List<CourseModel>> getCourses() async {
    // Simulated network delay
    await Future.delayed(const Duration(milliseconds: 150));
    return _mockCourses;
  }

  @override
  Future<List<CourseModel>> getFeaturedCourses() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockCourses.where((c) => c.isFeatured).toList();
  }

  @override
  Future<List<CourseModel>> getTrendingCourses() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockCourses.where((c) => c.isTrending).toList();
  }

  @override
  Future<List<LearningPathModel>> getLearningPaths() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockPaths;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockCategories;
  }

  // ===========================================================================
  // MOCK DATASETS
  // ===========================================================================

  static final List<CategoryModel> _mockCategories = const [
    CategoryModel(
      id: 'cat_dev',
      name: 'Development',
      iconName: 'code',
      courseCount: 42,
    ),
    CategoryModel(
      id: 'cat_des',
      name: 'Design',
      iconName: 'palette',
      courseCount: 28,
    ),
    CategoryModel(
      id: 'cat_biz',
      name: 'Business',
      iconName: 'business_center',
      courseCount: 19,
    ),
    CategoryModel(
      id: 'cat_mkt',
      name: 'Marketing',
      iconName: 'campaign',
      courseCount: 15,
    ),
    CategoryModel(
      id: 'cat_ds',
      name: 'Data Science',
      iconName: 'analytics',
      courseCount: 24,
    ),
    CategoryModel(
      id: 'cat_photo',
      name: 'Photography',
      iconName: 'camera_alt',
      courseCount: 11,
    ),
    CategoryModel(
      id: 'cat_pd',
      name: 'Personal Development',
      iconName: 'self_improvement',
      courseCount: 18,
    ),
  ];

  static final List<LearningPathModel> _mockPaths = [
    LearningPathModel(
      title: 'Become a Full-Stack Developer',
      description:
          'Go from the fundamentals to building and deploying complete web applications.',
      courses: '8 courses',
      duration: '120+ hours',
      colorType: PathColor.blue,
      iconCodePoint: Icons.code_rounded.codePoint,
    ),
    LearningPathModel(
      title: 'Master UI/UX Design',
      description:
          'Build strong design foundations and create polished digital experiences.',
      courses: '6 courses',
      duration: '78 hours',
      colorType: PathColor.yellow,
      iconCodePoint: Icons.design_services_rounded.codePoint,
    ),
    LearningPathModel(
      title: 'Data Science Career Path',
      description:
          'Learn Python, data analysis, visualization and machine learning.',
      courses: '7 courses',
      duration: '96 hours',
      colorType: PathColor.purple,
      iconCodePoint: Icons.insights_rounded.codePoint,
    ),
  ];

  static final List<CourseModel> _mockCourses = const [
    CourseModel(
      id: 'course_1',
      category: 'Development',
      title: 'Full-Stack Web Development with React & Node.js',
      instructor: 'Ahmed Hassan',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
      rating: 4.8,
      reviews: '3,241',
      duration: '42h',
      level: 'Beginner',
      price: 49,
      discountPrice: 29,
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=1200&auto=format&fit=crop',
      isFeatured: true,
      isTrending: true,
    ),
    CourseModel(
      id: 'course_2',
      category: 'Design',
      title: 'UI/UX Design Masterclass',
      instructor: 'Sarah Ahmed',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400&auto=format&fit=crop',
      rating: 4.9,
      reviews: '1,842',
      duration: '28h',
      level: 'Intermediate',
      price: 59,
      discountPrice: 39,
      imageUrl:
          'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=1200&auto=format&fit=crop',
      isFeatured: true,
      isTrending: true,
    ),
    CourseModel(
      id: 'course_3',
      category: 'Business',
      title: 'Business Strategy & Entrepreneurship',
      instructor: 'Omar Khaled',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
      rating: 4.7,
      reviews: '1,204',
      duration: '19h',
      level: 'Beginner',
      price: 39,
      imageUrl:
          'https://images.unsplash.com/photo-1556761175-b413da4baf72?q=80&w=1200&auto=format&fit=crop',
      isTrending: true,
    ),
    CourseModel(
      id: 'course_4',
      category: 'Marketing',
      title: 'Digital Marketing from Zero to Expert',
      instructor: 'Maya Ibrahim',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=400&auto=format&fit=crop',
      rating: 4.6,
      reviews: '982',
      duration: '24h',
      level: 'Intermediate',
      price: 44,
      discountPrice: 24,
      imageUrl:
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_5',
      category: 'Data Science',
      title: 'Python for Data Science & Machine Learning',
      instructor: 'Youssef Ali',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=400&auto=format&fit=crop',
      rating: 4.9,
      reviews: '4,120',
      duration: '36h',
      level: 'Intermediate',
      price: 69,
      discountPrice: 49,
      imageUrl:
          'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=1200&auto=format&fit=crop',
      isFeatured: true,
      isTrending: true,
    ),
    CourseModel(
      id: 'course_6',
      category: 'Development',
      title: 'Flutter & Dart: The Complete Cross-Platform Guide',
      instructor: 'Mohamed Samir',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=400&auto=format&fit=crop',
      rating: 4.8,
      reviews: '2,432',
      duration: '31h',
      level: 'Intermediate',
      price: 55,
      imageUrl:
          'https://images.unsplash.com/photo-1551650975-87deedd944c3?q=80&w=1200&auto=format&fit=crop',
      isTrending: true,
    ),
    CourseModel(
      id: 'course_7',
      category: 'Design',
      title: 'Motion Design & Visual FX with After Effects',
      instructor: 'Lina Hassan',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=400&auto=format&fit=crop',
      rating: 4.8,
      reviews: '1,124',
      duration: '22h',
      level: 'Advanced',
      price: 49,
      discountPrice: 34,
      imageUrl:
          'https://images.unsplash.com/photo-1558655146-d09347e92766?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_8',
      category: 'Development',
      title: 'Backend Engineering with Node.js & Clean Architecture',
      instructor: 'Karim Mostafa',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?q=80&w=400&auto=format&fit=crop',
      rating: 4.7,
      reviews: '1,531',
      duration: '27h',
      level: 'Intermediate',
      price: 54,
      imageUrl:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_9',
      category: 'Development',
      title: 'Git & GitHub Fundamentals for Beginners',
      instructor: 'Ahmed Hassan',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
      rating: 4.9,
      reviews: '5,820',
      duration: '6h',
      level: 'Beginner',
      price: 0,
      imageUrl:
          'https://images.unsplash.com/photo-1618401471353-b98afee0b2eb?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_10',
      category: 'Design',
      title: 'Figma 101: Practical Design Systems',
      instructor: 'Sarah Ahmed',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=400&auto=format&fit=crop',
      rating: 4.8,
      reviews: '2,950',
      duration: '8h',
      level: 'Beginner',
      price: 0,
      imageUrl:
          'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_11',
      category: 'Data Science',
      title: 'Deep Learning & Neural Networks with PyTorch',
      instructor: 'Sara Ali',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=400&auto=format&fit=crop',
      rating: 4.9,
      reviews: '1,720',
      duration: '45h',
      level: 'Advanced',
      price: 79,
      discountPrice: 59,
      imageUrl:
          'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=1200&auto=format&fit=crop',
      isFeatured: true,
    ),
    CourseModel(
      id: 'course_12',
      category: 'Photography',
      title: 'Complete DSLR Photography & Lightroom Mastery',
      instructor: 'Tarek Nabil',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=400&auto=format&fit=crop',
      rating: 4.7,
      reviews: '890',
      duration: '18h',
      level: 'Beginner',
      price: 35,
      imageUrl:
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_13',
      category: 'Personal Development',
      title: 'Productivity Habits, Focus & Deep Work',
      instructor: 'Hala Mansour',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=400&auto=format&fit=crop',
      rating: 4.8,
      reviews: '3,410',
      duration: '12h',
      level: 'Beginner',
      price: 29,
      discountPrice: 19,
      imageUrl:
          'https://images.unsplash.com/photo-1499750310107-5fef28a66643?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_14',
      category: 'Development',
      title: 'ASP.NET Core Clean Architecture & Microservices',
      instructor: 'Ahmed Hassan',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
      rating: 4.9,
      reviews: '2,401',
      duration: '28h',
      level: 'Advanced',
      price: 79,
      discountPrice: 59,
      imageUrl:
          'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop',
      isFeatured: true,
    ),
    CourseModel(
      id: 'course_15',
      category: 'Marketing',
      title: 'SEO & Growth Hacking Strategies for 2026',
      instructor: 'Maya Ibrahim',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=400&auto=format&fit=crop',
      rating: 4.5,
      reviews: '670',
      duration: '15h',
      level: 'Advanced',
      price: 45,
      imageUrl:
          'https://images.unsplash.com/photo-1432888498266-38ffec3eaf0a?q=80&w=1200&auto=format&fit=crop',
    ),
    CourseModel(
      id: 'course_16',
      category: 'Business',
      title: 'Financial Modeling & Valuation in Excel',
      instructor: 'Omar Khaled',
      instructorImageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
      rating: 4.4,
      reviews: '530',
      duration: '21h',
      level: 'Advanced',
      price: 65,
      discountPrice: 45,
      imageUrl:
          'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=1200&auto=format&fit=crop',
    ),
  ];
}
