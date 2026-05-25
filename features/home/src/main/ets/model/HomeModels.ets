export class HomeTaskItem {
  readonly title: string;
  readonly subtitle: string;
  readonly progressText: string;
  readonly done: boolean;

  constructor(title: string, subtitle: string, progressText: string, done: boolean) {
    this.title = title;
    this.subtitle = subtitle;
    this.progressText = progressText;
    this.done = done;
  }
}

export class WordBookItem {
  readonly title: string;
  readonly progressText: string;
  readonly accentColor: string;
  readonly badgeText: string;

  constructor(title: string, progressText: string, accentColor: string, badgeText: string) {
    this.title = title;
    this.progressText = progressText;
    this.accentColor = accentColor;
    this.badgeText = badgeText;
  }
}

export class CheckInNode {
  readonly label: string;
  readonly checked: boolean;

  constructor(label: string, checked: boolean) {
    this.label = label;
    this.checked = checked;
  }
}

export class HomeDashboardState {
  readonly greeting: string;
  readonly slogan: string;
  readonly energy: number;
  readonly energyTotal: number;
  readonly taskFinished: number;
  readonly taskTotal: number;
  readonly tasks: HomeTaskItem[];
  readonly wordBooks: WordBookItem[];
  readonly checkInNodes: CheckInNode[];

  constructor(
    greeting: string,
    slogan: string,
    energy: number,
    energyTotal: number,
    taskFinished: number,
    taskTotal: number,
    tasks: HomeTaskItem[],
    wordBooks: WordBookItem[],
    checkInNodes: CheckInNode[]
  ) {
    this.greeting = greeting;
    this.slogan = slogan;
    this.energy = energy;
    this.energyTotal = energyTotal;
    this.taskFinished = taskFinished;
    this.taskTotal = taskTotal;
    this.tasks = tasks;
    this.wordBooks = wordBooks;
    this.checkInNodes = checkInNodes;
  }
}

