import { HOME_DASHBOARD_STATE } from '../constants/HomeMockData';
import { HomeDashboardState } from '../model/HomeModels';

export class HomeViewModel {
  getState(): HomeDashboardState {
    return HOME_DASHBOARD_STATE;
  }
}

