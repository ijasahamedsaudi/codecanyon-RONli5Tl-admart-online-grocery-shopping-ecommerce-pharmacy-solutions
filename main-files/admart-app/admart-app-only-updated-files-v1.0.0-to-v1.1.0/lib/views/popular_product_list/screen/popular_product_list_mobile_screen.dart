part of 'popular_product_list_screen.dart';

class PopularProductListMobileScreen extends GetView<DashboardController> {
  const PopularProductListMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.popularProducts,
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
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: controller.showSearchBox.value
                      ? SearchWidget(
                          textController: controller.searchController,
                          onChanged: (value) {
                            controller.page.value = 1;
                            if (value.isNotEmpty) {
                              controller.getPopularProducts(termValue: value);
                            } else {
                              controller.getPopularProducts();
                            }
                          },
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              Expanded(
                child: Obx(
                  () =>
                      controller.page.value == 1 && controller.isPopularLoading
                      ? Loader()
                      : controller.popularProductsList.isEmpty
                      ? NoDataWidget()
                      : PopularProductsList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
