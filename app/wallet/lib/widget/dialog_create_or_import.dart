import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCreateOrImport extends StatelessWidget {
  DialogCreateOrImport({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _widget('创建钱包', 1),
          Divider(height: 1),
          _widget('导入钱包', 2),
          Divider(height: 1),
          _widget('取消', 3),
        ],
      ),
    );
  }

  Widget _widget(label, status) {
    return InkWell(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text(label),
      ),
      onTap: () {
        Get.back(result: status);
      },
    );
  }

  ///选择多张图片 Select multiple images
// Future<void> selectImages() async {
//   var file = await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (ObjectUtil.isNotEmpty(file)) {
//     model.updateAvatar(file.path);
//   }
// }

  ///直接打开相机拍照
// Future<void> openCamera() async {
//   var file = await ImagePicker().pickImage(source: ImageSource.camera);
//   if (ObjectUtil.isNotEmpty(file)) {
//     model.updateAvatar(file.path);
//   }
// }
}
