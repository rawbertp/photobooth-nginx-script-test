## Usage

Build base image (saves some time):

```bash
build --no-cache -t photoboothnginx-base -f Dockerfile.base .
```

Build the test image:

```bash
docker build --no-cache -t photoboothnginx .
```

Start the container:

```bash
docker run --rm -p 8080:80 photoboothnginx
```

Verify that the script worked:

<http://localhost:8080/> has to return the phpinfo() content.
