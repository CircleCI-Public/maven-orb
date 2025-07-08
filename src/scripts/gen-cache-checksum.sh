#!/bin/bash
find . -name 'pom.xml' | sort | xargs cat > ./.maven_cache_seed