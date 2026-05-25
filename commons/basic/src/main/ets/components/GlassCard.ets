import { BongBongColors, BongBongOpacity, BongBongRadius, BongBongShadowColor } from '../theme/BongBongTheme';

@Component
export struct GlassCard {
  @BuilderParam content: () => void;
  @Prop radius: number = BongBongRadius.large;
  @Prop paddingValue: number = 16;

  build() {
    Column() {
      this.content();
    }
    .width('100%')
    .padding(this.paddingValue)
    .borderRadius(this.radius)
    .backgroundColor(Color.White)
    .opacity(BongBongOpacity.glass)
    .border({ width: 1, color: BongBongColors.line })
    .shadow({
      radius: 24,
      color: BongBongShadowColor.brandCard,
      offsetX: 0,
      offsetY: 8
    })
  }
}
