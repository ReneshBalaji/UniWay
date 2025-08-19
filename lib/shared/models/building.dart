class Building {
  final String id;
  final String name;
  final String description;
  final String type;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final int etaMinutes;
  final List<String> facilities;
  final List<String> tags;

  const Building({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.etaMinutes,
    required this.facilities,
    required this.tags,
  });

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      etaMinutes: json['etaMinutes'] as int,
      facilities: List<String>.from(json['facilities']),
      tags: List<String>.from(json['tags']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'imageUrl': imageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'etaMinutes': etaMinutes,
      'facilities': facilities,
      'tags': tags,
    };
  }

  @override
  String toString() {
    return 'Building(id: $id, name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Building && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 