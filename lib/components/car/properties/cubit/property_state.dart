part of 'property_cubit.dart';

class CarPropertiesState {
  const CarPropertiesState({this.car});

  final Car? car;

  @override
  List<Object> get props => [];

  CarPropertiesState copyWith({Car? car}) {
    return CarPropertiesState(
      car: car ?? this.car,
    );
  }
}
