import 'package:pokehomy/data/generic_data.dart';

void setRoleTagTeam(bool allRoleTag, String role) {
    if(!allRoleTag) {
      teamPurpleTag = role;
      teamOrangeTag = role;
    } else {
      teamPurpleTag = "";
      teamOrangeTag = "";
    }
  }
