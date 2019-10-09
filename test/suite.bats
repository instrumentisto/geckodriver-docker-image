#!/usr/bin/env bats


@test "post_push hook is up-to-date" {
   run sh -c "make post-push-hook out=/dev/stdout | grep 'for tag in' \
                                                  | cut -d '{' -f 2 \
                                                  | cut -d '}' -f 1"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run sh -c "cat hooks/post_push | grep 'for tag in' \
                                 | cut -d '{' -f 2 \
                                 | cut -d '}' -f 1"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  actual="$output"

  [ "$actual" = "$expected" ]
}


@test "Firefox is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'test -f /opt/firefox/firefox'
  [ "$status" -eq 0 ]
}

@test "Firefox runs ok" {
  run docker run --rm --entrypoint sh $IMAGE -c '/opt/firefox/firefox --help'
  [ "$status" -eq 0 ]
}

@test "Firefox has correct version" {
  run sh -c "cat Makefile | grep 'FIREFOX_VER ?= ' | cut -d ' ' -f 3"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run docker run --rm --entrypoint sh $IMAGE -c \
    "/opt/firefox/firefox -v | cut -d ' ' -f3"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  actual="$output"

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
  run sh -c "cat Makefile | grep 'GECKODRIVER_VER ?= ' | cut -d ' ' -f 3"
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
