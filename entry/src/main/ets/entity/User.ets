export default class User {
  image: ResourceStr;
  name: string;
  stateMsg: string;
  state: UserState;

  constructor(image: ResourceStr, name: string, stateMsg: string, state?: UserState) {
    this.image = image;
    this.name = name;
    this.stateMsg = stateMsg;
    this.state = state ?? UserState.onLine
  }
}

export enum UserState {
  offLine,
  onLine
}