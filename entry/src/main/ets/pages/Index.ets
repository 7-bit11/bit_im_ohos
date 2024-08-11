import Message from '../entity/Message';
import ContactsView from '../view/ContactsView';
import MessageListView from '../view/MessageListView';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  //默认当前页面为
  @State currentIndex: number = 1
  private controller: TabsController = new TabsController()
  @State opacityList: number[] = []
  @State scaleList: number[] = []
  private timeoutList: number[] = []
  private _animationDuration: number = 400;
  //Table切换动画效果
  private customContentTransition: (from: number, to: number) => TabContentAnimatedTransition =
    (from: number, to: number) => {
      let tabContentAnimatedTransition = {
        timeout: this.timeoutList[from],
        transition: (proxy: TabContentTransitionProxy) => {
          // this.scaleList[from] = 1.0
          // this.scaleList[to] = 0.8
          this.opacityList[from] = 1.0
          this.opacityList[to] = 0.5
          animateTo({
            duration: this._animationDuration,
            onFinish: () => {
              proxy.finishTransition()
            }
          }, () => {
            // this.scaleList[from] = 0.8
            // this.scaleList[to] = 1.0
            this.opacityList[from] = 0.5
            this.opacityList[to] = 1.0
          })
        }
      } as TabContentAnimatedTransition
      return tabContentAnimatedTransition
    }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
      TabContent() {
        MessageListView()
          .onClick(()=>{
            router.pushUrl({url:"pages/TestPage"},router.RouterMode.Single)
          })
      }
      .tabBar(this.tabBuilder("消息", 0, $rawfile("chat.svg")))
      // 自定义动画变化透明度、缩放页面等
      .opacity(this.opacityList[0])

      //.scale({ x: this.scaleList[0], y: this.scaleList[0] })

      TabContent() {
        ContactsView()
      }
      .tabBar(this.tabBuilder("好友", 1, $rawfile("user.svg"))).opacity(this.opacityList[1])
      .scale({ x: this.scaleList[1], y: this.scaleList[1] })

      TabContent() {
        Text("动态")
      }
      .tabBar(this.tabBuilder("动态", 2, $rawfile("planet.svg"))).opacity(this.opacityList[2])
      .scale({ x: this.scaleList[2], y: this.scaleList[2] })
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f9f9f9")
    .scrollable(false)
    .onChange(index => this.currentIndex = index)
    .customContentTransition(this.customContentTransition)

    //.animationDuration(500)
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
      Image(icon).height(20).width(20).fillColor(this.currentIndex === targetIndex ? '#2c80ff' : '#545454')
      Text(title).fontColor(this.currentIndex === targetIndex ? '#2c80ff' : '#545454')
        .fontSize(12)
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}