import { BongBongColors, BongBongFontSize, BongBongRadius, BongBongSpacing, GlassCard, SectionHeader } from '@bongbong/basic';
import { CheckInNode } from '../model/HomeModels';

@Component
export struct CheckInVine {
  nodes: CheckInNode[] = [];

  @Builder
  private VineNode(node: CheckInNode) {
    Column({ space: BongBongSpacing.xs }) {
      Text(node.checked ? '✓' : '✦')
        .fontSize(18)
        .fontColor(node.checked ? Color.White : BongBongColors.brand)
        .width(40)
        .height(40)
        .textAlign(TextAlign.Center)
        .borderRadius(20)
        .backgroundColor(node.checked ? BongBongColors.success : BongBongColors.warmLeaf)

      Text(node.label)
        .fontSize(BongBongFontSize.caption)
        .fontColor(node.checked ? BongBongColors.ink : BongBongColors.textWeak)
    }
  }

  build() {
    GlassCard({ paddingValue: BongBongSpacing.lg }) {
      Column({ space: BongBongSpacing.md }) {
        SectionHeader({ title: '连续签到' })

        Row() {
          ForEach(this.nodes, (node: CheckInNode) => {
            this.VineNode(node);
            if (node.label !== this.nodes[this.nodes.length - 1].label) {
              Row()
                .height(4)
                .layoutWeight(1)
                .borderRadius(BongBongRadius.pill)
                .backgroundColor(BongBongColors.vine)
                .margin({ top: 18 })
            }
          }, (node: CheckInNode) => node.label)
        }
        .width('100%')
        .alignItems(VerticalAlign.Top)
      }
    }
  }
}
