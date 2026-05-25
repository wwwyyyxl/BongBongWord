import {
  BongBongColors,
  BongBongFontSize,
  BongBongRadius,
  BongBongShadowColor,
  BongBongSpacing,
  SectionHeader
} from '@bongbong/basic';
import { WordBookItem } from '../model/HomeModels';

@Component
export struct WordBookCarousel {
  books: WordBookItem[] = [];

  @Builder
  private BookCard(book: WordBookItem) {
    Column() {
      Text(book.badgeText)
        .fontSize(BongBongFontSize.caption)
        .fontWeight(FontWeight.Bold)
        .fontColor(BongBongColors.brand)
        .padding({ left: BongBongSpacing.xs, right: BongBongSpacing.xs, top: 3, bottom: 3 })
        .borderRadius(BongBongRadius.pill)
        .backgroundColor(BongBongColors.warmChip)
        .alignSelf(ItemAlign.Start)

      Blank()

      Text(book.title)
        .fontSize(BongBongFontSize.subtitle)
        .fontWeight(FontWeight.Bold)
        .fontColor(BongBongColors.ink)
        .maxLines(2)

      Text(book.progressText)
        .fontSize(BongBongFontSize.caption)
        .fontColor(BongBongColors.textWeak)
        .margin({ top: BongBongSpacing.xs })

      Text('Lexi')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(BongBongColors.whiteText)
        .width(64)
        .height(34)
        .textAlign(TextAlign.Center)
        .borderRadius(BongBongRadius.pill)
        .backgroundColor('#33FFFFFF')
        .margin({ top: BongBongSpacing.md })
    }
    .width(142)
    .height(190)
    .padding(BongBongSpacing.md)
    .borderRadius(BongBongRadius.large)
    .backgroundColor(book.accentColor)
    .shadow({ radius: 18, color: BongBongShadowColor.card, offsetX: 0, offsetY: 8 })
  }

  build() {
    Column({ space: BongBongSpacing.md }) {
      SectionHeader({ title: '我的词书', actionText: '全部词书 >' })

      Scroll() {
        Row({ space: BongBongSpacing.md }) {
          ForEach(this.books, (book: WordBookItem) => {
            this.BookCard(book);
          }, (book: WordBookItem) => book.title)
        }
        .padding({ right: BongBongSpacing.xl })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
    }
    .width('100%')
  }
}
