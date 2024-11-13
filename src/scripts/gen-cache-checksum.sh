#!/bin/bash
find . -name 'pom.xml' | sort | xargs cat > /tmp/maven_cache_seed