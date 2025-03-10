//
// ProgramGroup
//
// Darren Kessner
// Marlborough School
//


import java.util.*;
import java.io.*;
import java.nio.file.*;
import processing.core.*;


public class ProgramGroup extends ArrayList<Program>
{
    public ProgramGroup(PApplet papplet, String name, String directoryName)
    {
        this.papplet = papplet;
        this.name = name;

        try
        {
            // read info.txt to add Program objects

            Path path = Paths.get(directoryName + "/info.txt");
            List<String> lines = Files.readAllLines(path);

            // command1
            // workingDirectory1
            //
            // command2
            // workingDirectory2
            //
            // ...

            for (int i=0; i+1<lines.size(); i+=3) 
            {
                String[] commands = lines.get(i).split(" ");
                String workingDirectory = lines.get(i+1);

                add(new Program(this.papplet, commands, workingDirectory));
            }
        }
        catch (IOException e)
        {
            System.out.println(e);
        }

    }

    private PApplet papplet;
    final public String name;
}


