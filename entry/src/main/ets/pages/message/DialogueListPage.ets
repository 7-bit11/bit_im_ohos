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
    new Dialogue(MessageType.text, '你在学什么啊',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '1',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '2',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '3',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '4',
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
      RoleType.me),
    new Dialogue(MessageType.text, '7',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '8',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '9',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '10',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, '11',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
    new Dialogue(MessageType.text, 'hhhhhh',
      "7_bit | [Uint8List] | 失眠症",
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.me),
  ];

  build() {
    Column() {
      Row({ space: 20 }) {
        Image($rawfile("Chevron_Left.svg")).width(24).height(24).fillColor(Color.Black).onClick(() => {
          router.back()
        })
        Text(this.name + "🍬").fontSize(18)
          .onClick(() => {
            this.scroller.scrollToIndex(this.dialogueList.length-1,true);
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

      List({ space: 20, scroller: this.scroller }) {
        ForEach(this.dialogueList, (item: Dialogue, index: number) => {
          ListItem() {
            if (item.roleType == RoleType.me) {
              Column({ space: 5 }) {
                Text(item.name).fontSize(14)
                Row() {
                  Flex({
                    wrap: FlexWrap.WrapReverse,
                    direction: FlexDirection.Row,
                    justifyContent: FlexAlign.Start,
                    alignItems: ItemAlign.Center
                  }) {
                    Image(item.url).width(40).height(40).borderRadius(20)
                    Text().width(5)
                    Text(item.msg).backgroundColor("#0099ff")
                      .padding({
                        left: 10,
                        right: 10,
                        top: 8,
                        bottom: 8
                      }).fontColor(Color.White)
                      .borderRadius(8)
                  }
                }.alignItems(VerticalAlign.Center)
                .justifyContent(FlexAlign.SpaceBetween)
                .width("100%")
              }
              .justifyContent(FlexAlign.End)
              .alignItems(HorizontalAlign.End)
            }
          }

        })
      }.layoutWeight(1).backgroundColor("#f1f1f1")
      .padding(10)
      .scrollBar(BarState.Off)


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
    }.width("100%").height("100%")
  }
}