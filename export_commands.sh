#!bin/bash

echo 'export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"' >> ~/.bashrc
echo 'export SPARK_HOME=/opt/spark/spark-3.3.2-bin-hadoop3' >> ~/.bashrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc
