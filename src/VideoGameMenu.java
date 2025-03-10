//
// VideoGameMenu
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import java.io.*;
import java.util.*;


public class VideoGameMenu extends PApplet
{
    public void settings()
    {
        fullScreen();
        //size(800, 450);
    }

    public void setup()
    {
        surface.setResizable(true);
        noCursor();
        println("screen size:", width, height);

        programs = new ArrayList<ProgramGroup>();
        programs.add(new ProgramGroup(this, "2018-19", "2018-19"));
        programs.add(new ProgramGroup(this, "2017-18", "2017-18"));
        programs.add(new ProgramGroup(this, "2017\nSummer", "2017_Summer"));
        programs.add(new ProgramGroup(this, "2016-17\nSpring Semester", "2016-17_Sem2"));
        programs.add(new ProgramGroup(this, "2016-17\nFall Semester", "2016-17_Sem1"));
        programs.add(new ProgramGroup(this, "Games", "games"));
        programs.add(new ProgramGroup(this, "Demos", "demo"));

        current_i = 0;
        current_j = programs.get(current_i).size()/2;

        programView = new BasicProgramView(this);
    }

    public void draw()
    {
        background(0);
        
        programView.display(programs, current_i, current_j);
    }

    public void keyPressed()
    {
        if (keyCode == UP)
        {
            if (current_j > 0) 
                current_j--;
        }
        else if (keyCode == DOWN)
        {
            if (current_j + 1 < programs.get(current_i).size())
                current_j++;
        }
        else if (keyCode == LEFT)
        {
            current_i--;
            if (current_i == -1) 
                current_i = programs.size()-1; // wrap around
            current_j = programs.get(current_i).size()/2;
        }
        else if (keyCode == RIGHT)
        {
            current_i++;
            if (current_i >= programs.size()) 
                current_i = 0; // wrap around
            current_j = programs.get(current_i).size()/2;
        }
        else if (key == ' ' || key == ENTER || key == RETURN)
        {
            if (current_j < programs.get(current_i).size())
            {
                Program program = programs.get(current_i).get(current_j);
                launch(program.commands, program.workingDirectory);
            }
        }
        else if (key == ESC)
        {
            key = 0; // ignore: don't quit
        }
        else if (key == 'q')
        {
            exit();
        }
        else
        {
            programView.keyPressed(); // let ProgramView handle other keys
        }
    }

    // private methods and data

    private void launch(String[] commands, String workingDirectory)
    {
        System.out.println("workingDirectory: " + workingDirectory);
        System.out.println("commands: " + Arrays.toString(commands));

        try
        {
            ProcessBuilder pb = new ProcessBuilder(commands)
                    .directory(new File(workingDirectory))
                    .inheritIO() // sets I/O streams to be same as current process (or will hang)
                    ;

            Process proc = pb.start();
            int exitVal = proc.waitFor();
            System.out.println("Process exitValue: " + exitVal);

            // implementation notes:
            // 1) Runtime.exec() may hang if stdout/stderr streams aren't drained
            // 2) Runtime.exec() splits String command into args, i.e. "java classname" works
            // 3) ProcessBuilder uses variable length array argument, so does not split strings,
            //    i.e. "java MyClass" doesn't work.  (Must pass new String[]{"java", "MyClass"}).
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

    private static void printFonts()
    {
        String[] fonts = PFont.list();
        for (String f : fonts)
            System.out.println(f);
    }

    public static void main(String[] args)
    {
        PApplet.main("VideoGameMenu");
    }

    private ArrayList<ProgramGroup> programs;
    private int current_i;
    private int current_j;

    public interface ProgramView
    {
        public void display(ArrayList<ProgramGroup> programs, int current_i, int current_j);
        public void keyPressed();
    }

    private ProgramView programView;
}


