import { lazy } from "react";

export function lazyLoad(path, namedExport) {
  return lazy(() => {
    //const promise = wait(1000).then(() => import(path))
    const promise = import(path)
    if ( namedExport == null) {
      return promise;
    } else {
      return promise.then(module => ({ default: module[namedExport] }))
    }
  })
}

lazyLoad("./components/About", "About")