class ItemsEntity {
  bool? success;
  int? totalPhotos;
  String? message;
  int? offset;
  int? limit;
  List<ItemEntity?> itemsList = [];
}

class ItemEntity {
  String? url;
  String? title;
  int? user;
  String? description;
  int? id;
}
