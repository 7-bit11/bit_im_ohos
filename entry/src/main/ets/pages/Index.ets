@Entry
@Component
struct Index {
  srcList: Array<ResourceStr> = [
    $rawfile("flutter.png"),
    $rawfile("harmony.png")
  ];

  build() {
    Column({ space: 10 }) {
      this._buildAppbar()
      this._buildSearch()
      this._buildTable()
      this._buildMessageList(this.srcList)
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
  _buildMessageList(srcList: Array<ResourceStr>) {
    List({ space: 10 }) {
      ForEach(srcList, (src: ResourceStr, index: number) => {
        this._buildMessageItem(src);
      })
    }
  }

  @Builder
  _buildMessageItem(src: ResourceStr) {
    Row({ space: 10 }) {
      Image(src)
        .width(45).height(45).borderRadius(25)

      Column({ space: 5 }) {
        Text("HarmonyCandies")
          .fontSize(16)
        Text("7_bit | [Uint8List] | 我就是笨蛋：你们在干嘛啊!!!")
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontSize(14)
          .fontColor(Color.Grey)
      }.layoutWeight(1)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)

      Column({ space: 5 }) {
        Text("下午3:30")
          .fontSize(12).fontColor(Color.Grey)
        Badge({
          count: 100,
          position: BadgePosition.Right,
          style: { badgeSize: 16, badgeColor: '#FA2A2D' }
        }) {
          Text('')
        }.height(21).margin({ left: 10 })
      }
    }.width("100%")
  }
}