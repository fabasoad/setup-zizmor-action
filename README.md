# Setup zizmor action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![Release](https://img.shields.io/github/v/release/fabasoad/setup-zizmor-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-zizmor-action/actions/workflows/functional-tests.yml/badge.svg)
![security](https://github.com/fabasoad/setup-zizmor-action/actions/workflows/security.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-zizmor-action/actions/workflows/linting.yml/badge.svg)

This action installs [zizmor](https://woodruffw.github.io/zizmor/) CLI tool.

## Supported OS

<!-- prettier-ignore-start -->
| OS      |                    |
|---------|--------------------|
| Windows | :white_check_mark: |
| Linux   | :white_check_mark: |
| macOS   | :white_check_mark: |
<!-- prettier-ignore-end -->

## Prerequisites

None.

## Inputs

```yaml
- uses: fabasoad/setup-zizmor-action@v0
  with:
    # (Optional) zizmor version. Defaults to "latest".
    version: "1.1.1"
    # (Optional) If "false" skips installation if zizmor is already installed.
    # If "true" installs zizmor in any case. Defaults to "false".
    force: "false"
```

## Outputs

<!-- prettier-ignore-start -->
| Name      | Description                         | Example |
|-----------|-------------------------------------|---------|
| installed | Whether zizmor was installed or not | `true`  |
<!-- prettier-ignore-end -->

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/70052d1694b172ac5a5f3ef75c1b1cd6db1166a0.svg "Repobeats analytics image")
