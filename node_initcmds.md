```bash
> npm install -g typescript
```

```bash
> tsc --target es6 --outDir js app.ts
```
<br>

> Monit changing source file in VSCode
```bash
> tsc --target es6 --outDir js --watch app.ts
```

> tsconfig.json
```json
{
  "compilerOptions": {
    "target": "es6",
    "outDir": "js",
    "watch": true
  }
}
```

```json
{
  "compilerOptions": {
    "module": "commonjs",
    "esModuleInterop": true,
    "target": "es5",
    "moduleResolution": "node",
    "outDir": "dist",
    "baseUrl": ".",
    "sourceMap": true,
    "downlevelIteration": true,
    "noImplicitAny": false,
    "paths": {"*": ["node_modules/*"]}
  },
  "include": ["src/**/*", "src/index.ts"]
}
```
<br>

> package.json
```json
"main": "src/index.js",
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "build": "tsc && node dist",
    "dev": "ts-node src"
}
```

<br>

> compile and run 
```bash
> npm i -D typescript ts-node
```

> for prettier
```bash
> npm i -D @types/node
```

### References
> tsconfig.json

https://www.typescriptlang.org/docs/handbook/tsconfig-json.html

> TypeScript in Visual Studio Code

https://code.visualstudio.com/Docs/languages/typescript

> TypeScript Introduction

https://poiemaweb.com/typescript-introduction