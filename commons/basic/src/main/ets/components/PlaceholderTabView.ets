import {
  BongBongColors,
  BongBongFontSize,
  BongBongRadius,
  BongBongSpacing
} from '../theme/BongBongTheme';

@Component
export struct PlaceholderTabView {
  @Prop title: string = '';
  @Prop description: string = '正在搭建中';
  @Prop icon: string = '✦';

  build() {
    Column({ space: BongBongSpacing.md }) {
      Text(this.icon)
        .fontSize(42)

      Text(this.title)
        .fontSize(BongBongFontSize.pageTitle)
        .fontWeight(FontWeight.Bold)
        .fontColor(BongBongColors.ink)

      Text(this.description)
        .fontSize(BongBongFontSize.subtitle)
        .fontColor(BongBongColors.textWeak)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(BongBongSpacing.xl)
    .backgroundColor(BongBongColors.cream)
    .borderRadius(BongBongRadius.large)
  }
}

