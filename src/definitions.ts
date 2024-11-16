export interface WidgetsBridgePlugin {
  setItem(options: { key: string; group: string; value: string }): Promise<void>;
  reloadTimeline(options: { kind: string; javaName?: string }): Promise<void>;
  reloadAllTimelines(options: { javaName?: string }): Promise<void>;
}
