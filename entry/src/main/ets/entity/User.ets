export default class User {
  image: ResourceStr;
  name: string;
  state: string;

  constructor(image: ResourceStr, name: string, state: string) {
    this.image = image;
    this.name = name;
    this.state = state;
  }
}