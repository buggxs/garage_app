import 'package:garage_app/api/car/data/air_conditioner_data.dart';
import 'package:garage_app/api/car/data/brake_data.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/car/data/oil_data.dart';
import 'package:garage_app/api/car/data/technical_data.dart';
import 'package:garage_app/api/car/data/timing_belt_data.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/api/note/data/note.dart';

const double kTabHeight = 50;

final Car constCar = Car(
  id: 1,
  name: 'Gigolo',
  mileage: 132000,
  date: DateTime(2003, 4, 12),
  vintage: 2003,
  imageUrls: const <String>[
    'https://maserati.scene7.com/is/image/maserati/maserati/international/Models/my22/grecale/my22/modena/169/Maserati_Grecale_Modena_FULL_FRONT.jpg',
    'https://img.topky.sk/podkapotou/1280px/1721927.jpg/Maserati-Levante-2016.jpg',
    'https://www.reezocar.com/480/autoscout24.fr/RZCATSFRCA5912A875CB/MASERATI-LEVANTE-00.jpg',
  ],
  oilData: OilData(
      id: 1,
      lastChangeDate: DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: DateTime(2022, 7, 5),
      nextChangeMileage: 140000),
  airConditioner: AirConditionerData(
      id: 1,
      lastChangeDate: DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: DateTime(2022, 7, 5),
      nextChangeMileage: 140000),
  brakeData: BrakeData(
      id: 1,
      lastChangeDate: DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: DateTime(2022, 7, 5),
      nextChangeMileage: 140000),
  timingBeltData: TimingBeltData(
      id: 1,
      lastChangeDate: DateTime(2020, 7, 5),
      lastChangeMileage: 124000,
      nextChangeDate: DateTime(2022, 7, 5),
      nextChangeMileage: 140000),
  technicalData: TechnicalData(
    id: 1,
    brand: "Audi",
    model: "A3",
    type: "abc",
    hsn: "3nf",
    tsn: "kl3",
  ),
  noteList: <Note>[
    Note(
      id: 1,
      note:
          '''Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam''',
      dateTime: DateTime(2022, 2, 20),
    ),
    Note(
      id: 2,
      note:
          '''Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam''',
      dateTime: DateTime.now(),
    ),
  ],
  documentList: <List<Document>>[
    <Document>[
      Document(id: 1, name: 'Fahrzeugschein'),
      Document(id: 2, name: 'Fahrzeugbrief'),
      Document(id: 3, name: 'Kaufvertrag'),
    ],
    <Document>[
      Document(id: 4, name: 'Auspuff ausgetauscht'),
      Document(id: 5, name: 'Zahnriemenwechsel'),
      Document(id: 6, name: 'Ölwechsel'),
    ],
    const <Document>[],
  ],
);
