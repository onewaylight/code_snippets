### Demo Data
```js
var stringData = `[{"factor_desc":"타워크레인을 이용하여 자재를 인양하는 과정에서 체결이 풀려 자재낙하","freq":3,"str":3,"industry_factor_id":1,"industry_id":1},{"factor_desc":"타워크레인을 이용하여 자재를 인양하는 과정에서 구조물 또는 인력과 자재충돌","freq":1,"str":3,"industry_factor_id":2,"industry_id":1},{"factor_desc":"타워크레인 마스트 상승작업시 마스트가 대차레일에서 이탈되면서 추락","freq":1,"str":3,"industry_factor_id":3,"industry_id":1},{"factor_desc":"기초앙카볼트의 시공 불량으로 타워크레인 붕괴","freq":1,"str":3,"industry_factor_id":4,"industry_id":1},{"factor_desc":"메인지브와 균형추의 불균형에 의한 타워크레인 전도","freq":1,"str":3,"industry_factor_id":5,"industry_id":1},{"factor_desc":"마스트의 고정핀을 미체결하고 중량물 운반 작업으로 타워크레인 붕괴","freq":1,"str":3,"industry_factor_id":6,"industry_id":1},{"factor_desc":"돌풍에 의한 타워크레인 붕괴","freq":1,"str":3,"industry_factor_id":7,"industry_id":1}]`;
```

## In Javascript
```js
    const data = JSON.pare(stringData);

    data.map((elm) => {
        console.log(elm["factor_desc"]);
    })
```

## In Typescript
```ts
    interface IRA_Factor {
        factor_desc: string;
        freq: string;
        ra_factor_id: string;
        ra_id: string;
        str: string;
    }

    const object = JSON.parse(stringData);
    object.map((elm: IRA_Factor) => {
        console.log(elm.factor_desc);
    })
```

한글 스트링을 서브 컴포넌트에 파라미터로 넘길때 정상적으로 동작하지 않는 경우가 있다.
정상적으로 동작하다가도 동작하지 않는 경우가 ehsFrontSweetPotato에서 발생함.

한글은 encoding 시켜서 호출할 때 문제가 사라짐.

```js
    decodeURI(encodedString);

    encodeURI(stringData);
```

MUI Code 소스 정리하는 과정에서 과도한 한라인으로의 변환을 에러를 초래할 수 있다.
정확한 동작확인을 해가면서 할 필요가 있어 보인다.
다시 검증하고 싶은 마음은......


```ts
location은
const location = useLocation();

params는
interface MatchProps {
    username: 'Hotel' | 'gildong';
}
const {username} = useParams();
```


```js
import { useSearchParams } from 'react-router-dom';

const [searchParams] = useSearchParams();
const detail = searchParams.get('detail') === 'true';
```

```js
function getAsUriParameters(data) {
   var url = '';
   for (var prop in data) {
      url += encodeURIComponent(prop) + '=' + 
          encodeURIComponent(data[prop]) + '&';
   }
   return url.substring(0, url.length - 1)
}
```

```js
const urlfy = obj => Object
    .keys(obj)
    .map(k => encodeURIComponent(k) + '=' + encodeURIComponent(obj[k]))
    .join('&');
```

```js
const myParams = {'foo': 'hi there', 'bar': '???'};

const u = new URLSearchParams(myParams).toString();

console.log(u);
```