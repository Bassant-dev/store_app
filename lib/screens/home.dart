
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../models/product_model.dart';
import '../services/get_all_product_services.dart';
import '../widget/custom_card.dart';

List<String> images = [
  'assets/img/slid1.jpeg',
  'assets/img/slid2.jpeg',
  'assets/img/slid3.jpeg',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  enlargeCenterPage: true,
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200, // Use a lighter grey color
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child:  SingleChildScrollView( // Wrap GridView.builder with SingleChildScrollView
                child: BlocBuilder<StoreCubit, storestates>(
                  builder: (context, state){
                    return  Container(
                      child: GridView.builder(

                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                        itemCount: BlocProvider.of<StoreCubit>(context).products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 50,
                        ),
                        itemBuilder: (context, index) {
                          return CustomCard(product: BlocProvider.of<StoreCubit>(context).products[index],);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
