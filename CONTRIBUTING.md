# Contributing to the SongLib App

Thank you for contributing to our SongLib app! Please follow the guidelines below to ensure a smooth contribution process.

## Branching

- Always checkout from the `stable` branch for your new tasks to ensure your branch has the latest updates.

```bash
git checkout stable
git pull origin stable
git checkout -b your-task-branch
```

- Name your branch as per your task for better organization.

```bash
git checkout -b feature/your-task
```

## Pull Requests (PRs)

- Avoid sending large PRs; limit the changes to no more than 10 files for efficient code review.

- Make the PR title as descriptive as possible.

- Add a clear description of the specific changes introduced by your PR.

- Ensure there are no conflicts with the `stable` branch before sending your PR.

```bash
git pull origin stable
```

- After resolving conflicts or rebasing, run the app to verify that everything works properly.

## Testing and Deployment

- Build a release version of the app and push it to App Teaster for UAT.

```bash
flutter build apk --flavor apptester -t lib/main.dart --no-tree-shake-icons
```

- Inform the reviewers via chat, mentioning the PR number.

## Review Process

- Tag one or two reviewers when sending your PR.

- Check for comments and address them promptly to resolve any issues.

- Once approved, complete the PR and delete the branch.

```bash
git branch -d your-task-branch
```

Thank you for your contribution!
