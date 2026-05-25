import {
  BongBongColors,
  BongBongFontSize,
  BongBongRadius,
  BongBongShadowColor,
  BongBongSpacing,
  EnergyProgress
} from '@bongbong/basic';

@Component
export struct HomeEnergyCard {
  @Prop value: number = 0;
  @Prop total: number = 100;

  build() {
    Row({ space: BongBongSpacing.md }) {
      Text('⚡')
        .fontSize(22)
        .width(44)
        .height(44)
        .textAlign(TextAlign.Center)
        .borderRadius(22)
        .backgroundColor(BongBongColors.warmIcon)

      Column({ space: BongBongSpacing.xs }) {
        Row() {
          Text('元气能量')
            .fontSize(BongBongFontSize.subtitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(BongBongColors.ink)

          Blank()

          Text(`${this.value} / ${this.total}`)
            .fontSize(BongBongFontSize.subtitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(BongBongColors.brand)
        }
        .width('100%')

        EnergyProgress({ value: this.value, total: this.total })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(BongBongSpacing.md)
    .borderRadius(BongBongRadius.pill)
    .backgroundColor(Color.White)
    .shadow({ radius: 20, color: BongBongShadowColor.brandSoft, offsetX: 0, offsetY: 8 })
  }
}
