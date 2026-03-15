part of 'product_list_screen.dart';

class ProductListMobileScreen extends GetView<ProductListController> {
  const ProductListMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller.categoryName.value,
        action: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSize * .5,
            ),
            decoration: BoxDecoration(
              color: CustomColor.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: CustomColor.blackColor,
              ),
              onPressed: () {
                Get.find<NavigationController>().selectedIndex.value = 2;
                Routes.navigation.toNamed;
              },
            ),
          ),
        ],
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: Obx(
          () => Column(
            children: [
            

              ClipRect(
                child: AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: controller.showSearchBox.value
                      ? SearchWidget(
                          textController: controller.searchController,
                          onChanged: (value) {
                            final term = value.trim();

                            debugPrint(
                              ',,,,,,,,,,,,,,,,,,,, $term ,,,,,,,,,,,,,,,,,,,,',
                            );
                            if (value.isNotEmpty) {
                              controller.getAllProductsProcess(
                                termValue: value,
                              );
                            } else {
                              debugPrint(',,,,,,,,,,,,,$term,,,,,,,,,,,,,,');
                              debugPrint(".......... Loading ...........");
                              controller.page.value = 1;
                              controller.productsList.clear();
                              controller.isLastPage.value = false;
                              controller.getAllProductsProcess();
                            }
                          },
                        )
                      : SizedBox.shrink(),
                ),
              ),
              Expanded(
                child: Obx(
                  () =>
                      controller.page.value == 1 && controller.isProductLoading
                      ? Loader()
                      : controller.productsList.isEmpty
                      ? NoDataWidget()
                      : ProductGridList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
