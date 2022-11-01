# permission-checker

Check any permission on iOS or Android

## Install

```bash
npm install permission-checker
npx cap sync
```

## Development

```bash 
npm install
npm run build

cd example 
npm run build
npm install 
npx cap sync
```

## API

<docgen-index>

* [`requestPermission(...)`](#requestpermission)
* [`checkPermission(...)`](#checkpermission)
* [`openSettings()`](#opensettings)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### requestPermission(...)

```typescript
requestPermission(options: { permission: string; }) => Promise<{ status: string; }>
```

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ permission: string; }</code> |

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### checkPermission(...)

```typescript
checkPermission(options: { permission: string; }) => Promise<{ status: string; }>
```

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ permission: string; }</code> |

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### openSettings()

```typescript
openSettings() => Promise<{ success: string; }>
```

**Returns:** <code>Promise&lt;{ success: string; }&gt;</code>

--------------------

</docgen-api>
