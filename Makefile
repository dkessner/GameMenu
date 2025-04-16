#
# Makefile (VideoGameMenu)
#
# Compiles source code in src to output directory bin.
#
# Darren Kessner
# Marlborough School
#


# $* stem of implicit rule match
# $@ target
# $< first prerequisite

# $(dir names...)  extract directory part
# $(addsuffix suffix, names)   add suffix


logfile = bin/out
fullPath = $(shell pwd)/
platform = $(shell uname)


all: \
    $(logfile) \
    bin/VideoGameMenu.class \
    bin/demo/info.txt \
    bin/demo/sierpinski/Sierpinski.class \
    bin/demo/sierpinski/info.txt \
    bin/demo/kaleidoscope/kaleidoscope.done \
    bin/demo/kaleidoscope/info.txt \
    bin/demo/particles/particles.done \
    bin/demo/particles/info.txt \
    bin/demo/phyllotaxis/phyllotaxis.done \
    bin/demo/phyllotaxis/info.txt \
    bin/games/info.txt \
    bin/games/BLOCK_BREAKER/BLOCK_BREAKER.done \
    bin/games/BLOCK_BREAKER/info.txt \
    bin/games/ROCKETCOMMAND/ROCKETCOMMAND.done \
    bin/games/ROCKETCOMMAND/info.txt \
    bin/games/BAMBLAM/BAMBLAM.done \
    bin/games/BAMBLAM/info.txt \
    bin/games/BAMBLAM/scorelist.txt \
    bin/games/REDBARON/REDBARON.done \
    bin/games/REDBARON/info.txt \
    bin/games/RockPaperScissors/RockPaperScissors.class \
    bin/games/RockPaperScissors/info.txt \
    bin/2016-17_Sem1/info.txt \
    bin/2016-17_Sem1/JuliaTron/JuliaTron.done \
    bin/2016-17_Sem1/JuliaTron/info.txt \
    bin/2016-17_Sem1/snowflakegame/snowflakegame.done \
    bin/2016-17_Sem1/snowflakegame/info.txt \
    bin/2016-17_Sem1/frogger_game/frogger_game.done \
    bin/2016-17_Sem1/frogger_game/info.txt \
    bin/2016-17_Sem1/flappy_bird/flappy_bird.done \
    bin/2016-17_Sem1/flappy_bird/info.txt \
    bin/2016-17_Sem1/RedSea/RedSea.done \
    bin/2016-17_Sem1/RedSea/info.txt \
    bin/2016-17_Sem1/kaleidoscope_paulina_hazel/kaleidoscope_paulina_hazel.done \
    bin/2016-17_Sem1/kaleidoscope_paulina_hazel/info.txt \
    bin/2016-17_Sem1/foodGame/foodGame.done \
    bin/2016-17_Sem1/foodGame/info.txt \
    bin/2016-17_Sem1/Doodle_Jump_Timer/Doodle_Jump_Timer.done \
    bin/2016-17_Sem1/Doodle_Jump_Timer/info.txt \
    bin/2016-17_Sem1/Duel_with_Voldytabarcade/Duel_with_Voldytabarcade.done \
    bin/2016-17_Sem1/Duel_with_Voldytabarcade/info.txt \
    bin/2016-17_Sem2/info.txt \
    bin/2016-17_Sem2/Basketball_Game/Basketball_Game.done \
    bin/2016-17_Sem2/Basketball_Game/info.txt \
    bin/2016-17_Sem2/Zippy_Bird/Zippy_Bird.done \
    bin/2016-17_Sem2/Zippy_Bird/info.txt \
    bin/2016-17_Sem2/Zippy_Snail/Zippy_Snail.done \
    bin/2016-17_Sem2/Zippy_Snail/info.txt \
    bin/2016-17_Sem2/Zippy_Shark/Zippy_Shark.done \
    bin/2016-17_Sem2/Zippy_Shark/info.txt \
    bin/2016-17_Sem2/squaregame2/squaregame2.done \
    bin/2016-17_Sem2/squaregame2/info.txt \
    bin/2016-17_Sem2/SuperMarioBros/SuperMarioBros.done \
    bin/2016-17_Sem2/SuperMarioBros/info.txt \
    bin/2016-17_Sem2/threes/threes.done \
    bin/2016-17_Sem2/threes/info.txt \
    bin/2016-17_Sem2/Bella_Final/Bella_Final.done \
    bin/2016-17_Sem2/Bella_Final/info.txt \
    bin/2016-17_Sem2/brickbreaker/brickbreaker.done \
    bin/2016-17_Sem2/brickbreaker/info.txt \
    bin/2016-17_Sem2/Fractals/AllFractalCalculate.class \
    bin/2016-17_Sem2/Fractals/info.txt \
    bin/2016-17_Sem2/maze/maze.done \
    bin/2016-17_Sem2/maze/info.txt \
    bin/2016-17_Sem2/FlappyPig/Flappy.class \
    bin/2016-17_Sem2/FlappyPig/info.txt \
    bin/2016-17_Sem2/BallShooter/BallShooter.class \
    bin/2016-17_Sem2/BallShooter/info.txt \
    bin/2016-17_Sem2/BouncingOffWalls/BouncingOffWalls.class \
    bin/2016-17_Sem2/BouncingOffWalls/info.txt \
    bin/2017_Summer/info.txt \
    bin/2017_Summer/Paintball/Paintball.done \
    bin/2017_Summer/Paintball/info.txt \
    bin/2017_Summer/paddle_game_2/paddle_game_2.done \
    bin/2017_Summer/paddle_game_2/info.txt \
    bin/2017_Summer/Basketball/Basketball.done \
    bin/2017_Summer/Basketball/info.txt \
    bin/2017_Summer/Cannon/Cannon.done \
    bin/2017_Summer/Cannon/info.txt \
    bin/2017_Summer/solar_system/solar_system.done \
    bin/2017_Summer/solar_system/info.txt \
    bin/2017_Summer/popcorn2/popcorn2.done \
    bin/2017_Summer/popcorn2/info.txt \
    bin/2017-18/info.txt \
    bin/2017-18/Ping_Pong/Ping_Pong.done \
    bin/2017-18/Ping_Pong/info.txt \
    bin/2017-18/luckcharmfall_pde/luckcharmfall_pde.done \
    bin/2017-18/luckcharmfall_pde/info.txt \
    bin/2017-18/brick_breaker/brick_breaker.done \
    bin/2017-18/brick_breaker/info.txt \
    bin/2018-19/info.txt \
    bin/2018-19/CarleeGame/CarleeGame.done \
    bin/2018-19/CarleeGame/info.txt \
    bin/2018-19/danceprojection/danceprojection.done \
    bin/2018-19/danceprojection/info.txt \
    bin/2018-19/AdmissionsGame/AdmissionsGame.done \
    bin/2018-19/AdmissionsGame/info.txt \
    bin/2024-25/info.txt \
    bin/2024-25/eloise_flipside/eloise_flipside.done \
    bin/2024-25/eloise_flipside/info.txt \
    bin/images \
    bin/fonts.txt
	

