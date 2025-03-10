#
# Makefile (local Java dev)
#


# $* stem of implicit rule match
# $@ target
# $< first prerequisite

# $(dir names...)  extract directory part
# $(addsuffix suffix, names)   add suffix



all: \
    RockPaperScissors.class \
    Thing.class \
    ThingWrangler.class \
    TestGame.class \
    ThreeTargetGame.class \
    AsteroidsGame.class \
    HighScore.class


%.class: %.java
	javac $<

clean:
	rm -rf *.class


