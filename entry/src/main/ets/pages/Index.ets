import Message from '../entity/Message';

@Entry
@Component
struct Index {
  srcList: Array<Message> = [
    new Message($rawfile("flutter.png"), "HarmonyCandies", "7_bit | [Uint8List] | 我就是笨蛋", ":你们在干嘛",
      "下午3:30",
      100),
    new Message($rawfile("harmony.png"), "HarmonyCandies", "道长 | 深圳 | PHP", ":可以开始卷了大家", "刚刚", 0),
    new Message($rawfile("img.png"), "造物主动态桌面", "00后想买大房子", "我已经上了30个小时了", "下午4:18", 53),
    new Message($rawfile("bit7.jpg"), "7_bit", "[文件]", ":等待接收", "上午11:30", 1),
    new Message($rawfile("g.jpg"), "呱呱呱", "", "来上号了哇，别学习了！", "中午12:01", 0),
    new Message($rawfile("e.jpg"), "八嘎の君", "", "很快乐，很幸福，感觉每天都很阳光", "下午4:18", 1),
    new Message($rawfile("e.jpg"), "八嘎の君", "", "很快乐，很幸福，感觉每天都很阳光", "下午4:18", 1),
    new Message($rawfile("e.jpg"), "八嘎の君", "", "很快乐，很幸福，感觉每天都很阳光", "下午4:18", 1),
    new Message($rawfile("e.jpg"), "八嘎の君", "", "很快乐，很幸福，感觉每天都很阳光", "下午4:18", 1),
    new Message($rawfile("e.jpg"), "八嘎の君", "", "很快乐，很幸福，感觉每天都很阳光", "下午4:18", 1)
  ];

  build() {
    Column({ space: 10 }) {
      this._buildAppbar()
      List({ space: 10 }) {
        ListItem() {
          this._buildSearch()
        }

        ListItem() {
          this._buildTable()
        }

        ListItem() {
          this._buildMessageList(this.srcList)
        }
      }.layoutWeight(1).scrollBar(BarState.Off)

    }.width("100%").height("100%")
    .padding(15).backgroundColor(Color.White)
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
      Column({ space: 5 }) {
        Text("7-bit")
        Row({ space: 5 }) {
          Column().width(10).height(10).borderRadius(20).backgroundColor("#14FA1B")
          Text("手机在线 - WiFi >").fontSize(10)
        }
      }.alignItems(HorizontalAlign.Start).layoutWeight(1)

      Image($rawfile("plus-sm.svg")).width(25).height(25)
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
  _buildTable() {
    Row({ space: 20 }) {
      Image($rawfile("Monitor.svg"))
        .width(20)
        .height(20)
        .fillColor(Color.Grey)
      Text("已登录 Windows")
        .fontSize(14)
        .fontColor(Color.Grey)
        .layoutWeight(1)
      Image($rawfile("chevronright.svg"))
        .height(30)
        .fillColor(Color.Grey)
    }
  }

  @Builder
  _buildMessageList(msgList: Array<Message>) {
    List({ space: 20 }) {
      ForEach(msgList, (msg: Message, index: number) => {
        this._buildMessageItem(msg);
      })
    }.layoutWeight(1)
    .scrollBar(BarState.Off)
  }

  @Builder
  _buildMessageItem(msg: Message) {
    Row({ space: 10 }) {
      Image(msg.image)
        .width(45).height(45).borderRadius(25)

      Column({ space: 5 }) {
        Text(msg.groupName)
          .fontSize(16)
        Text(`${msg.sender} ${msg.msg}`)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontSize(14)
          .fontColor(Color.Grey)
      }.layoutWeight(1)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)

      Column({ space: 5 }) {
        Text(msg.time)
          .fontSize(12).fontColor(Color.Grey)
        Badge({
          count: msg.count,
          position: BadgePosition.Right,
          style: { badgeSize: 16, badgeColor: '#FA2A2D' }
        }) {
          Text('')
        }.height(20).margin({ left: 15 })
      }
    }.width("100%")
  }
}