import { registerPlugin } from '@capacitor/core';

import type { PermissionsCheckerPlugin } from './definitions';

const PermissionsChecker = registerPlugin<PermissionsCheckerPlugin>(
  'PermissionsChecker',
  {
    web: () => import('./web').then(m => new m.PermissionsCheckerWeb()),
  },
);

export * from './definitions';
export { PermissionsChecker };
