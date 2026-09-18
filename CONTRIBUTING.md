# Contributing

Contributions improve public template infrastructure, documentation, scripts,
and skills. Do not submit personal thesis content as a repository change.

## Before Pull Request

1. Read `AGENTS.md`, `docs/AI_WORKFLOW.md`, and `docs/FORMAT_STATUS.md`.
2. Do not add DOCX templates, institutional logos, proprietary fonts, papers,
   raw data, respondent data, administration, or credentials.
3. Run `make ci`.
4. Run `git diff --check`.
5. Explain source evidence for every formatting change.
6. Keep academic decisions marked `open` unless an official source or written
   supervisor/program decision is added.

## Scope

- Template infrastructure belongs in `latex-work-dir/`.
- Research workflow documentation belongs in `docs/` and `work-dir/` templates.
- AI behavior belongs in `AGENTS.md` and `.agents/skills/`.
- User-specific data belongs outside Git-tracked files.
