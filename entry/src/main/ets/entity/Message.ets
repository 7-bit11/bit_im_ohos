export default class Message {
  image: ResourceStr;
  groupName: string;
  sender: string;
  msg: string;
  time: string;
  count: number;

  constructor(image: ResourceStr, groupName: string, sender: string, msg: string, time: string, count: number) {
    this.image = image;
    this.groupName = groupName;
    this.sender = sender;
    this.msg = msg;
    this.time = time;
    this.count = count;
  }
}