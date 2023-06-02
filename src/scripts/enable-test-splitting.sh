#!/bin/bash
echo -e "\033[31m\033[4mOrb Notes on Test Splitting\033[0m
        \033[34mCaveat 1:\033[0m  CircleCI Test Splitting uses filename by default, but JUnit reports use class names.
        Therefore this orb uses naive translation of linux file paths to dot separated package names and strips the .java suffix.
        \033[34mCaveat 2:\033[0m  Surefire and Failsafe both allow <includes> in pom configuration (which can come from parent projects).
        These values are appended to any -DincludeFiles argument (meaning it would still run all tests on every node).
        Therefore this orb will generate an exclusion list; a list of tests being run on the other nodes, and pass that to surefire/failsafe as an exclusion.
        \033[34mDebugging:\033[0m This orb will place all files used to decide tests in .circleci/tests and export it as an artifact for inspection/debugging.
        "
mkdir -p .circleci/tests/
# generate excluded surefire tests using provided pattern
circleci tests glob "$PARAM_TEST_DIR"/"$PARAM_TEST_PATTERN" | \
    sed "s#.*src/test/java/\(.*\)\..*#\1#g" | \
    tr "/" "." > .circleci/tests/surefire_classnames
circleci tests split --split-by=timings --timings-type=classname < .circleci/tests/surefire_classnames > /tmp/this_node_tests 
grep -xvf /tmp/this_node_tests < .circleci/tests/surefire_classnames > .circleci/tests/surefire_classnames_ignore_list 
# generate excluded failsafe tests using provided pattern
circleci tests glob "$PARAM_TEST_DIR"/"$PARAM_IT_PATTERN" | \
    sed "s#.*src/test/java/\(.*\)\..*#\1#g" | \
    tr "/" "." > .circleci/tests/failsafe_classnames
circleci tests split --split-by=timings --timings-type=classname < .circleci/tests/failsafe_classnames > /tmp/this_node_it_tests
grep -xvf /tmp/this_node_it_tests < .circleci/tests/failsafe_classnames > .circleci/tests/failsafe_classnames_ignore_list