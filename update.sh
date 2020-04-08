IMAGE=$1
COMPOSE_FILE=$2
PROJECT_DIR=$3

echo $IMAGE
echo $COMPOSE_FILE
echo $PROJECT_DIR

SNAPSHOT=$(mvn -f $PROJECT_DIR/pom.xml -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)

sed -i -E "s/$IMAGE.+/$IMAGE$SNAPSHOT/" $COMPOSE_FILE
