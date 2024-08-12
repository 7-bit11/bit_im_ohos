import ContactsData from '../data/ContactsData'
import GroupUser from '../entity/GroupUser'
import User from '../entity/User'
import MessageListView from './MessageListView'

@Component
export default struct ContactsView {
  private controller: TabsController = new TabsController()
  @State currentIndex: number = 1

  build() {
    Column({ space: 10 }) {
      this._buildAppbar()
      this._buildSearch()
      this._buildRowItem("新朋友", (e) => {
        console.log("点击触发事件，后续加入点击跳转事件")
      })
      this._buildRowItem("群通知")
      this._buildHead();
    }
    .width("100%")
    .height("100%")
    .padding({
      top: 15,
      left: 15,
      right: 15,
      bottom: 5
    })
    .backgroundColor(Color.White)
  }

  @Builder
  _buildAppbar() {
    Row({ space: 10 }) {
      Image($rawfile("bit7.jpg"))
        .width(40)
        .height(40)
        .borderRadius(40)
        .objectFit(ImageFit.Auto)
      //.alignRules({ top: {anchor:"1", align: VerticalAlign.Top } })
      Column() {
        Text("联系人")
      }.alignItems(HorizontalAlign.Start).layoutWeight(1)

      Image($rawfile("user_add.svg")).width(25).height(25)
        .fillColor("#282828")
    }
  }

  @Builder
  _buildSearch() {
    Row({ space: 5 }) {
      Image($rawfile("Search_Magnifying_Glass.svg"))
        .width(18)
        .height(18)
        .fillColor(Color.Grey)
      Text("搜索").fontColor(Color.Grey).fontSize(15)
    }
    .width("100%")
    .height(35)
    .backgroundColor("#f5f5f5")
    .borderRadius(6)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  _buildRowItem(title: string, onEvent?: (event: ClickEvent) => void) {
    Row() {
      Text(title)
      Blank()
      Image($rawfile("arrow-right.svg"))
        .height(16)
        .fillColor(Color.Grey)
    }
    .width("100%")
    .onClick(onEvent)
    .margin({ top: 15 })
  }

  list: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 689, 7];

  @Builder
  _buildHead() {
    Tabs({ controller: this.controller, index: this.currentIndex }) {
      TabContent() {
        this._buildUserList(ContactsData.srcList)
      }.tabBar(this._buildItemHead("好友", 0))

      TabContent() {
        this._buildGroupUserList(ContactsData.srcGroupList)
      }.tabBar(this._buildItemHead("分组", 1))

      TabContent() {
        Text("群聊")
      }.tabBar(this._buildItemHead("群聊", 2))

      TabContent() {
        Text("频道")
      }.tabBar(this._buildItemHead("频道", 3))

      TabContent() {
        Text("设备")
      }.tabBar(this._buildItemHead("设备", 4))

      TabContent() {
        Text("通讯录")
      }.tabBar(this._buildItemHead("通讯录", 5))
    }.layoutWeight(1)
    .onChange(index => this.currentIndex = index)
  }

  @Builder
  _buildItemHead(str: string, targetIndex: number) {
    Text(str).fontColor(this.currentIndex === targetIndex ? '#2c80ff' : '#545454')
  }

  ///好友列表
  @Builder
  _buildUserList(srcList: Array<User>) {
    List({ space: 15 }) {
      ForEach(srcList, (item: User, index: number) => {
        ListItem() {
          Row({ space: 10 }) {
            Image(item.image).width(40).height(40).borderRadius(25)
            Column({ space: 5 }) {
              Text(item.name)
              Text(item.state).fontColor(Color.Grey)
                .fontSize(12)
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width("100%")
          .padding({ left: 5, right: 5 })

        }
      })
    }.layoutWeight(1)
    .scrollBar(BarState.Off)
  }

  ///好友列表
  @Builder
  _buildGroupUserList(srcGroupList: Array<GroupUser>) {
    List({ space: 0 }) {
      ForEach(srcGroupList, (item: GroupUser, index: number) => {
        ListItemGroup({
          space: 15,
          header: this._buildGroupUserHeader(item.groupName, item.groupList.length / 2, item.groupList.length)
        }) {
          ForEach(item.groupList, (userItem: User) => {
            ListItem() {
              Row({ space: 15 }) {
                Image(userItem.image).width(40).height(40).borderRadius(25)
                Column({ space: 5 }) {
                  Text(userItem.name)
                  Text(userItem.state).fontColor(Color.Grey)
                    .fontSize(12)
                }
                .alignItems(HorizontalAlign.Start)
              }
              .width("100%")
              .padding(5)
            }
          })
        }.layoutWeight(1)
      })
    }.layoutWeight(1)
    .scrollBar(BarState.Off)
    //ListItemGroup 分组固定头部必须
    .sticky(StickyStyle.Header | StickyStyle.Footer)
  }

  @Builder
  _buildGroupUserHeader(name: string, count: number, total: number) {
    Row() {
      Text(name)
      Blank()
      Text(`${Math.floor(count)}/${total}`).fontColor(Color.Grey).fontSize(12)
    }.width("100%").padding({ top: 5, bottom: 5 })
    .backgroundColor(Color.White)
  }
}