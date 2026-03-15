part of '../screen/details_screen.dart';

class ProductDetails extends GetView<DetailsController> {
  ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasOffer = double.parse(
                controller.selectedProduct.value!.offerPrice ?? "0.0") <
            double.parse(controller.selectedProduct.value!.price) &&
        double.parse(controller.selectedProduct.value!.offerPrice ?? "0.0") !=
            0.0;
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Image.network(
          "${controller.imagePath}${controller.selectedProduct.value!.image}",
          width: double.infinity,
          height: 200.h,
          fit: BoxFit.contain,
        ),
        Sizes.height.v15,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalSize * 0.75,
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              TextWidget(
                controller.selectedProduct.value!.data.name,
                typographyStyle: TypographyStyle.titleLarge,
                fontWeight: FontWeight.w600,
              ),
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  hasOffer
                      ? Row(
                          children: [
                            TextWidget(
                              "${controller.selectedProduct.value!.orderQuantity} ${controller.selectedProduct.value!.unit}",
                              typographyStyle: TypographyStyle.titleMedium,
                              fontWeight: FontWeight.w500,
                            ),
                            Sizes.width.v10,
                            FittedBox(
                                child: TextWidget(
                              "${BasicServices.baseCurrency.value!.symbol}${controller.selectedProduct.value!.offerPrice!}",
                              color: CustomColor.primary,
                              fontWeight: FontWeight.w700,
                            )),
                            Sizes.width.v5,
                            FittedBox(
                                child: TextWidget(
                              "${BasicServices.baseCurrency.value!.symbol}${controller.selectedProduct.value!.price}",
                              style: CustomStyle.labelSmall.copyWith(
                                fontWeight: FontWeight.w400,
                                color: CustomColor.disableColor,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.0,
                              ),
                            )),
                          ],
                        )
                      : FittedBox(
                          child: TextWidget(
                          "${BasicServices.baseCurrency.value!.symbol}${controller.selectedProduct.value!.price}",
                          color: CustomColor.primary,
                          fontWeight: FontWeight.w700,
                        )),
                  Obx(() => controller.hasAdded
                      ? QuantityWidget(
                          productId:
                              controller.selectedProduct.value!.id.toString(),
                        )
                      : Quantity())
                  // Quantity()
                ],
              ),
              _productDetails()
            ],
          ),
        ),
      ],
    );
  }

  _productDetails() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.verticalSize * .5,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Sizes.height.v10,
          TextWidget(
            controller.selectedProduct.value!.data.description,
            typographyStyle: TypographyStyle.titleSmall,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
