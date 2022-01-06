import 'package:birbir/presentation/ui/route/route_name.dart';

enum MenuItemType {
  plan,
  workSchedule,
  services,
  about,
  address,

  branches,
  employees,
  workingHours,
  addAdmin,
  addEmployee,

  addService,
  permissions,
}

class MenuItem {
  final String title;
  final MenuItemType type;

  MenuItem(this.title, this.type);

  String get route {
    switch (type) {
      case MenuItemType.plan:
        return RouteName.employeePlan;

      case MenuItemType.workSchedule:
        return RouteName.employeeWorkSchedule;

      case MenuItemType.services:
        return RouteName.employeeServices;

      case MenuItemType.about:
        return RouteName.employeeAbout;

      case MenuItemType.address:
        return RouteName.employeeAddress;

      default:
        return "/error";
    }
  }
}
