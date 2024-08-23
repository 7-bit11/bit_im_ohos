export default class Dialogue {
  image: ResourceStr;
  msgType: MessageType;
  msg: string;
  name: string;

  constructor(image: ResourceStr, msgType: MessageType, msg: string, name: string) {
    this.image = image;
    this.msgType = msgType;
    this.msg = msg;
    this.name = name;
  }
}

enum MessageType {
  text,
  image
}