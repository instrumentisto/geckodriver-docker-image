Geckodriver Docker image
===============================

[![GitHub release](https://img.shields.io/github/release/instrumentisto/geckodriver-docker-image.svg)](https://hub.docker.com/r/instrumentisto/geckodriver/tags) [![Build Status](https://travis-ci.org/instrumentisto/geckodriver-docker-image.svg?branch=master)](https://travis-ci.org/instrumentisto/geckodriver-docker-image) [![Docker Pulls](https://img.shields.io/docker/pulls/instrumentisto/geckodriver.svg)](https://hub.docker.com/r/instrumentisto/geckodriver)




## What is Geckodriver Docker image?

This image bundles Geckodriver with Firefox and is suitable for running headless tests.


## How to use this image

```bash
docker run -d -p 4444:4444 instrumentisto/geckodriver
```

After that you can connect to Geckodriver that will be running on `127.0.0.1:4444`. Only headless mode is supported.

Consider running image with `--network=host` if you want to run tests on local server.

Consider running image with increased shared memory size (`--shm-size 2g`), otherwise you may experience unexpected Firefox crashes. 


## Image versions

Image version corresponds to Firefox version used.




## License

Firefox and Geckodriver are licensed under [Mozilla Public License][91].

Geckodriver Docker image is licensed under [MIT license][92].




## Issues

We can't notice comments in the DockerHub so don't use them for reporting issue or asking question.

If you have any problems with or questions about this image, please contact us through a [GitHub issue][1].




[1]: https://github.com/instrumentisto/geckodriver-docker-image/issues
[91]: https://www.mozilla.org/en-US/MPL/2.0/
[92]: https://github.com/instrumentisto/geckodriver-docker-image/blob/master/LICENSE.md
