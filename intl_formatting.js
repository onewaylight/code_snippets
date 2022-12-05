/*
  Expression of 
**/
const views = 9744642;

const formatter = new Intl.NumberFormat('en', { 
  notation: 'compact'
});

formatter.format(views);

const formatter = new Intl.NumberFormat('en', { 
  notation: 'compact',
  compactDisplay: 'long',
});


const formatter = new Intl.NumberFormat(navigator.language, { 
  notation: 'compact',
  compactDisplay: 'long',
});


const price = 10000;

const formatter = new Intl.NumberFormat('ko', { 
  style: 'currency',
  currency: 'krw',
  notation: 'compact',
});

formatter.format(price);

const formatter = new Intl.NumberFormat('en-US', { 
  style: 'currency',
  currency: 'usd',
  notation: 'compact'
});


const formatter = new Intl.RelativeTimeFormat('en');

const formatter = new Intl.RelativeTimeFormat('en', { numeric: 'auto' });

formatter.format(  1, 'day');
formatter.format(  2, 'day');
formatter.format( -1, 'day');
formatter.format( -2, 'day');

const formatter = new Intl.RelativeTimeFormat('ko', { numeric: 'auto' });
const today = new Date();
const started = new Date(2019, 10, 12);
const dayPassed = Math.ceil((started - today) / (1000 * 60 * 60 * 24));
console.log (`Date of Start : ${formatter.format(dayPassed, 'day')}`);

* moment.js

* timeago.js


const date = new Date ( 2019, 10, 12);
date.toString();

new Intl.DateTimeFormat('en-US').format(date);

new Intl.DateTimeFormat('ko').format(date);
new Intl.DateTimeFormat('de').format(date);
new Intl.DateTimeFormat('zh').format(date);


date.toLocaleDateString('ko', {
  dateStyle: 'full',
  timeStyle: 'long'
});

date.toLocaleDateString('ko', {
  minute: 'numeric',
  hour: 'numeric',
  day: 'numeric',
  month: 'short',
  year: 'numeric',
  weekday: 'short'
});


// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl
