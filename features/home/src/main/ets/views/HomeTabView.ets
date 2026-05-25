import {
  BongBongColors,
  BongBongFontSize,
  BongBongRadius,
  BongBongShadowColor,
  BongBongSpacing
} from '@bongbong/basic';
import { HomeEnergyCard } from '../components/HomeEnergyCard';
import { TaskSummaryCard } from '../components/TaskSummaryCard';
import { WordBookCarousel } from '../components/WordBookCarousel';
import { CheckInVine } from '../components/CheckInVine';
import { HomeMedia } from '../constants/HomeMedia';
import { HomeDashboardState } from '../model/HomeModels';
import { HomeViewModel } from '../viewmodel/HomeViewModel';

@Component
export struct HomeTabView {
  private viewModel: HomeViewModel = new HomeViewModel();
  private state: HomeDashboardState = this.viewModel.getState();

  build() {
    Stack() {
      Column()
        .width('100%')
        .height(300)
        .linearGradient({
          angle: 180,
          colors: [[BongBongColors.brand, 0], [BongBongColors.energyTrack, 0.58], [BongBongColors.cream, 1]]
        })
        .align(Alignment.Top)

      Scroll() {
        Column({ space: BongBongSpacing.xl }) {
          Row() {
            Column({ space: BongBongSpacing.xs }) {
              Text(this.state.greeting)
                .fontSize(BongBongFontSize.pageTitle)
                .fontWeight(FontWeight.Bold)
                .fontColor(BongBongColors.ink)

              Text(this.state.slogan)
                .fontSize(BongBongFontSize.subtitle)
                .fontColor(BongBongColors.ink)
            }

            Blank()

            Text('✉')
              .fontSize(22)
              .fontColor(BongBongColors.ink)
              .width(52)
              .height(52)
              .textAlign(TextAlign.Center)
              .borderRadius(BongBongRadius.medium)
              .backgroundColor(Color.White)
              .shadow({ radius: 14, color: BongBongShadowColor.neutral, offsetX: 0, offsetY: 6 })
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
          .margin({ top: BongBongSpacing.xl })

          Image(HomeMedia.lexiHome)
            .width('100%')
            .height(210)
            .objectFit(ImageFit.Contain)
            .borderRadius(BongBongRadius.large)

          HomeEnergyCard({ value: this.state.energy, total: this.state.energyTotal })
            .margin({ top: -BongBongSpacing.md })

          TaskSummaryCard({
            finished: this.state.taskFinished,
            total: this.state.taskTotal,
            tasks: this.state.tasks
          })

          WordBookCarousel({ books: this.state.wordBooks })

          CheckInVine({ nodes: this.state.checkInNodes })
            .margin({ bottom: 108 })
        }
        .width('100%')
        .padding({ left: BongBongSpacing.xl, right: BongBongSpacing.xl })
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(BongBongColors.cream)
  }
}
