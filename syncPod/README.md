# Sync models to pods

Running `sync.sh` will update models on the kubernetes nodes, based on
git-annex tags.  It can *not* automatically deploy models to new nodes
without them already being set up.

See `sync.yaml` for how it works.
