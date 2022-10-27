import { WebPlugin } from '@capacitor/core';

import type { PermissionsCheckerPlugin } from './definitions';

export class PermissionsCheckerWeb
  extends WebPlugin
  implements PermissionsCheckerPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
