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

* [`echo(...)`](#echo)
* [`query(...)`](#query)
* [`requestPermission(...)`](#requestpermission)
* [`checkPermission(...)`](#checkpermission)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### query(...)

```typescript
query(options: { permission: string; }) => Promise<{ status: string; }>
```

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ permission: string; }</code> |

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


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

</docgen-api>
