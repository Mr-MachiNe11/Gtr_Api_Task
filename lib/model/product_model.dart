class ProductModel {
  int success;
  bool error;
  List<Product> productList;
  PageInfo pageInfo;

  ProductModel({
    required this.success,
    required this.error,
    required this.productList,
    required this.pageInfo,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      success: json['Success'],
      error: json['error'],
      productList: List<Product>.from(json['ProductList'].map((x) => Product.fromJson(x))),
      pageInfo: PageInfo.fromJson(json['PageInfo']),
    );
  }
}

class Product {
  int id;
  String? type;
  String? parentCode;
  String name;
  String code;
  double price;
  double costPrice;
  String unitName;
  String categoryName;
  String brandName;
  String modelName;
  String variantName;
  String sizeName;
  String colorName;
  double oldPrice;
  String? imagePath;
  double commissionAmount;
  double commissionPer;
  double pctn;
  String productBarcode;
  String description;
  List<dynamic> childList;
  List<dynamic> batchSerial;
  List<dynamic> warehouseList;
  double currentStock;
  String createDate;
  String updateDate;

  Product({
    required this.id,
    this.type,
    this.parentCode,
    required this.name,
    required this.code,
    required this.price,
    required this.costPrice,
    required this.unitName,
    required this.categoryName,
    required this.brandName,
    required this.modelName,
    required this.variantName,
    required this.sizeName,
    required this.colorName,
    required this.oldPrice,
    this.imagePath,
    required this.commissionAmount,
    required this.commissionPer,
    required this.pctn,
    required this.productBarcode,
    required this.description,
    required this.childList,
    required this.batchSerial,
    required this.warehouseList,
    required this.currentStock,
    required this.createDate,
    required this.updateDate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Id'],
      type: json['Type'],
      parentCode: json['ParentCode'],
      name: json['Name'],
      code: json['Code'],
      price: json['Price'],
      costPrice: json['CostPrice'],
      unitName: json['UnitName'],
      categoryName: json['CategoryName'],
      brandName: json['BrandName'],
      modelName: json['ModelName'],
      variantName: json['VariantName'],
      sizeName: json['SizeName'],
      colorName: json['ColorName'],
      oldPrice: json['OldPrice'],
      imagePath: json['ImagePath'],
      commissionAmount: json['CommissionAmount'],
      commissionPer: json['CommissionPer'],
      pctn: json['PCTN'],
      productBarcode: json['ProductBarcode'],
      description: json['Description'],
      childList: json['ChildList'],
      batchSerial: json['BatchSerial'],
      warehouseList: json['WarehouseList'],
      currentStock: json['CurrentStock'],
      createDate: json['CreateDate'],
      updateDate: json['UpdateDate'],
    );
  }
}

class PageInfo {
  int pageNo;
  int pageSize;
  int pageCount;
  int totalRecordCount;

  PageInfo({
    required this.pageNo,
    required this.pageSize,
    required this.pageCount,
    required this.totalRecordCount,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      pageNo: json['PageNo'],
      pageSize: json['PageSize'],
      pageCount: json['PageCount'],
      totalRecordCount: json['TotalRecordCount'],
    );
  }
}
