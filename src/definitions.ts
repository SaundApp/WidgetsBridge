export interface WidgetsBridgePlugin {
  setItem(options: { key: string; group: string; value: string }): Promise<void>;
  reloadTimeline(options: { kind: string }): Promise<void>;
  reloadAllTimelines(): Promise<void>;
}
