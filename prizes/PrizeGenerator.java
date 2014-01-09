package prizes;
import java.io.*;
import java.util.Random;
import java.util.List;
import java.util.ArrayList;
class PrizeGenerator 
{
  private static class Member
  {
    String name;
    int low;
    int high;
    boolean received = false;
    public Member(String name, int low, int high) 
    {
      this.name = name;
      this.low = low;
      this.high = high;
    }
  }

  private static class PrizeDrawingHat
  {
    List<Member> members;
    int totalWeight;
    Random r = new Random();
    public boolean add(Member m)
    {
      return members.add(m);
    }
    public PrizeDrawingHat(String filename)
    {
      members = new ArrayList<Member>();
      try(BufferedReader br = new BufferedReader(new FileReader(filename)))
      {
        String line = br.readLine();
        int sum = 0;
        while(line != null)
        {
          String[] fields = line.split(":");
          String name = fields[0];
          int score = Integer.parseInt(fields[1]);
          this.add(new Member(name, sum, sum+score-1));
          sum += score;
          line = br.readLine();
        }
        totalWeight = sum;
      }
      catch(Exception e)
      {
        System.out.println(e.getMessage());
        System.out.println("Make sure the input file is in the format username:score with nothing else and try again");
        System.exit(1);
      }
    }
    public Member draw() throws Exception
    {
      int choice = r.nextInt(totalWeight);
      for(Member m: members)
      {
        if(choice <= m.high && choice >= m.low)
        {
          return m;
        }
      }
      throw new Exception("Invalid choice specified: " + choice);
    }
  }
  public static void doDrawing(String filename, int numPrizes) throws Exception
  {
    PrizeDrawingHat hat = new PrizeDrawingHat(filename);
    for(int i = 0; i < numPrizes; ++i)
    {
      Member m;
      do
      {
        m = hat.draw();
      } while(m.received);
      System.out.println(m.name + " has won prize " + i);
      m.received = true;
    }
  }

  public static void main(String[] args)
  {
    if(args.length != 2)
    {
      System.out.println("Please input a filename (username:score format please) and the number of prizes");
      return;
    }
    try 
    {
      doDrawing(args[0], Integer.parseInt(args[1]));
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  }
}
