import 'package:flutter/material.dart';
import 'package:shoping_pp/data/model/prodects_model.dart';

class CardSearchNews extends StatelessWidget {
  const CardSearchNews({
    super.key,
    required this.prodect,
    required this.onTapNews,
  });
  final Prodects prodect;
  final Function() onTapNews;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTapNews,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: prodect.title == null
                        ? const Text(
                            " Unknow",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        : Text(
                            prodect.title!,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                  ),
                  Expanded(
                      child: Text(
                    "  ${prodect.title!}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: prodect.title!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                    ]),
                  ),
                );
              }),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: prodect.image == null
                      ? Container(
                          height: 350,
                        )
                      : Image.network(prodect.image!,
                          loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : Container(
                                  height: 250,
                                );
                        }),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
