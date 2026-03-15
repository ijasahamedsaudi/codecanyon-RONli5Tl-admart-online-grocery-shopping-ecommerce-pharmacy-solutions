import 'package:admart/base/api/endpoint/api_endpoint.dart';
import 'package:admart/base/api/method/request_process.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/api/services/basic_services.dart';
import '../model/category_list_model.dart';
import '../model/sub_category_list_model.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    getCategoriesList();
    getSubCategoriesList();

    ever(categoryScrollIndex, (idx) {
      scrollToSelectedItem(idx);
    });

    ever<Category?>(selelctedCategory, (category) {
      if (category != null) {
        _filterSubCategoryForCategory(category);
      }
    });

    super.onInit();
  }

  final ScrollController categoryScrollController = ScrollController();
  var categoryScrollIndex = 0.obs;

  void scrollToSelectedItem(int index) {
    final targetIndex = index;

    const double itemHeight = 80.0;

    categoryScrollController.animateTo(
      targetIndex * itemHeight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _filterSubCategoryForCategory(Category category) {
    if (subCategories.isNotEmpty) {
      filteredSubCategories.clear();
      filteredSubCategories.addAll(
        subCategories.where((e) => e.categorySection.uuid == category.uuid),
      );
      if (filteredSubCategories.isNotEmpty) {
        selelctedSubCategory.value = filteredSubCategories.first;
      } else {
        selelctedSubCategory.value = null;
      }
    }
  }

  var imagePath =
      "${BasicServices.basePath}${BasicServices.productPathLocation}/".obs;

  Rxn<Category> selelctedCategory = Rxn();
  RxList<Category> categories = <Category>[].obs;

  var _isCategoriesLoading = false.obs;
  bool get isCategoriesLoading => _isCategoriesLoading.value;
  late CategoryListModel _categoryModel;
  CategoryListModel get categoryModel => _categoryModel;

  Future<CategoryListModel?> getCategoriesList() async {
    return RequestProcess().request(
      fromJson: CategoryListModel.fromJson,
      apiEndpoint: ApiEndpoint.categoryList,
      isLoading: _isCategoriesLoading,
      onSuccess: (value) {
        _categoryModel = value!;
        _setCategoryData();
      },
    );
  }

  _setCategoryData() {
    categories.clear();
    categories.addAll(_categoryModel.data.category);
    selelctedCategory.value = categories.last;
  }

  Rxn<SubCategory> selelctedSubCategory = Rxn();
  RxList<SubCategory> subCategories = <SubCategory>[].obs;
  RxList<SubCategory> filteredSubCategories = <SubCategory>[].obs;

  var _isSubCategoriesLoading = false.obs;
  bool get isSubCategoriesLoading => _isCategoriesLoading.value;
  late SubCategoryListModel _subCategoryListModel;
  SubCategoryListModel get subCategoryListModel => _subCategoryListModel;

  Future<SubCategoryListModel?> getSubCategoriesList() async {
    return RequestProcess().request(
      fromJson: SubCategoryListModel.fromJson,
      apiEndpoint: ApiEndpoint.subCategoryList,
      isLoading: _isSubCategoriesLoading,
      onSuccess: (value) {
        _subCategoryListModel = value!;
        _setSubCategoryData();
      },
    );
  }

  _setSubCategoryData() {
    subCategories.clear();
    subCategories.addAll(_subCategoryListModel.data.subCategory);
    filteredSubCategories.clear();
    filteredSubCategories.addAll(
      subCategories.where(
        (e) => e.categorySection.uuid == selelctedCategory.value?.uuid,
      ),
    );
    if (filteredSubCategories.isNotEmpty) {
      selelctedSubCategory.value = filteredSubCategories.first;
    } else {
      selelctedSubCategory.value = null;
      debugPrint(
        "⚠️ No subcategory found for category ${selelctedCategory.value?.uuid}",
      );
    }
  }
}
