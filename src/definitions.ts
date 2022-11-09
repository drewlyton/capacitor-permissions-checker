export interface PermissionsCheckerPlugin {
  requestPermission(options: {
    permission: string;
  }): Promise<{ 'local-network': string }>;
  checkPermission(options: { permission: string }): Promise<{ 'local-network': string }>;
  openSettings(): Promise<{ success: string }>;
}
