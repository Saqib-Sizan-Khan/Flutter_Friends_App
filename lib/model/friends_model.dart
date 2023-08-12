// model for converting json to dart
class UserModel {
  final List<User> results;

  UserModel({
    required this.results,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var userResults = json['results'] as List;
    List<User> users =
        userResults.map((userJson) => User.fromJson(userJson)).toList();

    return UserModel(
      results: users,
    );
  }
}

class User {
  final Location location;
  final Name name;
  final String email;
  final String cell;
  final Picture picture;

  User({
    required this.location,
    required this.name,
    required this.email,
    required this.cell,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      location: Location.fromJson(json['location']),
      name: Name.fromJson(json['name']),
      email: json['email'],
      cell: json['cell'],
      picture: Picture.fromJson(json['picture']),
    );
  }
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
    );
  }
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'],
      name: json['name'],
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Picture {
  final String large;

  Picture({
    required this.large,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
    );
  }
}
