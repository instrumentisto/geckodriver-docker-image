geckodriver Docker image
========================

[![Build Status](https://travis-ci.org/instrumentisto/geckodriver-docker-image.svg?branch=master)](https://travis-ci.org/instrumentisto/geckodriver-docker-image) [![Docker Pulls](https://img.shields.io/docker/pulls/instrumentisto/geckodriver.svg)](https://hub.docker.com/r/instrumentisto/geckodriver)




## Supported tags and respective `Dockerfile` links

- `70.0-driver0.26.0-debian-buster`, `70.0-driver0.26.0-debian`, `70.0-driver0.26.0`, `70.0-debian-buster`, `70.0-debian`, `70.0`, `debian-buster`, `debian`, `latest` [(Dockerfile)][101]




## What is geckodriver?

[geckodriver] is a proxy for using W3C [WebDriver] compatible clients to interact with Gecko-based browsers.

This program provides the HTTP API described by the [WebDriver protocol] to communicate with Gecko browsers, such as [Firefox]. It translates calls into the [Marionette remote protocol] by acting as a proxy between the local and remote ends.

This image bundles [geckodriver] with [Firefox] and is suitable for running headless tests.

[Marionette remote protocol]: https://firefox-source-docs.mozilla.org/testing/marionette
[WebDriver]: https://developer.mozilla.org/en-US/docs/Web/WebDriver
[WebDriver protocol]: https://w3c.github.io/webdriver/#protocol

> [firefox-source-docs.mozilla.org/testing/geckodriver](https://firefox-source-docs.mozilla.org/testing/geckodriver)




## How to use this image

```bash
docker run -d -p 4444:4444 instrumentisto/geckodriver
```

After that you can connect to [geckodriver] that is listening on `127.0.0.1:4444`. Only headless mode is supported.

Consider using `--network=host` option for running image if you want to run tests on local server.

Consider to increase shared memory size (`--shm-size 2g` option), otherwise you may experience unexpected [Firefox] crashes.




## License

[Firefox] and [geckodriver] are licensed under [Mozilla Public License].

[geckodriver] Docker image is licensed under [MIT license][2].




## Issues

We can't notice comments in the DockerHub so don't use them for reporting issue or asking question.

If you have any problems with or questions about this image, please contact us through a [GitHub issue][1].





[Firefox]: https://www.mozilla.org/firefox
[geckodriver]: https://github.com/mozilla/geckodriver
[Mozilla Public License]: https://www.mozilla.org/en-US/MPL/2.0

[1]: https://github.com/instrumentisto/geckodriver-docker-image/issues
[2]: https://github.com/instrumentisto/geckodriver-docker-image/blob/master/LICENSE.md

[101]: https://github.com/instrumentisto/geckodriver-docker-image/blob/master/Dockerfile
