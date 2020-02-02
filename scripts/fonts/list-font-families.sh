#!/bin/bash
fc-list |grep -oP "(?<=:).*(?=:)" |sort |uniq
