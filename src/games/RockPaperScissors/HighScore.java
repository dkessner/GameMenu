//
// HighScore.java
//
// Darren Kessner
// Marlborough School
//


import processing.core.*;
import java.util.*;
import java.io.*;
import java.nio.file.*;


public class HighScore
{
    public HighScore(PApplet papplet, String filename)
    {
        this.papplet = papplet;
        this.filename = filename;
        showing = false;
        readData();
    }

    public void show(int score)
    {
        showing = true;

        if (entries.size()==10 && score > entries.get(9).score)
        {
            state = State.NewHighScore;
            newEntry = new Entry(score, "");

            for (int i=0; i<10; i++)
            {
                if (score > entries.get(i).score)
                {
                    entries.add(i, newEntry);
                    entries.remove(10);
                    break;
                }
            }
        }
        else
        {
            state = State.ShowingHighScores;
        }
    }

    public boolean isShowing()
    {
        return showing;
    }

    public void display()
    {
        displayScores();
    }

    public void keyPressed()
    {
        if (state == State.NewHighScore)
            keyPressedNewHighScore();
        else
            keyPressedShowingHighScores();
    }

    // private data and methods

    private PApplet papplet;
    private String filename;
    private boolean showing;

    private enum State {NewHighScore, ShowingHighScores}
    private State state;

    private class Entry
    {
        public Entry(int score, String name)
        {
            this.score = score;
            this.name = name;
        }

        private int score;
        private String name;
    }

    private ArrayList<Entry> entries;
    private Entry newEntry;

    private String characters = "abcdefghijklmnopqrstuvwxyz. 0123456789";
    private int characterIndex;

    private void readData()
    {
        List<String> lines = new ArrayList<String>();
        entries = new ArrayList<Entry>();

        try
        {
            Path path = Paths.get(filename);
            lines = Files.readAllLines(path);
        }
        catch (IOException e)
        {
            System.out.println("[HighScore] caught:");
            System.out.println(e);
        }

        for (String line : lines)
        {
            String[] tokens = line.split(" ");
            if (tokens.length == 0) continue;
            int score = Integer.parseInt(tokens[0]);
            String name = String.join(" ", Arrays.copyOfRange(tokens, 1, tokens.length));
            entries.add(new Entry(score, name));
        }

        for (int i=entries.size()-1; i>=10; i--)
            entries.remove(i);

        for (int i=entries.size(); i<10; i++)
            entries.add(new Entry(0, "Sally Mustang"));
    }

    private void writeData()
    {
        ArrayList<String> stage = new ArrayList<String>();

        for (Entry e : entries)
        {
            String temp = Integer.toString(e.score) + " " + e.name;
            stage.add(temp);
        }

        try
        {
            Path path = Paths.get(filename);
            Files.write(path, stage);
        }
        catch (IOException e)
        {
            System.out.println("[HighScore] caught:");
            System.out.println(e);
        }
    }

    private void displayScores()
    {
        // header message

        float y = papplet.height/6f;
        float dy = 40;

        papplet.textSize(dy*2);
        papplet.fill(0, 255, 0);
        papplet.textAlign(PApplet.CENTER, PApplet.CENTER);

        if (state == State.NewHighScore)
        {
            papplet.text("HIGH SCORE!", papplet.width/2, y);
            y += dy*2;

            // character selection

            float start = papplet.width * .1f;
            float end = papplet.width * .9f;

            papplet.textSize(dy);

            for (int i=0; i<characters.length(); i++)
            {
                float x = papplet.map(i, 0, characters.length(), start, end);

                papplet.fill(i == characterIndex ? papplet.color(0, 255, 0) : 128);
                papplet.text(characters.substring(i, i+1), x, y);
            }
        }
        else        
        {
            papplet.text("GAME OVER", papplet.width/2, y);
            y += dy*2;

            papplet.text("press enter to play again", papplet.width/2, y);
        }

        y += dy*3;

        // scores

        float x1 = papplet.width * .4f;
        float x2 = papplet.width * .5f;

        papplet.textSize(dy*2/3);
        papplet.textAlign(PApplet.LEFT);

        for (Entry e : entries)
        {
            if (state == State.NewHighScore && e == newEntry)
                papplet.fill(0, 0, 255);
            else
                papplet.fill(0, 255, 0);

            papplet.text(e.score, x1, y);
            papplet.text(e.name, x2, y);
            y += dy;
        }

        y += dy;

    }

    private void keyPressedNewHighScore()
    {
        if (papplet.key == PApplet.RETURN || papplet.key == PApplet.ENTER)
        {
            state = State.ShowingHighScores;
            writeData();
        }
        else if (papplet.key == PApplet.BACKSPACE || papplet.key == PApplet.DELETE)
        {
            if (newEntry.name.length() > 0)
                newEntry.name = newEntry.name.substring(0, newEntry.name.length()-1);
        }
        else if (papplet.keyCode == PApplet.LEFT)
        {
            if (characterIndex > 0) characterIndex--;
        }
        else if (papplet.keyCode == PApplet.RIGHT)
        {
            if (characterIndex + 1 < characters.length()) characterIndex++;
        }
        else if (papplet.key == ' ')
        {
            newEntry.name = newEntry.name + characters.charAt(characterIndex);
        }
        else if (papplet.key == ',')
        {
            int length = newEntry.name.length();
            if (length > 0)
                newEntry.name = newEntry.name.substring(0, length-1);
        }
        else
        {
            newEntry.name = newEntry.name + papplet.key;
        }
    }

    private void keyPressedShowingHighScores()
    {
        if (papplet.key == PApplet.RETURN || papplet.key == PApplet.ENTER)
            showing = false;
    }
}


