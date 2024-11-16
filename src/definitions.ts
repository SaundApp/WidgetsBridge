export interface WidgetsBridgePlugin {
  setItem(options: { key: string; group: string; value: string }): Promise<void>;
  reloadTimeline(options: { kind: string; javaName?: string }): Promise<void>;
  reloadAllTimelines(options: { javaNames?: string[] }): Promise<void>;
}
