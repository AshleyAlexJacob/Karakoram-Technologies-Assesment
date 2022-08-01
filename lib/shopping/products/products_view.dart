import 'package:flutter/material.dart';
import 'package:k2x_assesment/core/models/product_model.dart';
import 'package:k2x_assesment/shopping/shopping_controller.dart';
import 'package:k2x_assesment/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingController>(builder: (context, controller, child) {
      return Column(
        children: [
          DropdownButton<String>(
            focusColor: Colors.teal.shade200,
            dropdownColor: Colors.teal.shade100,
            iconEnabledColor: Colors.teal,
            style: const TextStyle(
                color: Colors.teal, fontSize: 18, fontWeight: FontWeight.w700),
            isExpanded: true,
            underline: Container(),
            elevation: 0,
            value: controller.selectedCategory,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: controller.items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              controller.updateSelection(newValue);
            },
          ),
          // ProductTile(product: kProducts[0]),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: kProducts.length,
                  itemBuilder: (context, index) {
                    return ProductTile(product: kProducts[index]);
                  })),
        ],
      );
    });
  }
}
