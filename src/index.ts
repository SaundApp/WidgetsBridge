import { registerPlugin } from '@capacitor/core';

import type { WidgetsBridgePlugin } from './definitions';

const WidgetsBridge = registerPlugin<WidgetsBridgePlugin>('WidgetsBridge');

export * from './definitions';
export { WidgetsBridge };
