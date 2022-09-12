import 'package:ecommerce_shop_api/model/product_model.dart';
import 'package:ecommerce_shop_api/view/details_prodeuct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CardPage extends StatelessWidget {
  final ProductModel product;
  const CardPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>Get.to(DetailsPage(product:product)) ,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Container(
                    //   height: 98,
                    //   width: 98,
                    //   clipBehavior: Clip.antiAlias,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(4),
                    //   ),
                    //   child: Image.network(
                    //     product.imageLink.toString(),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Image.network(
                      product.imageLink.toString(),
                      // fit: BoxFit.cover,
                    ),
                    Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: //product.isFavorite.value
                                const Icon(Icons.favorite_rounded),
                            //: const Icon(Icons.favorite_border),
                            onPressed: () {
                              //product.isFavorite.toggle();
                            },
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text(
                                product.name.toString(),
                                maxLines: 1,
                                style: const TextStyle(
                                    fontFamily: 'avenir',
                                    fontWeight: FontWeight.w300),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              if (product.rating != null)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        product.rating.toString(),
                                        style:
                                            const TextStyle(color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 4),
                              Text('\$${product.price}',
                                  style: const TextStyle(
                                      fontSize: 15, fontFamily: 'avenir')),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
