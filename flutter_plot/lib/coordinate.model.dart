// import 'dart:convert';

// List<Coordinates> coordinatesFromJson(String str) => List<Coordinates>.from(
//     json.decode(str).map((x) => Coordinates.fromJson(x)));

// String coordinatesToJson(List<Coordinates> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Coordinates {
//   int scanId;
//   List<List<double>> oval;
//   List<int> tone;
//   List<Region> regions;
//   List<dynamic> inflammations;
//   List<Pigmentation> pigmentations;
//   List<Pigmentation> sebums;
//   List<Wrinkle> wrinkles;
//   List<Pore> pores;

//   Coordinates({
//     required this.scanId,
//     required this.oval,
//     required this.tone,
//     required this.regions,
//     required this.inflammations,
//     required this.pigmentations,
//     required this.sebums,
//     required this.wrinkles,
//     required this.pores,
//   });

//   factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
//         scanId: json["scan_id"],
//         oval: List<List<double>>.from(json["oval"]
//             .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
//         tone: List<int>.from(json["tone"].map((x) => x)),
//         regions:
//             List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
//         inflammations: List<dynamic>.from(json["inflammations"].map((x) => x)),
//         pigmentations: List<Pigmentation>.from(
//             json["pigmentations"].map((x) => Pigmentation.fromJson(x))),
//         sebums: List<Pigmentation>.from(
//             json["sebums"].map((x) => Pigmentation.fromJson(x))),
//         wrinkles: List<Wrinkle>.from(
//             json["wrinkles"].map((x) => Wrinkle.fromJson(x))),
//         pores: List<Pore>.from(json["pores"].map((x) => Pore.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "scan_id": scanId,
//         "oval": List<dynamic>.from(
//             oval.map((x) => List<dynamic>.from(x.map((x) => x)))),
//         "tone": List<dynamic>.from(tone.map((x) => x)),
//         "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
//         "inflammations": List<dynamic>.from(inflammations.map((x) => x)),
//         "pigmentations":
//             List<dynamic>.from(pigmentations.map((x) => x.toJson())),
//         "sebums": List<dynamic>.from(sebums.map((x) => x.toJson())),
//         "wrinkles": List<dynamic>.from(wrinkles.map((x) => x.toJson())),
//         "pores": List<dynamic>.from(pores.map((x) => x.toJson())),
//       };
// }

// class Pigmentation {
//   List<List<double>> boundary;
//   double area;
//   List<int> tone;
//   int type;

//   Pigmentation({
//     required this.boundary,
//     required this.area,
//     required this.tone,
//     required this.type,
//   });

