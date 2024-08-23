export default class Dialogue {
  msgType: MessageType;
  roleType: RoleType;
  msg: string;
  name: string;
  url:string;
  constructor(msgType: MessageType, msg: string, name: string, url:string, roleType?: RoleType) {
    this.msgType = msgType;
    this.roleType = roleType ?? RoleType.me;
    this.msg = msg;
    this.name = name;
    this.url=url
  }
}

export enum MessageType {
  text,
  image
}

export enum RoleType {
  me, you
}