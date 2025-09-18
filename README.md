# Overview
This artifact compiles the codebase and runs the project’s in-repository unit tests inside the ARVO image `n132/arvo:65933-fix` using the project’s BTest harness. It requires only Docker on the host and leaves no files behind after completion.

## Requirements
- Docker can pull public images
- Network access

## Deployment
Make the script executable:

```bash
chmod +x test65933.sh
```

Run the script from the provided path:

```powershell
bash -lc "cd /mnt/c/Users/jonah/Code/arvo_extracted_files && ./test65933.sh"
```

## What the script does
- Starts a disposable container from `n132/arvo:65933-fix` with working directory `/src/zeek`.
- Installs build prerequisites and the `btest` test driver inside the container.
- Builds the project with pthread support and runs the test suite via `btest` from `testing/btest`.