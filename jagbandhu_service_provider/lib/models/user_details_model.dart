class UserProfileData {
  String? id,
      firstName,
      lastname,
      dob,
      gender,
      email,
      status,
      phonenumber,
      address,
      country,
      state,
      city;

  UserProfileData({
    this.id,
    this.firstName,
    this.lastname,
    this.dob,
    this.gender,
    this.email,
    this.phonenumber,
    this.address,
    this.country,
    this.state,
    this.city,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastname,
      'dob': dob,
      'gender': gender,
      'email': email,
      'mobile': phonenumber,
      'address': address,
      'country': country,
      'state': state,
      'district': city,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'UserProfileData{id:$id,firstName: $firstName,lastName: $lastname,dob:$dob,gender:$gender,email:$email,mobile:$phonenumber,address:$address,country:$country,state:$state,district:$city,status:$status}';
  }
}

UserProfileData newUser = UserProfileData();

List<UserProfileData> userdata = [];
