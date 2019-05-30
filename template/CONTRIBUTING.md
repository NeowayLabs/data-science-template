# Workflow

The development workflow should work as people get acquainted to this project.

- Development of features and code works in different branches, using Git.
- Everything should be Merged into a `master` branch, with the appropriate code review.
  - To make life simple for everyone, keep Merge Requests brief and make them often.
  - This will ensure code quality and that it won't take much time of the reviewer.
- When making experiments, you can either do locally or in a server by pulling the git repo.
  - Remember to always make experiments in a different branch, so you can keep your code organized
  - Don't commit data or binaries to git, as they can be really heavy.
- When the experiment is good enough, you can open an MR for review.
  - You can put on the description the workspace.
- All the experiments should be saved in the `workspace/` folder
  - `workspace/data/` keeps the train and test data for your experiment
  - `workspace/models/` keeps the trained models, preprocessing objects and any pickles
- By using `make release VERSION=x` you'll:
  - test your code
  - generate a git tag `x` for the current commit
  - push the tag `x` to your git hosting service
  