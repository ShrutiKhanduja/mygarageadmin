class MechanicsModel {
  final String name;
  final String phoneNumber;
  final String eMail;
  final String aadharNumber;

  MechanicsModel(
      {required this.name,
      required this.phoneNumber,
      required this.eMail,
      required this.aadharNumber});
}

List<MechanicsModel> dataModel = [
  MechanicsModel(
      name: 'Title ',
      phoneNumber: 'subtitle',
      eMail: 'email',
      aadharNumber: 'addharCard'),
  MechanicsModel(
      name: 'Mechanic 1',
      phoneNumber: '1861387844',
      eMail: 'mayanl@gmail.com',
      aadharNumber: '2451 6789'),
  MechanicsModel(
      name: 'Mechanic 2',
      phoneNumber: '1861387844',
      eMail: 'mayanl@gmail.com',
      aadharNumber: '2451 6789'),
  MechanicsModel(
      name: 'Mechanic 3',
      phoneNumber: '1861387844',
      eMail: 'mayanl@gmail.com',
      aadharNumber: '2451 6789'),
];
