<h2 style="color: #fe5">
Git 잠시 저장후 리모트 가져와서 합치기
</h2>
<br>

Staging 영역에 있는 파일의 변경사항을 스택에 저장

```
$ git stash
```
<br>
master에서 pull하거나 git checkout 등 원격 저장소에서 내 로컬 브랜치로 변경사항 저장

```
$ git pull origin master
```
<br>

변경 사항을 적용하고 스택에서 제거
```
$ git stash pop
```

<br>

한번에 실행
```
$ git stash && git pull origin master && git stash pop
```
<br>

<h2 style="color: #fe5">
Local Repository 를 Remote에 연결하기
</h2>

```
$ git init
$ git add .
$ git commit -m "message"
$ git remote add origin https://---@github.com/repository.name.git
$ git push --set-upstream origin master
```

<br>
<h2 style="color: #389">
GitHub 사전지식
</h2>

 <br>
1.  로컬 저장소(local)와 원격 저장소(remote)

```git 저장소는 자신의 컴퓨터인 로컬 저장소와 서버에 있는 원격 저장소로 나뉜다. local에서 작업한 것은 remote로 push해줘야만 변경사항이 서버에 반영된다.``` 

<br>
2. add, commit, push

```자신이 작업한 내용을 remote 저장소에 반영하기 위해서는, 변경사항을 추가하고(add), local에 저장하고(commit), remote에 업로드(push) 해야한다```
 
<br>
3. branch

```여러 개발자들이 공동으로 작업할 수 있게 기본 master branch에서 새로운 가지를 만들어 독립된 공간에서 작업을 수행할 수 있다. 이 때 주기적으로 변경사항을 합치는 것이 필요하다.```  

 
<br>
4. pull

```remote에 있는 내용을 local에 받는 과정이다. 이때 현재 자신의 branch가 어디인지 확인을 잘 하고 pull하도록 한다. 만약 자신의 local에 변경사항이 있다면 pull할 시 에러가 나므로 add, commit을 진행한 후 pull하거나 stash하여 자신의 변경사항을 다른곳에 저장한 후 pull하도록 한다.```

<br>
5. 기본 흐름

```github 공간 만들기(clone, init) => 파일 작성 => 파일의 변경사항 임시저장(add) => local에 저장(commit) => remote에 업데이트(push) => 로컬 업데이트(pull) => add => commit => push ==> pull...(반복)```

 
<br>
6. 로컬 작업 시작 전 무조건 pull

```remote 저장소에 변경된 사항이 있을 수 있기에(여러명이서 작업시) 무조건 파일을 건들기 전에 pull하도록 한다. 안그러면 conflict이 일어나 수동으로 고쳐야한다.```

<br>

<h2 style="color: #3FF;">자주 사용하는 명령어</h2>
 
```$ git clone https://~```

깃허브에서 project를 만든 후 git clone하여 local에도 작업공간을 만든다. 

<br>

```$ git init```

깃허브에서 project를 만들어 clone하지 않고 컴퓨터에서 작업을 먼저 시작했을 때 저장소를 생성한다. 

<br>

```$ git branch```

현재 branch(*표시 되어있는) 및 local branch 확인

<br />

```$ git branch sweetpotato```

sweetpotato branch 만들기

<br />

```$ git branch -d sweetpotato```

sweetpotato branch 삭제

 <br />

```$ git branch -D sweetpotato```

sweetpotato branch 강제 삭제(merge가 되지 않은 branch에 대한 삭제)

<br />

```$ git push origin -d sweetpotato```

remote 서버에 있는 sweetpotato branch 지우기

<br />

```$ git push origin :sweetpotato```

로컬에서 sweetpotato branch 지웠을 때 remote에도 그 변경사항 반영하기

<br />

```$ git checkout sweetpotato```

sweetpotato branch로 이동

<br />

```$ git checkout -b sweetpotato```

sweetpotato branch 만들고 이동

<br>

```$ git status```

현재 상태(add전후, commit 전후 등 확인 가능) 및 브랜치 확인

<br>

```$ git add, git commit, git push, git pull```

순차적으로 실행순서

<br>

```$ git log```

로컬 저장소의 commit history 보기

<br>

```$ git log -n 10```

10개만 보기

<br>

```$ git log --oneline --graph```

log 그래프로 확인

<br>

```$ git checkout -- sweetpotato.py```

변경된 sweetpotato.py 되돌리기

<br>

```$ git rm sweetpotato.py```

sweetpotato.py 로컬, git 저장소 모두에서 삭제

<br>

```$ git rm --cached sweetpotato.py```

sweetpotato.py를 git 저장소에서 삭제 (로컬은 유지) 

<br>

<h2 style="color: yellow;">
Local > Remote : remote에서 merge하기
</h2>

<br>

```$ git checkout -b sweetpotato```

sweetpotato이라는 branch를 만든 후 sweetpotato으로 이동

<br>

```$ git push origin sweetpotato```

remote에 sweetpotato branch 생성

<br>

```$ git branch --set-upstream-to=origin/sweetpotato sweetpotato```

remote와 local branch 연결

<br>

(작업 후)

<br>

```$ git add .```

변경사항 모두( . )임시저장

<br>

```$ git commit -m "메세지 내용"```

commit 하여 local 저장소에 반영

<br>

```$ git push```

remote 저장소에 변경사항 반영-sweetpotato에 반영

<br>

7.홈페이지에서 merge 진행

 

<br> 
<h2 style="color: yellow;">
local ==> remote : local에서 merge하기
</h2>

```$ git checkout -b sweetpotato```

sweetpotato이라는 branch를 만든 후 sweetpotato으로 이동

<br>

(작업 후)

 

```$ git add .```

변경사항 모두( . )임시저장

 

```$ git commit -m "메세지 내용"```

commit 하여 local 저장소에 반영

 

```$ git checkout master```

master branch로 이동


```$ git merge sweetpotato```

sweetpotato branch를 합치려는 target branch 로 이동 후 local에서 target에 sweetpotato branch merge

 

```$ git push```

remote 저장소에 변경사항 반영

<br> 


<h2 style="color: cyan">
remote ==> local
</h2>
 

```$ git branch -a```

local branch 및 remote branch 확인

 

```$ git checkout -b sweetpotato origin/jayoen```

remote의 origin/jayoen branch와 이어지는 local sweetpotato branch 생성

<br>

(작업 후)

<br>

```$ git add .```

변경사항 모두( . ) 임시저장

<br>

```$ git commit -m "메세지 내용"```

commit 하여 local 저장소에 반영

<br>

```$ git push ```

remote 저장소에 반영 -sweetpotato에 반영

<br>

<h2 style="color: yellow;">
그 외
</h2>
 

```$ git stash ```

지금의 상태 임시 저장. commit 해야하는 것이 있어 pull이 안될 때 주로 사용함.

<br>

```$ git stash list```

stash 목록 확인

<br>

```$ git stash apply```
<br>

가장 최근의 stash 가져오기

<br>

```$ git stash apply [stash이름]```
<br>

<h3 style="color: #3f2;">stash 가져오기</h3>

```$ git stash drop```

가장 최근의 stash 삭제

<br>

```$ git stash clear```

모든 stash 삭제
