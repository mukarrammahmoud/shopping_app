import 'package:flutter/material.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';
import 'package:shoping_pp/view/widgets/custom_button.dart';

class ShowDetailsNews extends StatelessWidget {
  const ShowDetailsNews({
    super.key,
    required this.prodects,
  });
  final Prodects prodects;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details ${prodects.category}"),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                prodects.category!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                ),
              ),
              Image.network(
                prodects.image!,
                height: 300,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Text(
                prodects.title!,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
              Text(
                prodects.description!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              CustomButton(title: "Add To Cart", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
