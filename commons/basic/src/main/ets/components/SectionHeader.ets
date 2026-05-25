import { BongBongColors, BongBongFontSize, BongBongSpacing } from '../theme/BongBongTheme';

@Component
export struct SectionHeader {
  @Prop title: string = '';
  @Prop actionText: string = '';

  build() {
    Row() {
      Row()
        .width(8)
        .height(8)
        .borderRadius(4)
        .backgroundColor(BongBongColors.brand)
        .margin({ right: BongBongSpacing.sm })

      Text(this.title)
        .fontSize(BongBongFontSize.title)
        .fontWeight(FontWeight.Bold)
        .fontColor(BongBongColors.ink)

      Blank()

      if (this.actionText.length > 0) {
        Text(this.actionText)
          .fontSize(BongBongFontSize.body)
          .fontColor(BongBongColors.textWeak)
      }
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }
}

