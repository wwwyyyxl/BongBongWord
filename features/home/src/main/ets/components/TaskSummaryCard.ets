import { BongBongColors, BongBongFontSize, BongBongRadius, BongBongSpacing, EnergyProgress, GlassCard, SectionHeader } from '@bongbong/basic';
import { HomeTaskItem } from '../model/HomeModels';

@Component
export struct TaskSummaryCard {
  @Prop finished: number = 0;
  @Prop total: number = 0;
  tasks: HomeTaskItem[] = [];

  @Builder
  private TaskRow(item: HomeTaskItem) {
    Row({ space: BongBongSpacing.sm }) {
      Text(item.done ? '✓' : '•')
        .fontSize(BongBongFontSize.body)
        .fontColor(item.done ? Color.White : BongBongColors.brand)
        .width(28)
        .height(28)
        .textAlign(TextAlign.Center)
        .borderRadius(14)
        .backgroundColor(item.done ? BongBongColors.success : BongBongColors.warmSelected)

      Column({ space: BongBongSpacing.xxs }) {
        Text(item.title)
          .fontSize(BongBongFontSize.body)
          .fontWeight(FontWeight.Bold)
          .fontColor(BongBongColors.ink)

        Text(item.subtitle)
          .fontSize(BongBongFontSize.caption)
          .fontColor(BongBongColors.textWeak)
      }
      .layoutWeight(1)

      Text(item.progressText)
        .fontSize(BongBongFontSize.body)
        .fontWeight(FontWeight.Medium)
        .fontColor(item.done ? BongBongColors.success : BongBongColors.brand)
    }
    .width('100%')
  }

  build() {
    GlassCard({ paddingValue: BongBongSpacing.lg }) {
      Column({ space: BongBongSpacing.lg }) {
        SectionHeader({ title: '今日任务', actionText: '>' })

        Row({ space: BongBongSpacing.lg }) {
          Stack({ alignContent: Alignment.Center }) {
            Progress({
              value: this.finished,
              total: this.total,
              type: ProgressType.Ring
            })
              .width(112)
              .height(112)
              .color(BongBongColors.brand)
              .backgroundColor(BongBongColors.taskRingTrack)

            Column({ space: BongBongSpacing.xxs }) {
              Text(`${this.finished}/${this.total}`)
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .fontColor(BongBongColors.ink)

              Text('已完成')
                .fontSize(BongBongFontSize.caption)
                .fontColor(BongBongColors.textWeak)
            }
          }
          .width(116)
          .height(116)

          Column({ space: BongBongSpacing.md }) {
            ForEach(this.tasks, (item: HomeTaskItem) => {
              this.TaskRow(item);
            }, (item: HomeTaskItem) => item.title)
          }
          .layoutWeight(1)
        }

        EnergyProgress({ value: this.finished, total: this.total, heightValue: 8 })
      }
    }
  }
}
