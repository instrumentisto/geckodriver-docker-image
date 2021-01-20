#!/usr/bin/env bats


@test "Firefox is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'test -f /opt/firefox/firefox'
  [ "$status" -eq 0 ]
}

@test "Firefox runs ok" {
  run docker run --rm --entrypoint sh $IMAGE -c '/opt/firefox/firefox --help'
  [ "$status" -eq 0 ]
}

@test "Firefox has correct version" {
  run sh -c "grep 'ARG firefox_ver=' Dockerfile | cut -d '=' -f2"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run docker run --rm -e MOZ_HEADLESS=0 --entrypoint sh $IMAGE -c \
    "/opt/firefox/firefox -v"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  actual=$(printf "$output" | grep -m 1 'Mozilla Firefox' | cut -d ' ' -f3)

  [ "$actual" = "$expected" ]
}


@test "geckodriver is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'which geckodriver'
  [ "$status" -eq 0 ]
}

@test "geckodriver runs ok" {
  run docker run --rm --entrypoint sh $IMAGE -c 'geckodriver --help'
  [ "$status" -eq 0 ]
}

@test "geckodriver has correct version" {
  run sh -c "grep 'ARG geckodriver_ver=' Dockerfile | cut -d '=' -f2"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run docker run --rm --entrypoint sh $IMAGE -c \
    "geckodriver -V | grep -m 1 geckodriver | cut -d ' ' -f2"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  actual="$output"

  [ "$actual" = "$expected" ]
}
