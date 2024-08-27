import 'package:flutter/material.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';
import 'package:shoping_pp/view/widgets/custom_button.dart';

class ListOfProdects extends StatelessWidget {
  const ListOfProdects({
    super.key,
    required this.prodects,
    required this.onTap,
  });
  final void Function()? onTap;
  final Prodects prodects;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.network(
              prodects.image!,
              height: 200,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Wrap(alignment: WrapAlignment.start, children: [
              Text(
                prodects.title.toString(),
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(title: "Puy", onPressed: () {}),
                Text(
                  " Price : ${prodects.price.toString()}",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
