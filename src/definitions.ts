export interface PermissionsCheckerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  query(options: { permission: string }): Promise<{ status: string }>;
}
