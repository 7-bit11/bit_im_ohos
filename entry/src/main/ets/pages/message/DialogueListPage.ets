import Dialogue, { MessageType, RoleType } from '../../entity/Dialogue';
import router from '@ohos.router';

@Entry
@Component
struct DialogueListPage {
  @State name: string = "";
  params: object  = router.getParams();
  aboutToAppear(): void {
    this.name = this.params['name'];
  }

  dialogueList: Array<Dialogue> = [
    new Dialogue(MessageType.text, '你在学什么啊',
      'https://p3-passport.byteacctimg.com/img/user-avatar/314da9adcd6dacacb8ea4a18c89639ea~140x140.awebp',
      RoleType.you)
  ];

  build() {
    Column(){
      Row(){
        Image($rawfile("Chevron_Left.svg")).width(24).height(24).fillColor(Color.Black)
        Text(this.name).fontSize(18)

      }
    }.width("100%").height("100%")
  }
}