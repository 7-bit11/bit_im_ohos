import GroupUser from '../entity/GroupUser';
import User, { UserState } from '../entity/User';

export default class ContactsData {
  static srcList: Array<User> = [
    new User($rawfile("flutter.png"), "FlutterCandies", "[WiFi在线]"),
    new User($rawfile("harmony.png"), "HarmonyCandies", "[5G在线]"),
    new User($rawfile("img.png"), "造物主动态桌面", "[追剧中。。。]"),
    new User($rawfile("bit7.jpg"), "7_bit", "[手机在线]"),
    new User($rawfile("g.jpg"), "呱呱呱", "[离线]", UserState.offLine),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]",),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]", UserState.offLine),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]"),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]"),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]")
  ];
  static srcGroupList: Array<GroupUser> = [
    new GroupUser("特别关心")
    , new GroupUser("我的群聊",
    [new User($rawfile("flutter.png"), "FlutterCandies", "[WiFi在线]"),
      new User($rawfile("harmony.png"), "HarmonyCandies", "[5G在线]"),
      new User($rawfile("img.png"), "造物主动态桌面", "[追剧中。。。]"),])
    , new GroupUser("关注好友", [new User($rawfile("bit7.jpg"), "7_bit", "[手机在线]"),])
    , new GroupUser("同学分组", [
    new User($rawfile("g.jpg"), "呱呱呱", "[离线]", UserState.offLine),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]", UserState.offLine),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]"),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]", UserState.offLine),
    new User($rawfile("e.jpg"), "八嘎の君", "[WiFi在线]"),
  ])
  ];
}