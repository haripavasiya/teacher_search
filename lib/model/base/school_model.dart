class SchoolModel{
  String _imageUrl;
  String _name;
  String _address;
  String _phone_no;
  String _email;

  get imageUrl => _imageUrl;
  get name => _name;
  get address => _address;
  get phone_no => _phone_no;
  get email => _email;

  SchoolModel(this._imageUrl, this._name, this._address,this._phone_no,this._email);
}