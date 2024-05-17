class Employee {
  final int Id;
  final String Empname;
  final String Password;
  final String BirthDate;
  final String Diagnosis;
  final String Allergy;
  final String NamePhamacy;
  final String Instruction;

  const Employee({
    required this.Id,
    required this.Empname,
    required this.Password,
    required this.BirthDate,
    required this.Diagnosis,
    required this.Allergy,
    required this.NamePhamacy,
    required this.Instruction,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        Id: json["Id"],
        Empname: json["Empname"],
        Password: json["Password"],
        BirthDate: json["BirthDate"],
        Diagnosis: json["Diagnosis"],
        Allergy: json["Allergy"],
        NamePhamacy: json["NamePhamacy"],
        Instruction: json["Instruction"],
      );

  Map<String, dynamic> toJson() => {
        "Id": Id,
        "Empname": Empname,
        "Password": Password,
        "BirthDate": BirthDate,
        "Diagnosis": Diagnosis,
        "Allergy": Allergy,
        "NamePhamacy": NamePhamacy,
        "Instruction": Instruction
      };
}
