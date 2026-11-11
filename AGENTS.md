# AGENTS.md — DOSE

## Git history: never rewrite, never force-push

DOSE's `.git` is ~380 MB because large data files were committed historically and
later deleted. **The rewrite needed to shrink it is deliberately off-limits** —
this was verified against both remotes:

- `origin` (GitHub `YuLab-SMU/DOSE`): `devel` is a **protected branch**
  (`GH006: Cannot force-push to this branch`).
- `upstream` (`git.bioconductor.org:packages/DOSE`): Bioconductor's receive-hooks
  **reject any non-fast-forward / rewritten history by design** (`DENIED by
  fallthru` / `hook declined`).

The release workflow in the `Makefile` depends on the two remotes sharing one
history: `make update` merges `upstream/devel` *and* `origin/devel`, `make push`
pushes to both. A rewritten history that only landed on GitHub would leave the
remotes as unrelated histories and break that workflow.

**Do not run `git filter-repo`, `bfg`, or `git lfs migrate` on this repo, and do
not force-push `devel` — even to "fix" or shrink it.** Keep the history as-is.

## Fresh clones are ~380 MB — clone shallow/partial when you can

Full-history clones are unavoidable when you need history, but for throwaway
or CI clones use:

```bash
git clone --depth 1 git@github.com:YuLab-SMU/DOSE.git          # fastest
git clone --filter=blob:none git@github.com:YuLab-SMU/DOSE.git # partial
```

## Large data files: keep them out of the repo

- The package's data (HPO/HDO/MPO sqlite, NCG.gson) does **not** live in the
  repository. It is generated weekly by `.github/workflows/update-data.yml` and
  published to the `gh-pages` branch, which `R/` downloads at runtime via
  `yulab.utils` (`https://yulab-smu.top/DOSE`).
- Do not commit new large files to `devel`. If a file genuinely must be
  versioned inside the repo, use `git-lfs` **forward-only** — commit the
  `.gitattributes` first, then the files; never `git lfs migrate` (rewrites
  history, see above). Check first that the file is not needed by
  `R CMD build/check`: Bioconductor builders handle LFS content poorly.

## Remotes

- `origin` = GitHub `YuLab-SMU/DOSE`
- `upstream` = Bioconductor `packages/DOSE`
- Publish with `make push` (pushes both), refresh locally with `make update`.