//   factory Pigmentation.fromJson(Map<String, dynamic> json) => Pigmentation(
//         boundary: List<List<double>>.from(json["boundary"]
//             .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
//         area: json["area"]?.toDouble(),
//         tone: List<int>.from(json["tone"].map((x) => x)),
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "boundary": List<dynamic>.from(
//             boundary.map((x) => List<dynamic>.from(x.map((x) => x)))),
//         "area": area,
//         "tone": List<dynamic>.from(tone.map((x) => x)),
//         "type": type,
//       };
// }

// class Pore {
//   List<double> center;
//   int type;

//   Pore({
//     required this.center,
//     required this.type,
//   });

//   factory Pore.fromJson(Map<String, dynamic> json) => Pore(
//         center: List<double>.from(json["center"].map((x) => x?.toDouble())),
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "center": List<dynamic>.from(center.map((x) => x)),
//         "type": type,
//       };
// }

// class Region {
//   String name;
//   bool skin;
//   List<List<double>> boundary;
//   double area;
//   List<int> tone;

//   Region({
//     required this.name,
//     required this.skin,
//     required this.boundary,
//     required this.area,
//     required this.tone,
//   });

//   factory Region.fromJson(Map<String, dynamic> json) => Region(
//         name: json["name"],
//         skin: json["skin"],
//         boundary: List<List<double>>.from(json["boundary"]
//             .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
//         area: json["area"]?.toDouble(),
//         tone: List<int>.from(json["tone"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "skin": skin,
//         "boundary": List<dynamic>.from(
//             boundary.map((x) => List<dynamic>.from(x.map((x) => x)))),
//         "area": area,
//         "tone": List<dynamic>.from(tone.map((x) => x)),
//       };
// }

// class Wrinkle {
//   List<List<double>> boundary;
//   double length;
//   int type;

//   Wrinkle({
//     required this.boundary,
//     required this.length,
//     required this.type,
//   });

//   factory Wrinkle.fromJson(Map<String, dynamic> json) => Wrinkle(
//         boundary: List<List<double>>.from(json["boundary"]
//             .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
//         length: json["length"]?.toDouble(),
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "boundary": List<dynamic>.from(
//             boundary.map((x) => List<dynamic>.from(x.map((x) => x)))),
//         "length": length,
//         "type": type,
//       };
// }

// To parse this JSON data, do
//
//     final Coordinates = CoordinatesFromJson(jsonString);

import 'dart:convert';

List<Coordinates> coordinatesFromJson(String str) => List<Coordinates>.from(
    json.decode(str).map((x) => Coordinates.fromJson(x)));

String coordinatesToJson(List<Coordinates> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coordinates {
  int scanId;
  List<List<double>> oval;
  List<int> tone;
  List<Region> regions;
  List<dynamic> inflammations;
  List<Pigmentation> pigmentations;
  List<Pigmentation> sebums;
  List<Wrinkle> wrinkles;
  List<Pore> pores;

  Coordinates({
    required this.scanId,
    required this.oval,
    required this.tone,
    required this.regions,
    required this.inflammations,
    required this.pigmentations,
    required this.sebums,
    required this.wrinkles,
    required this.pores,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        scanId: json["scan_id"],
        oval: List<List<double>>.from(json["oval"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        tone: List<int>.from(json["tone"].map((x) => x)),
        regions:
            List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
        inflammations: List<dynamic>.from(json["inflammations"].map((x) => x)),
        pigmentations: List<Pigmentation>.from(
            json["pigmentations"].map((x) => Pigmentation.fromJson(x))),
        sebums: List<Pigmentation>.from(
            json["sebums"].map((x) => Pigmentation.fromJson(x))),
        wrinkles: List<Wrinkle>.from(
            json["wrinkles"].map((x) => Wrinkle.fromJson(x))),
        pores: List<Pore>.from(json["pores"].map((x) => Pore.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scan_id": scanId,
        "oval": List<dynamic>.from(
            oval.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "tone": List<dynamic>.from(tone.map((x) => x)),
        "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
        "inflammations": List<dynamic>.from(inflammations.map((x) => x)),
        "pigmentations":
            List<dynamic>.from(pigmentations.map((x) => x.toJson())),
        "sebums": List<dynamic>.from(sebums.map((x) => x.toJson())),
        "wrinkles": List<dynamic>.from(wrinkles.map((x) => x.toJson())),
        "pores": List<dynamic>.from(pores.map((x) => x.toJson())),
      };
}

class Pigmentation {
  List<List<double>> boundary;
  double area;
  List<int> tone;
  int type;

  Pigmentation({
    required this.boundary,
    required this.area,
    required this.tone,
    required this.type,
  });

  factory Pigmentation.fromJson(Map<String, dynamic> json) => Pigmentation(
        boundary: List<List<double>>.from(json["boundary"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        area: json["area"]?.toDouble(),
        tone: List<int>.from(json["tone"].map((x) => x)),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "boundary": List<dynamic>.from(
            boundary.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "area": area,
        "tone": List<dynamic>.from(tone.map((x) => x)),
        "type": type,
      };
}

class Pore {
  List<List<double>> boundary;
  int type;

  Pore({
    required this.boundary,
    required this.type,
  });

  factory Pore.fromJson(Map<String, dynamic> json) => Pore(
        boundary: List<List<double>>.from(json["boundary"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "boundary": List<dynamic>.from(
            boundary.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": type,
      };
}

class Region {
  String name;
  bool skin;
  List<List<double>> boundary;
  double area;
  List<int> tone;

  Region({
    required this.name,
    required this.skin,
    required this.boundary,
    required this.area,
    required this.tone,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        name: json["name"],
        skin: json["skin"],
        boundary: List<List<double>>.from(json["boundary"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        area: json["area"]?.toDouble(),
        tone: List<int>.from(json["tone"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "skin": skin,
        "boundary": List<dynamic>.from(
            boundary.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "area": area,
        "tone": List<dynamic>.from(tone.map((x) => x)),
      };
}

class Wrinkle {
  List<List<double>> boundary;
  double length;
  int type;

  Wrinkle({
    required this.boundary,
    required this.length,
    required this.type,
  });

  factory Wrinkle.fromJson(Map<String, dynamic> json) => Wrinkle(
        boundary: List<List<double>>.from(json["boundary"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        length: json["length"]?.toDouble(),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "boundary": List<dynamic>.from(
            boundary.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "length": length,
        "type": type,
      };
}
