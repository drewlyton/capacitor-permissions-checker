export interface PermissionsCheckerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
