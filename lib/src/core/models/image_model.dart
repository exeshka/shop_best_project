import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final String url;
  final String hash;

  const ImageModel({required this.url, required this.hash});

  @override
  List<Object?> get props => [hash, url];

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(url: json['url'], hash: json['hash']);
  }

  factory ImageModel.mock() {
    return ImageModel(
        url:
            'https://pristor.ru/wp-content/uploads/2022/09/%D0%9A%D1%80%D1%83%D1%82%D1%8B%D0%B5-%D1%84%D0%BE%D1%82%D0%BE-%D0%B0%D0%BD%D0%B8%D0%BC%D0%B5-%D0%BD%D0%B0-%D0%B0%D0%B2%D1%83-%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B0%D1%8F-%D0%BF%D0%BE%D0%B4%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-25.jpg',
        hash: "L58fpkR#5yoLEbs=V?xKp0S0=*ax");
  }
}
