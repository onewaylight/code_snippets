## Functional Components

- 리액트 타입스크립트의 함수 컴포넌트에서 인자 전달
```ts
import React from 'react';

type CardProps = {
  title: string,
  paragraph: string
}

export const Card = ({ title, paragraph }: CardProps) => {
  <>
    <h2>{ title }</h2>
    <p>
      { paragraph }
    </p>
  <>
}
```