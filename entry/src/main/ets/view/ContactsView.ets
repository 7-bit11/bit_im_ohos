@Component
export default struct ContactsView {
  build() {
    Column() {
      this._buildAppbar()
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
}