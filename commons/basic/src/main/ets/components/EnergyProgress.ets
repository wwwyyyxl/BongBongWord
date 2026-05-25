import { BongBongColors, BongBongRadius } from '../theme/BongBongTheme';

@Component
export struct EnergyProgress {
  @Prop value: number = 0;
  @Prop total: number = 100;
  @Prop heightValue: number = 12;

  private getPercent(): number {
    if (this.total <= 0) {
      return 0;
    }
    const percent: number = this.value / this.total;
    if (percent < 0) {
      return 0;
    }
    if (percent > 1) {
      return 1;
    }
    return percent;
  }

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Row()
        .width('100%')
        .height(this.heightValue)
        .borderRadius(BongBongRadius.pill)
        .backgroundColor(BongBongColors.energyTrack)

      Row()
        .width(`${this.getPercent() * 100}%`)
        .height(this.heightValue)
        .borderRadius(BongBongRadius.pill)
        .linearGradient({
          angle: 90,
          colors: [[BongBongColors.brand, 0], [BongBongColors.energyLight, 1]]
        })
    }
    .width('100%')
    .height(this.heightValue)
  }
}
