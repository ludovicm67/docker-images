`atlassian-disk-bench`
======================

> A toolbox to run the Atlassian disk benchmark.

Run the image:
  - Without volume: `docker run -it --rm ludovicm67/atlassian-disk-bench sh`
  - Using volume: `docker run -it --rm -v /tmp:/bench ludovicm67/atlassian-disk-bench sh`
    (replace `/tmp` with the directory you want to mount).

Volumes:
  - `/bench`, the volume to benchmark.

Once you logged in the shell, just run the following command: `./run_bench.sh`.
