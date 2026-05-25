import { BongBongColors, PlaceholderTabView } from '@bongbong/basic';
import { HomeTabView } from '@bongbong/home';

class TabItem {
  readonly title: string;
  readonly icon: string;

  constructor(title: string, icon: string) {
    this.title = title;
    this.icon = icon;
  }
}

const MAIN_TABS: TabItem[] = [
  new TabItem('首页', '⌂'),
  new TabItem('练习', '✎'),
  new TabItem('蹦蹦星球', '◉'),
  new TabItem('我的', '●')
];

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder
  private TabBarBuilder(item: TabItem, index: number) {
    Column({ space: 2 }) {
      Text(item.icon)
        .fontSize(22)
        .fontColor(this.currentTabIndex === index ? BongBongColors.brand : BongBongColors.muted)

      Text(item.title)
        .fontSize(12)
        .fontWeight(this.currentTabIndex === index ? FontWeight.Bold : FontWeight.Regular)
        .fontColor(this.currentTabIndex === index ? BongBongColors.brand : BongBongColors.textWeak)
    }
    .width('100%')
    .height(64)
    .justifyContent(FlexAlign.Center)
    .borderRadius(24)
    .backgroundColor(this.currentTabIndex === index ? BongBongColors.brandSoft : BongBongColors.transparent)
  }

  build() {
    Column() {
      Tabs({
        index: this.currentTabIndex,
        controller: this.controller,
        barPosition: BarPosition.End
      }) {
        TabContent() {
          HomeTabView();
        }
        .tabBar(this.TabBarBuilder(MAIN_TABS[0], 0))

        TabContent() {
          PlaceholderTabView({
            title: '词战擂台',
            description: '练习模块将承接单词题卡、听音和 Combo 反馈',
            icon: '✎'
          });
        }
        .tabBar(this.TabBarBuilder(MAIN_TABS[1], 1))

        TabContent() {
          PlaceholderTabView({
            title: '蹦蹦星球',
            description: '词灵岛模块将承接 Lexi 成长、喂食和派遣',
            icon: '◉'
          });
        }
        .tabBar(this.TabBarBuilder(MAIN_TABS[2], 2))

        TabContent() {
          PlaceholderTabView({
            title: '能量基地',
            description: '我的模块将承接学习数据、成就墙和技能树',
            icon: '●'
          });
        }
        .tabBar(this.TabBarBuilder(MAIN_TABS[3], 3))
      }
      .width('100%')
      .height('100%')
      .barHeight(86)
      .barMode(BarMode.Fixed)
      .animationDuration(180)
      .scrollable(false)
      .backgroundColor(BongBongColors.cream)
      .onChange((index: number) => {
        this.currentTabIndex = index;
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(BongBongColors.cream)
  }
}
