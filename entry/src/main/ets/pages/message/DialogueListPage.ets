import Dialogue, { MessageType, RoleType } from '../../entity/Dialogue';
import router from '@ohos.router';

@Entry
@Component
struct DialogueListPage {
  scroller: Scroller = new Scroller()
  @State name: string = "";
  params: object = router.getParams();

  aboutToAppear(): void {
    this.name = this.params['name'];
  }

  dialogueList: Array<Dialogue> = [
    new Dialogue(MessageType.text, '你在学什么啊你在学什么啊你在学什么啊你在学什么啊你在学什么啊你在学什么啊你在学什么啊你在学什么啊',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '有没有可能老余看到了。让修复了',
      "法的空间 | 上海 | Flutter",
      'https://upload.jianshu.io/users/upload_avatars/15266155/f1956eee-3f4e-4160-a1e5-8460802e518e.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/144/h/144/format/webp',
      RoleType.you),
    new Dialogue(MessageType.text, 'Flutter CTO 2024 报告出炉解读，看看有没有你关心的问题',
      "恋猫de小郭",
      'https://p3-passport.byteacctimg.com/img/user-avatar/4f40c8c1bc9e95d86779e105c922ca2f~150x150.awebp',
      RoleType.you),
    new Dialogue(MessageType.text, '国庆假期，我用Flutter写了个我自己都玩不赢的五子棋AI🤣',
      "编程的小白",
      'https://p9-passport.byteacctimg.com/img/user-avatar/af5f7ee5f0c449f25fc0b32c050bf100~150x150.awebp',
      RoleType.you),
    new Dialogue(MessageType.text, '4',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you),
    new Dialogue(MessageType.image, 'https://konachan.net/sample/2c00cdddf9ee0da9c34dd7934e49b16c/Konachan.com%20-%20380411%20sample.jpg',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '5',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '6',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you),
    new Dialogue(MessageType.text, '7',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you),
    new Dialogue(MessageType.text, '8',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '9',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you),
    new Dialogue(MessageType.text, '10',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you),
    new Dialogue(MessageType.text, '11',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you),
    new Dialogue(MessageType.text, 'hhhhhh',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you),
  ];

  build() {
    Column() {
      this.buildAppbar()

      List({ space: 20, scroller: this.scroller }) {
        ForEach(this.dialogueList, (item: Dialogue, index: number) => {
          ListItem() {
            if (item.roleType == RoleType.me) {
              this.meItem(item)
            } else {
              this.youItem(item)
            }
          }

        })
      }.layoutWeight(1).backgroundColor("#f1f1f1")
      .padding(10)
      .scrollBar(BarState.Off)

      this.buildBottomBar()
    }.width("100%").height("100%")
  }

  @Builder
  buildAppbar() {
    Row({ space: 20 }) {
      Image($rawfile("Chevron_Left.svg")).width(24).height(24).fillColor(Color.Black).onClick(() => {
        router.back()
      })

      Text(this.name + "🍬").fontSize(18)
        .onClick(() => {
          this.scroller.scrollToIndex(this.dialogueList.length - 1, true);
        })
      Blank()
      Image($rawfile("Hamburger_MD.svg")).width(24).height(24).fillColor(Color.Black)
    }
    .width("100%")
    .backgroundColor(Color.White)
    .padding({
      left: 15,
      right: 15,
      top: 10,
      bottom: 10
    })
  }

  @Builder
  buildBottomBar() {
    Row({ space: 10 }) {
      Image($rawfile("microphone.svg")).width(24).height(24).fillColor(Color.Black)
      TextInput()
        .width('95%')
        .height(35)
        .margin(5)
        .maxLength(9)
        .onSecurityStateChange(((isShowPassword: boolean) => {
          // 更新密码显示状态
          console.info('isShowPassword', isShowPassword)

        }))
        .layoutWeight(1)
        .borderRadius(8)
      Image($rawfile("Star-Struck.svg")).width(24).height(24).fillColor(Color.Black)
      Image($rawfile("Add_Plus_Circle.svg")).width(24).height(24).fillColor(Color.Black)
    }
    .padding({
      left: 15,
      right: 15,
      top: 5,
      bottom: 5
    })
  }

  @Builder
  meItem(item: Dialogue) {

    Column({ space: 5 }) {
      Text(item.name).fontSize(12)
      Row() {

        Flex({
          wrap: FlexWrap.WrapReverse,
          direction: FlexDirection.Row,
          justifyContent: FlexAlign.Start,
          alignItems: ItemAlign.Start
        }) {
          if (item.msgType == MessageType.text) {
            Text(item.msg).backgroundColor("#0099ff")
              .padding({
                left: 12,
                right: 12,
                top: 10,
                bottom: 10
              }).fontColor(Color.White)
              .borderRadius(8)
          } else if (item.msgType == MessageType.image) {
            Image(item.msg)
              .objectFit(ImageFit.Auto)
              .alt($rawfile("img.png"))
              .width("70%")
          }
        }.layoutWeight(1)
        Text().width(5)
        Image(item.url).width(45).height(45).borderRadius(30)

      }.alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .width("100%")
    }
    .justifyContent(FlexAlign.End)
    .alignItems(HorizontalAlign.End)
  }

  @Builder
  youItem(item: Dialogue) {
    Column({ space: 5 }) {
      Text(item.name).fontSize(12)
      Row() {
        Flex({
          wrap: FlexWrap.Wrap,
          direction: FlexDirection.Row,
          justifyContent: FlexAlign.Start,
          alignItems: ItemAlign.Center
        }) {
          Image(item.url).width(45).height(45).borderRadius(30)
          Text().width(5)
          Text(item.msg).backgroundColor(Color.White)
            .padding({
              left: 10,
              right: 10,
              top: 8,
              bottom: 8
            }).fontColor(Color.Black)
            .borderRadius(8)
        }
      }.alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .width("100%")
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}