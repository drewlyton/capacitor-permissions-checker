import { WebPlugin } from '@capacitor/core';

import type { PermissionsCheckerPlugin } from './definitions';

export class PermissionsCheckerWeb
  extends WebPlugin
  implements PermissionsCheckerPlugin
{
  async checkPermission(options: { permission: string }): Promise<{ status: string }> {
    const navigator = window.navigator;

    if (!navigator.permissions)
      throw Promise.reject('This browser does not support the Permissions API');

    const status = await navigator.permissions.query({
      name: options.permission as PermissionName,
    });

    return { status: status.state };
  }

  async requestPermission(options: { permission: string }): Promise<{ status: string }> {
    const navigator = window.navigator;

    if (!navigator.permissions)
      throw Promise.reject('This browser does not support the Permissions API');

    const status = await navigator.permissions.query({
      name: options.permission as PermissionName,
    });

    return { status: status.state };
  }

  async openSettings(options: { permission: string }): Promise<{ status: string }> {
    const navigator = window.navigator;

    if (!navigator.permissions)
      throw Promise.reject('This browser does not support the settings API');

    const status = await navigator.permissions.query({
      name: options.permission as PermissionName,
    });

    return { status: status.state };
  }
}
