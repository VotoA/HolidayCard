import java.io.IOException;
import java.io.File;
import java.util.Scanner;
import static java.lang.System.*;
String strOne;
String strTwo;
String strThree;
String strFour;
Scanner fileOne;
Scanner fileTwo;
Scanner fileThree;
Scanner fileFour;
StringParser one;
StringParser two;
StringParser three;
StringParser four;
void setup() {
  try {
    fileOne = new Scanner(new File("C:/Users/Anthony/Desktop/HoD.txt"));
    while (fileOne.hasNextLine()) {
      strOne += fileOne.nextLine()+"\n";
    }
    one = new StringParser(strOne);
  } 
  catch (Exception FileNotFoundException) {
    out.println("File not found");
  }
  try {
    fileTwo = new Scanner(new File("C:/Users/Anthony/Desktop/Frank.txt"));
    while (fileTwo.hasNextLine()) {
      strTwo += fileTwo.nextLine()+"\n";
    }
    two = new StringParser(strTwo);
  } 
  catch (Exception FileNotFoundException) {
    out.println("File not found");
  }
  try {
    fileThree = new Scanner(new File("C:/Users/Anthony/Desktop/MD.txt"));
    while (fileThree.hasNextLine()) {
      strThree += fileThree.nextLine()+"\n";
    }
    three = new StringParser(strThree);
  } 
  catch (Exception FileNotFoundException) {
    out.println("File not found");
  }
  try {
    fileFour = new Scanner(new File("C:/Users/Anthony/Desktop/HFinn.txt"));
    while (fileFour.hasNextLine()) {
      strFour += fileFour.nextLine()+"\n";
    }
    four = new StringParser(strFour);
  } 
  catch (Exception FileNotFoundException) {
    out.println("File not found");
  }
  background (0);
  size(800, 800);
}
void draw() {
  background(0);
  noStroke();
  fill(255, 255, 255);
  rect(398, 0, 4, 800);
  rect(0, 398, 800, 4);
  if (mouseX < 400 && mouseY < 400) {
    textSize(30);
    text("Heart of Darkness", 25, 30);
    textSize(20);
    text("Words: " + one.countWords(), 25, 65);
    text("Vowels: " + one.countVowels(), 25, 100);
    text("Syllables: " + one.countSyllables(), 25, 135);
    text("Sentences: " + one.countSentences(), 25, 170);
    text("Flesch Reading Ease Score: " + one.getEaseScore(), 25, 205);
    text("Flesch Reading Ease Level: " + one.getEaseLevel(), 25, 240);
  } else if (mouseX > 400 && mouseY < 400) {
    textSize(30);
    text("Frankenstein", 425, 30);
    textSize(20);
    text("Words: " + two.countWords(), 425, 65);
    text("Vowels: " + two.countVowels(), 425, 100);
    text("Syllables: " + two.countSyllables(), 425, 135);
    text("Sentences: " + two.countSentences(), 425, 170);
    text("Flesch Reading Ease Score: " + two.getEaseScore(), 425, 205);
    text("Flesch Reading Ease Level: " + two.getEaseLevel(), 425, 240);
  } else if (mouseX < 400 && mouseY > 400) {
    textSize(30);
    text("Moby Dick", 25, 430);
    textSize(20);
    text("Words: " + three.countWords(), 25, 465);
    text("Vowels: " + three.countVowels(), 25, 500);
    text("Syllables: " + three.countSyllables(), 25, 535);
    text("Sentences: " + three.countSentences(), 25, 570);
    text("Flesch Reading Ease Score: " + three.getEaseScore(), 25, 605);
    text("Flesch Reading Ease Level: " + three.getEaseLevel(), 25, 640);
  } else if (mouseX > 400 && mouseY > 400) {
    textSize(30);
    text("Huckleberry Finn", 425, 430);
    textSize(20);
    text("Words: " + four.countWords(), 425, 465);
    text("Vowels: " + four.countVowels(), 425, 500);
    text("Syllables: " + four.countSyllables(), 425, 535);
    text("Sentences: " + four.countSentences(), 425, 570);
    text("Flesch Reading Ease Score: " + four.getEaseScore(), 425, 605);
    text("Flesch Reading Ease Level: " + four.getEaseLevel(), 425, 640);
  }
}
public class StringParser {
  public String string;
  public StringParser(String s) {
    string = s;
  }
  public int countWords() {
    int count = 0;
    char[] array = string.toCharArray();
    for (char ch : array) {
      if (ch==' ' || ch=='-') {
        count++;
      }
    }
    //count = count + count/12;
    return count;
  }
  public int countVowels() {
    int number = 0;
    char[] array = string.toCharArray();
    for (char ch : array) {
      if (ch=='a' || ch=='A' || ch=='e' || ch=='E' || ch=='i' || ch=='I' || ch=='o' || ch=='O' || ch=='u' || ch=='U' || ch=='y') {
        number++;
      }
    }
    return number;
  }
  public int countSyllables() {
    int number = 0;
    int last = -2;
    String[] stringArray = split(string, ("[\\,!\\s]+"));
    for (String str : stringArray) {
      char[] charArray = str.toCharArray();
      last = -2;
      for (int i = 0; i < charArray.length; i++) {
        if (charArray[i]=='a' || charArray[i]=='i' || charArray[i]=='o' || charArray[i]=='u' || charArray[i]=='y') {
          if (i - 1 != last) {
            number++;
            last = i;
          }
        }
        if (charArray[i]=='e' && i != charArray.length-1) {
          number++;
          last = i;
        }
        if (charArray[i]=='A' || charArray[i]=='E' || charArray[i]=='I' || charArray[i]=='O' || charArray[i]=='U') {
          if (charArray[i+1]!='.') {
            number++;
            last = i;
          }
        }
      }
    }
    return number;
  }
  public int countSentences() {
    int number = 0;
    char[] array = string.toCharArray();
    for (int i = 0; i < array.length; i++) {
      if (array[i]=='?' || array[i]=='!') {
        number++;
      }
      if (array[i]=='.') {
        if (Character.isLowerCase(array[i-1]) == true) {
          number++;
        }
      }
    }
    return number;
  }
  public int getEaseScore() {
    return (int)(206.835 - ((1.015*(countWords()/countSentences())) - (84.6*(countSyllables()/countWords()))));
  }
  public int getEaseLevel() {
    return (int)(((0.39*(countWords()/countSentences())) - (11.8*(countSyllables()/countWords()))) - 15.59);
  }
}
