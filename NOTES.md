Repository history rewrite: large file removal

What I did
- Rewrote Git history to remove the generated Terraform directory `Terraform/.terraform/` (this removed a very large provider binary that exceeded GitHub's 100 MB limit).
- Added `.gitignore` entry for `Terraform/.terraform/` and committed that change.
- Ran aggressive `git gc` and force-pushed the cleaned history to `origin` (this overwrote remote history).

Why this matters
- The large binary lived in past commits; deleting it in a new commit does not remove it from history. Rewriting history and garbage-collecting purged the object so pushes would succeed.

Impact for collaborators
- Because history was rewritten, anyone who has a clone or fork must re-sync. The safest option is to re-clone the repository. If re-cloning is not possible, follow the steps below.

Recommended actions (safe and quick)

1) If you have no local uncommitted changes and can reset hard:

   git fetch origin
   git reset --hard origin/master
   git clean -fd

2) If you have local commits you want to preserve:

   # Create a backup branch of your current work
   git branch backup/my-work

   # Create patches of your work (optional)
   git format-patch origin/master..HEAD -o /tmp/patches

   # Then reset to the rewritten origin and re-apply your work as needed
   git fetch origin
   git reset --hard origin/master
   # Re-apply patches if you created them
   git am /tmp/patches/*.patch

3) If anything looks wrong or you prefer a clean start, re-clone:

   git clone https://github.com/shivam1085/DevSecOps-.git

How to verify the large file is gone

On a fresh clone or after resetting, run:

   git rev-list --objects --all | grep 'terraform-provider-aws_v6.19.0_x5.exe' || echo "not found"

If the command prints nothing (or "not found"), the binary is no longer present in history.

Prevention and best-practices
- Never commit `Terraform/.terraform/` or any generated/provider binaries. Keep `Terraform/.terraform/` in `.gitignore` (already added).
- Use Terraform registry/providers or Terraform Cloud rather than committing provider binaries.
- If you must track large assets, use Git LFS and discuss with the team first.

Contact
- If you hit any problems resyncing, contact the repo owner (shivam1085) so we can coordinate and help recover any work.

--
Automated note: history was rewritten and force-pushed to origin/master on your behalf to remove a >100MB file. Please follow the instructions above to resync.
