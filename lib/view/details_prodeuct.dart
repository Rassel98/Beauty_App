import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel product;
  //static const String routeName = '/details';
  const DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white54,
      appBar: AppBar(
        //elevation: 0,
        //backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: ()=>Get.back(),
            icon:const Icon(Icons.arrow_back_ios,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.maxFinite,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink.toString(),
                    fit: BoxFit.cover,
                  ),
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
              ],
            ),
            // Image.network(
            //   product.imageLink.toString(),
            // fit: BoxFit.cover,
            // ),

            const SizedBox(height: 8),
            Text(
              product.name.toString(),
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Text('\$${product.price}',
                style: const TextStyle(fontSize: 24, fontFamily: 'avenir')),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  Text(product.description.toString(),style: const TextStyle(fontSize: 14, fontFamily: 'avenir'))
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
