import 'package:equatable/equatable.dart';

class USDPrice extends Equatable {
  final String price;

  const USDPrice({required this.price});

  @override
  List<Object?> get props => [price];
}
