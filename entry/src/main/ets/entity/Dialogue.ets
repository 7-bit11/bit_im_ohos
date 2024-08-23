export default class Dialogue {
  msgType: MessageType;
  roleType: RoleType;
  msg: string;
  name: string;

  constructor(msgType: MessageType, msg: string, name: string, roleType?: RoleType) {
    this.msgType = msgType;
    this.roleType = roleType ?? RoleType.me;
    this.msg = msg;
    this.name = name;
  }
}

export enum MessageType {
  text,
  image
}

export enum RoleType {
  me, you
}