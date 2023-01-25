class DeviceModel {
  String? name;
  String? color;
  bool? isActive;
  String? icon;

  DeviceModel({
    this.name,
    this.color,
    this.isActive,
    this.icon,
  });

  DeviceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
    isActive = json['isActive'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'color': color,
      'isActive': isActive,
      'icon': icon,
    };
  }
}
