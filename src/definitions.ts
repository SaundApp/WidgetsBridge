export interface WidgetsBridgePlugin {
  setItem(options: { key: string; group: string; value: string }): Promise<void>;
  reloadTimeline(options: { kind: string; javaClass?: string }): Promise<void>;
  reloadAllTimelines(options: { javaClass?: string }): Promise<void>;
}
