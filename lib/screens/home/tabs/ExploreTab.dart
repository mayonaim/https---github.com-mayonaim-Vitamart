import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vitamart/controllers/home/HomeController.dart';
import 'package:vitamart/models/ProductModel.dart';
import 'package:vitamart/shared/constants/Coolors.dart';
import 'package:vitamart/shared/constants/Shadows.dart';
import 'package:vitamart/shared/helpers/extensions/NumberExtension.dart';
import 'package:vitamart/shared/widgets/AppBar.dart';
import 'package:vitamart/shared/widgets/RoundedTextButton.dart';

class ExploreTab extends GetView<HomeController> {
  ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        VAppBar(title: 'Beranda', includeBackButton: false),
        SizedBox(height: 10),
        _buildCategories(Theme.of(context)),
        SizedBox(height: 20),
        _buildProductsList(Theme.of(context)),
      ],
    );
  }

  Widget _buildCategories(theme) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (_, i) {
              final category = controller.categories[i];
              return Obx(() => _buildCategory(category, theme));
            },
          ),
        ),
      );
    });
  }

  Widget _buildCategory(String category, theme) {
    var isSelected = controller.selectedCategory.value == category;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: RoundedTextButton(
        onPressed: () {
          controller.changeCategory(category);
        },
        backgroundColor: isSelected ? Coolors.primary : Colors.transparent,
        borderColor: isSelected ? Colors.transparent : Coolors.primary,
        text: category,
        style: theme.textTheme.labelSmall!.copyWith(
          fontWeight: isSelected ? FontWeight.w400 : FontWeight.w500,
          color: isSelected ? Coolors.background : Coolors.primary,
        ),
      ),
    );
  }

  Widget _buildProductsList(theme) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
            ),
            itemCount: controller.filteredProducts.length,
            itemBuilder: (_, i) {
              final product = controller.filteredProducts[i];
              return _buildProduct(product, theme);
            },
          ),
        ));
  }

  Widget _buildProduct(ProductModel product, theme) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Coolors.white,
        boxShadow: [Shadows.elevation1],
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed('/product/${product.id}');
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Coolors.grey.withOpacity(0.86),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.name,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Coolors.primary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.price.toIDR(),
                      style: theme.textTheme.headlineSmall!
                          .copyWith(color: Coolors.primary),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
