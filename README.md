# @saundapp/widgetsbridge

Sync data between capacitor and native code to run widgets

## Install

```bash
npm install @saundapp/widgetsbridge
npx cap sync
```

## API

<docgen-index>

* [`setItem(...)`](#setitem)
* [`reloadTimeline(...)`](#reloadtimeline)
* [`reloadAllTimelines(...)`](#reloadalltimelines)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### setItem(...)

```typescript
setItem(options: { key: string; group: string; value: string; }) => Promise<void>
```

| Param         | Type                                                        |
| ------------- | ----------------------------------------------------------- |
| **`options`** | <code>{ key: string; group: string; value: string; }</code> |

--------------------


### reloadTimeline(...)

```typescript
reloadTimeline(options: { kind: string; javaClass?: string; }) => Promise<void>
```

| Param         | Type                                               |
| ------------- | -------------------------------------------------- |
| **`options`** | <code>{ kind: string; javaClass?: string; }</code> |

--------------------


### reloadAllTimelines(...)

```typescript
reloadAllTimelines(options: { javaClass?: string; }) => Promise<void>
```

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ javaClass?: string; }</code> |

--------------------

</docgen-api>
