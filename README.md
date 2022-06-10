geckodriver Docker image
========================

[![Release](https://img.shields.io/github/v/release/instrumentisto/geckodriver-docker-image "Release")](https://github.com/instrumentisto/geckodriver-docker-image/releases)
[![CI](https://github.com/instrumentisto/geckodriver-docker-image/workflows/CI/badge.svg?branch=master "CI")](https://github.com/instrumentisto/geckodriver-docker-image/actions?query=workflow%3ACI+branch%3Amaster)
[![Docker Hub](https://img.shields.io/docker/pulls/instrumentisto/geckodriver?label=Docker%20Hub%20pulls "Docker Hub pulls")](https://hub.docker.com/r/instrumentisto/geckodriver)

[Docker Hub](https://hub.docker.com/r/instrumentisto/geckodriver)
| [GitHub Container Registry](https://github.com/orgs/instrumentisto/packages/container/package/geckodriver)
| [Quay.io](https://quay.io/repository/instrumentisto/geckodriver)

[Changelog](https://github.com/instrumentisto/geckodriver-docker-image/blob/master/CHANGELOG.md)




## Supported tags and respective `Dockerfile` links

- [`101.0.1-driver0.31.0-r0-debian-bullseye`, `101.0.1-driver0.31.0-r0-debian`, `101.0.1-driver0.31.0-r0`, `101.0.1-driver0.31.0-debian-bullseye`, `101.0.1-driver0.31.0-debian`, `101.0.1-driver0.31.0`, `101.0.1-debian-bullseye`, `101.0.1-debian`, `101.0.1`, `debian-bullseye`, `debian`, `latest`][101]




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

[Firefox] and [geckodriver] are licensed under [Mozilla Public License 2.0].

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

The [sources][3] for producing `instrumentisto/geckodriver` Docker image are licensed under [Blue Oak Model License 1.0.0][2].




## Issues

We can't notice comments in the [DockerHub] (or other container registries) so don't use them for reporting issue or asking question.

If you have any problems with or questions about this image, please contact us through a [GitHub issue][1].





[DockerHub]: https://hub.docker.com
[Firefox]: https://www.mozilla.org/firefox
[geckodriver]: https://github.com/mozilla/geckodriver
[Mozilla Public License 2.0]: https://www.mozilla.org/en-US/MPL/2.0

[1]: https://github.com/instrumentisto/geckodriver-docker-image/issues
[2]: https://github.com/instrumentisto/geckodriver-docker-image/blob/master/LICENSE.md
[3]: https://github.com/instrumentisto/geckodriver-docker-image

[101]: https://github.com/instrumentisto/geckodriver-docker-image/blob/master/Dockerfile
