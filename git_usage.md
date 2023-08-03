## branch 새로 만들기

1. ```git branch 브랜치이름```
    > 브랜치 생성

2. ```git checkout 브랜치이름```
    > 브랜치 전환

3. ```git push origin 브랜치이름```
    > 원격 저장소에 반영하기

4. ```1, 2 를 동시에 진행```
    
    ```git checkout -b 브랜치이름```

<br>

----
<br>

- Team Member 로서 사용하는 Git
- 클론을 한 후 로컬로 처리한 후 원리포지토리에 PR하는 법

Pull Request - 내가 작업한 내용을 가져가 주세요 요청

<br>

git remote url 변경 전
```bash
$ git remote -v 
origin  https://github.com/tj/commander.js.git (fetch) 
origin  https://github.com/tj/commander.js.git (push)
```

git remote push url 변경

```bash
$git remote set-url --push origin <원격지 저장소 주소>

$git remote set-url --push origin https://github.com/shelljs/shelljs.git
```
 

결과

```bash
$ git remote -v
origin  https://github.com/tj/commander.js.git (fetch)
origin  https://github.com/shelljs/shelljs.git (push)
```

git remote push, fetch url 변경

```bash
$git remote set-url origin <원격지 저장소 주소>

$git remote set-url origin https://github.com/shelljs/shelljs.git
```
 

```결과```

```
$ git remote -v
origin  https://github.com/shelljs/shelljs.git (fetch)
origin  https://github.com/shelljs/shelljs.git (push)
```

### Github Private Repository Access with PAT
```
Settings > Developer settings > Personal access tokens > Generate new token
```

> git clone https://__[PAT]__@github.com/onewaylight/__[myrepository]__.git
