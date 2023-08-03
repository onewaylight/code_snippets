> Check User information
```shell
$ git config user.name

$ git config user.email
```

```bash
$ git config --global username "Your name"
$ git config --global email you@example.com
```

> Delete User information
```bash

$ git config --global --unset user.name
$ git cofnig --global --unset user.email
```

```shell
$ git config --unset user.name
$ git config --unset user.email
```


----
```
```

> github 에 repository 에 생성!

```Settings → Developer settings → Personal access tokens → Generate new token```

> Personal access token => 
```___pta___```


```bash
$ git clone https://___pta___@github.com/SPESYS/workstatusman.git
```
```bash
git status
git add .
git commit -m "First commit"
git push origin main
```

```
git clone https://___pta___@github.com/<your account or organization>/<repo>.git
```

```bash
$ git remote -v

origin  https://___pta___@github.com/SPESYS/workstatusman.git (fetch)
origin  https://___pta___@github.com/SPESYS/workstatusman.git (push)
```
```bash
$ git pull    # be up to date 
$ git checkout -b test0808
$ git push origin test0808
$ git branch -a
$ git remote add test0808 test0808
$ git push test0808
```

----
```
```
# How To Switch Branch on Git #
> list existing branches
```bash
$ git branch

$ git branch -a
```
```bash
$ git checkout <existing_branch>

$ git checkout -b <new_branch>
```

```bash
$ git switch feature

$ git switch -c non-existing-branch
```

> delete branch
```
$ git branch -d <branch_name>
```

```
```
----

```
```

⏩ ```When you do a pull request on a branch, you can continue to work on another branch and make another pull request on this other branch. <strong>Before creating a new branch, pull the changes from upstream. Your master needs to be up to date.</strong>```

```bash
$ git pull
```
⏩ ```Create the branch on your local machine and switch in this branch :```

```bash
$ git checkout -b [name_of_your_new_branch]
```

⏩ ```Push the branch on github :```
```
$ git push origin [name_of_your_new_branch]
```

### ⏩ When you want to commit something in your branch, be sure to be in your branch. Add -u parameter to set-upstream.

<br>

🎦 ```You can see all the branches created by using :```

```bash
$ git branch -a
```

⏩ ```Which will show :```

```
* approval_messages
  master
  master_clean
```
⏩ ```Add a new remote for your branch :```

```bash
$ git remote add [name_of_your_remote] [name_of_your_new_branch]
```

⏩ ```Push changes from your commit into your branch :```

```
$ git push [name_of_your_new_remote] [url]
```

⏩ ```Update your branch when the original branch from official repository has been updated :```

```
$ git fetch [name_of_your_remote]
```

⏩ ```Then you need to apply to merge changes if your branch is derivated from develop you need to do :```
```
$ git merge [name_of_your_remote]/develop
```

⏩ ```Delete a branch on your local filesystem :```
```
$ git branch -d [name_of_your_new_branch]
```

⏩ ```To force the deletion of local branch on your filesystem :```

```
$ git branch -D [name_of_your_new_branch]
```

⏩ ```Delete the branch on github :```
```
$ git push origin :[name_of_your_new_branch]
```

<h3 align="center">⚡ Create a new branch with git and manage branches<a href="https://github.com/Kunena/Kunena-Forum/wiki/Create-a-new-branch-with-git-and-manage-branches"> Click Here</a></h3>
