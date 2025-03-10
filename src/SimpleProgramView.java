//
// SimpleProgramView
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import java.util.*;


public class SimpleProgramView implements VideoGameMenu.ProgramView
{
    public SimpleProgramView(PApplet papplet)
    {
        this.papplet = papplet;
    }

    public void display(ArrayList<ProgramGroup> programs, int current_i, int current_j)
    {
        papplet.text("current_i: " + current_i, 20, 50);
        papplet.text("current_j: " + current_j, 20, 100);

        Program program = programs.get(current_i).get(current_j);
        papplet.text(Arrays.toString(program.commands), 40, 150);
        papplet.text(program.workingDirectory, 40, 200);
    }

    private PApplet papplet;
}

