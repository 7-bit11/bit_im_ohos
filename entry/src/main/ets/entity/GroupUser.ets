import User from './User';

export default class GroupUser {
  groupName: string;
  groupList: Array<User>;

  constructor(groupName: string, groupList?: Array<User>) {
    this.groupName = groupName;
    this.groupList = groupList ?? [];
  }
}