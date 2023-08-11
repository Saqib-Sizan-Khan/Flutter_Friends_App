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
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final String phone;
  final String cell;
  final Picture picture;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.phone,
    required this.cell,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'],
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      phone: json['phone'],
      cell: json['cell'],
      picture: Picture.fromJson(json['picture']),
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

class Location {
  final String city;
  final String state;
  final String country;

  Location({
    required this.city,
    required this.state,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('location')) {
      Map<String, dynamic> locationJson = json['location'];
      return Location(
        city: locationJson['city'],
        state: locationJson['state'],
        country: locationJson['country'],
      );
    } else {
      // Handle the case where "location" key is not nested
      return Location(
        city: json['city'],
        state: json['state'],
        country: json['country'],
      );
    }
  }

}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