# Processing program rule

ifeq ("$(platform)", "Linux")
NOJAVA = --no-java
endif

bin/%.done: src/%.pde
	@echo Compiling $< | tee -a $(logfile)
	@unset CLASSPATH && processing-java --sketch=$(addprefix $(fullPath), $(dir $<)) \
	    --output=$(addprefix $(fullPath), $(dir $@)) --force $(NOJAVA) --export >> $(logfile)
	@touch $@
ifeq ($(platform), Darwin)
	@echo "Copying data directory (for OSX only)"
	@if [ -d $(dir $<)/data ]; then cp -r $(dir $<)/data $(dir $@); fi
else
endif


# Java program rule

forceRecompile:
	touch src/VideoGameMenu.java

bin/%.class: src/%.java
	@echo Compiling $< | tee -a $(logfile)
	cd $(dir $<) && javac *.java 
	@mkdir -p $(dir $@)
	@mv $(dir $<)/*.class $(dir $@)
	@if [ -d $(dir $<)/data ]; then cp -r $(dir $<)/data $(dir $@); fi


# copy any text files (e.g. meta-data info.txt)

bin/%.txt: src/%.txt
	@echo Copying $<
	@mkdir -p $(dir $@)
	@cp $< $@


# images

bin/images: images
	@echo Copying images to bin.
	@cp -r images bin
	@echo Copying run to bin.
	@cp src/run bin


$(logfile):
	@mkdir -p $(dir $(logfile))
	@touch $(logfile)


clean: 
	rm -rf bin


