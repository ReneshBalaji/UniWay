class Event {
  final String id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;
  final DateTime date;
  final String location;
  final double latitude;
  final double longitude;
  final List<String> tags;
  final bool isActive;

  const Event({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.tags,
    this.isActive = true,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      date: DateTime.parse(json['date'] as String),
      location: json['location'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      tags: List<String>.from(json['tags']),
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'imageUrl': imageUrl,
      'date': date.toIso8601String(),
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'tags': tags,
      'isActive': isActive,
    };
  }

  String get formattedDate {
    return '${date.day} ${_getMonthName(date.month)} ${date.year}';
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  bool get isUpcoming {
    return date.isAfter(DateTime.now());
  }

  @override
  String toString() {
    return 'Event(id: $id, name: $name, date: $formattedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Event && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 