class SettingsModel
{
  late bool status ;

  SettingsModel(this.status, this.data);

  late SettingData data ;

  SettingsModel.fromJson(Map<String ,dynamic> json)
  {
    status = json['status'];

    data = SettingData.fromJson(json['data']);
  }
}

class SettingData
{
  late String about;
  late String term;

  SettingData.fromJson(Map<String ,dynamic> json)
  {
    about = json['about'];
    term = json['term'];
  }

  SettingData(this.about, this.term);
}