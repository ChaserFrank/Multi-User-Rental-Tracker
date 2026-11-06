# Contributing

This is a solo-maintained project. The repository history should show small focused commits, clear messages, documented decisions, and reproducible validation steps.

## Branches
- `main` is protected where the hosting platform supports branch protection. Direct pushes may be disabled so that changes still pass through CI and a reviewable pull-request history.
- The `Java CI / Build and test` workflow must be a required status check on `main` when the repository is hosted on GitHub or a compatible Actions service.
- One branch per task, named `type/short-topic`: `feat/db-schema`, `feat/rental-service`, `test/repository-constraints`, `docs/er-diagram`.

## Commits
- Small and focused: one logical change per commit.
- Message format: `type(scope): imperative summary`, e.g. `feat(repo): translate unique violations`.
  Types: `feat`, `fix`, `test`, `docs`, `refactor`, `chore`.
- Never one big "add everything" commit.

## Pull requests
- Keep pull requests small and fill in the PR template when using pull requests for traceability.
- A pull request is optional for local solo development, but is useful for CI evidence, a reviewable change history, and practicing the same workflow used by a team.
- When working alone, perform a deliberate self-review before merging: inspect the diff, run the tests, check the architecture rules, and record any trade-offs.
- Contract files require the same careful self-review as implementation files because they affect multiple layers.

## Before you push
```bash
mvn clean package        # compile, run all tests, package the executable JAR
docker compose config    # validate the Compose service and volume declarations
```

The CI workflow repeats the Maven build from a clean checkout on every branch push and pull request targeting `main`. It uploads `target/site/jacoco/` as the `jacoco-report` artifact.

For a local Docker smoke test, run:

```bash
docker compose up --build
```

Verify that the CLI starts, then restart it with the same Compose volumes and confirm that the database and `/logs/rental-tracker.log` are still present. Use `docker compose down -v` only when an intentional data reset is required.

## Coverage report deliverable
`target/` is ignored, so before the final submission run `mvn verify -Pcoverage-gate` and copy
`target/site/jacoco/` to `docs/coverage/` and commit it.
