# Publishing Checklist

1. Run `make ci` from clean workspace.
2. Run `git diff --check`.
3. Run `opencode debug config` and `opencode debug skill`.
4. Scan source for legacy references and actual credentials. Policy files may
   mention secret categories as warnings; those mentions are not credentials.
   Also check personal data, DOCX, fonts, logos, PDFs, raw data, papers, and
   administration.
5. Confirm `LICENSE`, `NOTICE.md`, `SECURITY.md`, and `CONTRIBUTING.md`.
6. Confirm GitHub Actions uses fallback build only.
7. Confirm decisions in `work-dir/decisions.md` remain open unless evidenced.
8. Review `git status --ignored` and stage only intended source.
9. Inspect staged diff before initial commit.
10. Configure GitHub remote only after owner and repository name are confirmed.

Do not force-push. Do not publish official assets or student materials.
