import 'package:ecommerce_shop_api/controller/getx_controller.dart';
import 'package:ecommerce_shop_api/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'card_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.redAccent,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  'Beauty Shop',
                        style:
                        TextStyle(fontFamily: 'avenir',fontSize: 32, fontWeight: FontWeight.w300),
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view)),
              ],
            ),
          ),
          Expanded(
              child: Obx(
            () => productController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                   itemCount: productController.productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4),
                    itemBuilder: (context, index) {
                     final product=productController.productList.value[index];
                      return CardPage(product: product);
                    },
                  ),

            //     :StaggeredGrid.count(
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 4,
            //   mainAxisSpacing: 4,
            //   children:productController.productList.map((e) =>
            //       Container(
            //         height: 100,
            //         width: 100,
            //         color: Colors.red,
            //       )).toList()
            // )
          ))
        ],
      ),
    );
  }
}
