#!/bin/bash

greet() {
  echo "Hello, $1"
}

for name in Ayush DevOps Linux
do
  greet "$name"
done
