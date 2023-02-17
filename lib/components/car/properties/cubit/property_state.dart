part of 'property_cubit.dart';

class CarPropertiesState extends Equatable {
  const CarPropertiesState({
    required this.car,
  });

  final Car car;

  @override
  List<Object?> get props => <Object?>[
        car,
      ];

  CarPropertiesState copyWith({Car? car}) {
    return CarPropertiesState(
      car: car ?? this.car,
    );
  }
}
