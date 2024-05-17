class Employee {
  final int Id;
  final String Empname;
  final String Password;

  const Employee({
    required this.Id,
    required this.Empname,
    required this.Password,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    Id: json["Id"],
    Empname: json["Empname"],
    Password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "Id": Id,
    "Empname": Empname,
    "Password": Password
  };
}
