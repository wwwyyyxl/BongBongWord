import { BongBongColors } from '@bongbong/basic';
import { CheckInNode, HomeDashboardState, HomeTaskItem, WordBookItem } from '../model/HomeModels';

export const HOME_DASHBOARD_STATE: HomeDashboardState = new HomeDashboardState(
  '蹦蹦你好',
  '今天也要元气满满哦！',
  80,
  100,
  3,
  5,
  [
    new HomeTaskItem('新词学习', '学习 15 个新词', '完成', true),
    new HomeTaskItem('复习巩固', '复习 20 个单词', '完成', true),
    new HomeTaskItem('趣味练习', '完成 3 组练习', '1/3', false)
  ],
  [
    new WordBookItem('四级核心词汇', '已学 256/500', BongBongColors.brand, '正在学'),
    new WordBookItem('高频词汇', '已学 128/300', BongBongColors.mint, '推荐'),
    new WordBookItem('日常英语', '已学 86/200', BongBongColors.bookYellow, '轻松'),
    new WordBookItem('考研词汇', '已学 64/800', BongBongColors.bookPurple, '进阶')
  ],
  [
    new CheckInNode('1天', true),
    new CheckInNode('3天', true),
    new CheckInNode('7天', true),
    new CheckInNode('14天', true),
    new CheckInNode('21天', true),
    new CheckInNode('30天', false)
  ]
);
