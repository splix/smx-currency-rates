#!/bin/sh

mvn clean \
    && mvn install \
    && cd assembly \
    && mvn jbi:servicemix