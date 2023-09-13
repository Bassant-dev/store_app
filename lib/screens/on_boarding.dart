
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:store_app/screens/start.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'start';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingItem> items = [
    OnboardingItem(
      image: 'assets/img/on1.png',
      title: 'Welcome to Our Store',
      description: 'Explore a wide range of products and more.',
    ),
    OnboardingItem(
      image: 'assets/img/on2.png',
      title: 'Shop with Confidence',
      description: 'We provide secure and convenient shopping.',
    ),
    OnboardingItem(
      image: 'assets/img/on3.png',
      title: 'Get Started Now',
      description: 'Create an account and start shopping today!',
    ),
  ];

  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(item: items[index]);
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentPage < items.length - 1)
                    TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color:  HexColor('#FF850409'),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  if (currentPage == items.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the next screen (e.g., the home screen)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => start()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#FF850409'),
                        textStyle: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Text('Get Started',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  OnboardingPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          item.image,
          height: 500.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height:25.0),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
