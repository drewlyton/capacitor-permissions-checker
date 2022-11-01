export interface PermissionsCheckerPlugin {
  requestPermission(options: {
    permission: string;
  }): Promise<{ status: string }>;
  checkPermission(options: { permission: string }): Promise<{ status: string }>;
  openSettings(): null;
}
