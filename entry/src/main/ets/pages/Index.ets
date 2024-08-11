import Message from '../entity/Message';
import MessageListView from '../view/MessageListView';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
      TabContent() {
        MessageListView()
      }
      .tabBar(this.tabBuilder("消息", 0, $rawfile("chat.svg")))

      TabContent() {
        Text("好友")
      }
      .tabBar(this.tabBuilder("好友", 1, $rawfile("user.svg")))

      TabContent() {
        Text("动态")
      }
      .tabBar(this.tabBuilder("动态", 2, $rawfile("planet.svg")))
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f9f9f9")
    .scrollable(false)
    .onChange(index => this.currentIndex = index)

    // .onContentWillChange((currentIndex, comingIndex) => {
    //   if (comingIndex == 2) {
    //     return false
    //   }
    //   return true
    // })
  }

  @Builder
  tabBuilder(title: string, targetIndex: number, icon: ResourceStr) {
    Column() {
      Image(icon).height(20).width(20).fillColor(this.currentIndex === targetIndex ? '#1698CE' : '#545454')
      Text(title).fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#545454')
        .fontSize(12)
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}