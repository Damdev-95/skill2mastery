# Git Fundamentals

Git is a free and open-source version control system
Version controlis the practice of tracking and managing changes to software code. Version control systems are software tools that help software teams manage changes to source code over time.
Source code management (SCM) is used to track modifications to a source code repository.
Install Git using https://git-scm.com/downloads

After confirm version using `git --version`

Use the following commands to configure yur details on git, this will be associated to your git history
```
git config --global user.name "suliaman olubiyi"
git config --global user.email "scontinum@gmail.com"
```
Git stores information in this structure;
```
Local: /.git/config – Repository-specific settings.
Global: /.gitconfig – User-specific settings. This is where options set with the --global flag are stored.
```

Git has 3 internal structure or trees
1. Working Directory: This tree is in sync with the local filesystem and is representative of the immediate changes made to content in files and directories.
2. Staging Index: This tree is tracking Working Directory changes, that have been promoted with git add, to be stored in the next commit.
3. Commit History: The git commit command adds changes to a permanent snapshot that lives in the Commit History. This snapshot also includes the state of the Staging Index at the time of commit.

# Getting Hands-on
* Create a new repository `git init`
* For cloning an existing repository `git clone <repo url>`
* After creating new files or folder, proceed to staging area using ;
  for specific file `git add file.txt`
  For all files and folders  `git add .` or   `git add --all`
* Create a commit with message for the staged files `git commit -m "Adding a new file"`
* Check the history of git files, using `git status`
* To check all commit message and id using `git log --oneline`
* Checking diiference between content of files using `git diff`

## Collaboration 
* Collaboration with remote repository setup , it needs to added on your local git config
Usually remote repo setup include github, gitlab, bitbucket, aws codecommit, azure repos, gcp csr
`origin is the remote_name below`
` git remote add origin <remote_repo_url>`

* Pushing changes from local reposiroty to remote repository
`git push -u origin <local_branch_name>`


## Undoing changes
* Untracked files are files that have been created within your repo's working directory but have not yet been added to the repository's tracking index using the git add
`git clean -f ` remove untracked files -f option is to force, -n is for dry-run

* The git revert command is used for undoing changes to a repository's commit history.
A revert operation will take the specified commit, inverse the changes from that commit, and create a new "revert commit".
```
mkdir revert-test
cd revert-test
touch file
git add file
git commit -m "Initial commit"
echo "first line of code" >> file
git commit -m "add first line to file"
echo "Second line of code" >> file
git commit -m "add second line to file"
git log --oneline
```
Initiating a `git revert HEAD`
This will revert the latest commit
HEAD refers to the current snapshot of your working directory, it points to the latest commit on the current branch you're working on.

* Resetting
Note that git revert undoes a single commit, it does not "revert" back to the previous state of a project by removing all subsequent commits
it has three line arguments --soft, --mixed, --hard
The git reset command is used to undo a commit or staged snapshot. it moves both HEAD and main to the reset point.
Default command means `git reset` means `git reset --mixed HEAD`

This is the most direct, DANGEROUS, and frequently used option. When passed --hard The Commit History ref pointers are updated to the specified commit. Then, the Staging Index and Working Directory are reset to match that of the specified commit


