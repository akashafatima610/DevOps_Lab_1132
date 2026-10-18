DevOps Lab 04 Submission

Student Name: Akasha Fatima
Student Reg Number: 23-NTU-CS-FL-1132

9.1 Required URLs

  1. Task 1 — Personal Repository: https://github.com/akashafatima610/DevOps_Lab_1132
  2. Task 3 — Merged Pull Request: https://github.com/akashafatima610/DevOps_Lab_1132/pull/3
  3. Partner Review Comment Permalink: https://github.com/Eman-Babar/devops-lab/pull/3#discussion_r4296796724
  4. Task 4 — Upstream Pull Request: https://github.com/rehannsarwar1/devops-lab04-upstream/pull/42

9.2 Short Answers

1. What does `origin/main` mean, and when can it be wrong or stale?

`origin/main` refers to the main branch of the remote repository named `origin`. It can become outdated if someone pushes new changes to GitHub and I haven't fetched those changes yet. It can also be the wrong reference if `origin` points to my own fork instead of the original class repository.

3. What are the three repositories in Task 4, and which one can you write to?

The three repositories in Task 4 are my fork (`akashafatima610/devops-lab04-upstream`), the original class repository (`rehannsarwar1/devops-lab04-upstream`), and my local clone on my computer. I can push changes to my own fork, while the original class repository is maintained by its owner. My local clone is where I make changes and commit them before pushing.

4. Why is force-pushing with `--force-with-lease` acceptable in Task 4, compared with the Lab 03 warning?

In Task 4, `--force-with-lease` is used after rebasing my branch onto the latest upstream changes. Rebasing changes the commit history, so I may need to update my branch on GitHub using a force push. The `--force-with-lease` option is safer because it checks that the remote branch has not changed unexpectedly before overwriting it. In Lab 03, force-pushing was discouraged because it can overwrite other people's work or shared history.

5. Output of `git remote -v` from the Task 4 clone

akasha@DESKTOP-AEM1FL9:~/devops/devops-lab04-upstream$ git remote -v

origin  https://github.com/akashafatima610/devops-lab04-upstream.git (fetch)
origin  https://github.com/akashafatima610/devops-lab04-upstream.git (push)
upstream        https://github.com/rehannsarwar1/devops-lab04-upstream.git (fetch)
upstream        https://github.com/rehannsarwar1/devops-lab04-upstream.git (push)

6. Team information

- Team Name: 27-FYP-218
- Members and Roll Numbers:
      Member 1: Akasha Fatima     23-NTU-CS-FL-1132
      Member 2: Eman Babar        23-NTU-CS-FL-1148
      Member 3: Nimra Tanveer     23-NTU-CS-FL-1201
  
- Team Project Repository URL: https://github.com/Eman-Babar/27-FYP-218

6. Was the fallback repository used?
No, I did not use the fallback repository or run the fallback script. I reused my existing work from Lab 03.
