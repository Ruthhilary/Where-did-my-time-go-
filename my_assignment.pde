
MoodDot[] dots = new MoodDot[100];
int selectedDot = -1;

color backgroundColour;
color inkColour;
color mutedColour;

void setup() {
  size(800, 880);
  smooth();

  backgroundColour = color(250, 247, 240);
  inkColour = color(43, 40, 47);
  mutedColour = color(125, 119, 124);

  String[] moods = {
    "Orange", "Purple", "Orange", "Orange", "Green",
    "Green", "Purple", "Purple", "Red", "Orange",
    "Orange", "Green", "Green", "Purple", "Purple",
    "Purple", "Red", "Red", "Orange", "Orange",
    "Green", "Green", "Purple", "Orange", "Orange",
    "Green", "Purple", "Purple", "Purple", "Orange",
    "Green", "Orange", "Green", "Green", "Purple",
    "Orange", "Orange", "Purple", "Green", "Green",
    "Green", "Orange", "Purple", "Green", "Purple",
    "Purple", "Orange", "Purple", "Purple", "Orange",
    "Green", "Purple", "Orange", "Orange", "Green",
    "Red", "Red", "Orange", "Purple", "Orange",
    "Orange", "Green", "Purple", "Orange", "Green",
    "Green", "Purple", "Green", "Green", "Orange",
    "Purple", "Green", "Purple", "Orange", "Orange",
    "Purple", "Purple", "Green", "Orange", "Purple",
    "Green", "Green", "Orange", "Purple", "Purple",
    "Orange", "Green", "Red", "Red", "Orange",
    "Purple", "Red", "Orange", "Orange", "Green",
    "Orange", "Green", "Green", "Purple", "Orange"
  };

  String[] dates = {
    "Mon 12 Oct", "Tue 13 Oct", "Wed 14 Oct",
    "Thu 15 Oct", "Fri 16 Oct", "Sat 17 Oct",
    "Sun 18 Oct", "Mon 19 Oct", "Tue 20 Oct",
    "Wed 21 Oct", "Thu 22 Oct", "Fri 23 Oct",
    "Sat 24 Oct", "Sun 25 Oct", "Mon 26 Oct",
    "Tue 27 Oct", "Wed 28 Oct", "Thu 29 Oct",
    "Fri 30 Oct", "Sat 31 Oct", "Sun 1 Nov",
    "Mon 2 Nov", "Tue 3 Nov",

    "Mon 12 Oct", "Mon 12 Oct", "Mon 12 Oct",
    "Mon 12 Oct", "Tue 13 Oct", "Tue 13 Oct",
    "Tue 13 Oct", "Tue 13 Oct", "Wed 14 Oct",
    "Wed 14 Oct", "Wed 14 Oct", "Wed 14 Oct",
    "Thu 15 Oct", "Thu 15 Oct", "Thu 15 Oct",
    "Thu 15 Oct", "Fri 16 Oct", "Fri 16 Oct",
    "Fri 16 Oct", "Fri 16 Oct", "Sat 17 Oct",
    "Sat 17 Oct", "Sat 17 Oct", "Sat 17 Oct",
    "Sun 18 Oct", "Sun 18 Oct", "Sun 18 Oct",
    "Sun 18 Oct", "Mon 19 Oct", "Mon 19 Oct",
    "Mon 19 Oct", "Mon 19 Oct", "Tue 20 Oct",
    "Tue 20 Oct", "Tue 20 Oct", "Tue 20 Oct",
    "Wed 21 Oct", "Wed 21 Oct", "Wed 21 Oct",
    "Wed 21 Oct", "Thu 22 Oct", "Thu 22 Oct",
    "Thu 22 Oct", "Thu 22 Oct", "Fri 23 Oct",
    "Fri 23 Oct", "Fri 23 Oct", "Fri 23 Oct",
    "Sat 24 Oct", "Sat 24 Oct", "Sat 24 Oct",
    "Sat 24 Oct", "Sun 25 Oct", "Sun 25 Oct",
    "Sun 25 Oct", "Sun 25 Oct", "Mon 26 Oct",
    "Mon 26 Oct", "Mon 26 Oct", "Mon 26 Oct",
    "Tue 27 Oct", "Tue 27 Oct", "Tue 27 Oct",
    "Tue 27 Oct", "Wed 28 Oct", "Wed 28 Oct",
    "Wed 28 Oct", "Wed 28 Oct", "Thu 29 Oct",
    "Thu 29 Oct", "Thu 29 Oct", "Thu 29 Oct",
    "Fri 30 Oct", "Fri 30 Oct", "Fri 30 Oct",
    "Fri 30 Oct", "Sat 31 Oct"
  };

  // Create 100 objects from the data.
  for (int i = 0; i < dots.length; i++) {
    int column = i % 10;
    int row = i / 10;

    float x = 115 + column * 63;
    float y = 270 + row * 49;

    dots[i] = new MoodDot(
      i + 1, dates[i], moods[i], x, y
    );
  }
}

void draw() {
  background(backgroundColour);

  drawHeading();
  drawLegend();
  drawGrid();
  drawSelectedInfo();
  drawFooter();
}


void drawHeading() {
  fill(inkColour);
  textAlign(LEFT, CENTER);
  textSize(31);
  text("My Mood in Dots", 55, 53);

  fill(mutedColour);
  textSize(14);
  text("100 observations • 12 October – 3 November",
       57, 88);

  stroke(inkColour);
  strokeWeight(1);
  line(55, 117, 745, 117);
}


void drawLegend() {
  String[] labels = {
    "Red", "Orange", "Green", "Purple"
  };

  for (int i = 0; i < labels.length; i++) {
    float x = 100 + i * 165;

    noStroke();
    fill(moodColour(labels[i]));
    ellipse(x, 157, 17, 17);

    fill(inkColour);
    textAlign(LEFT, CENTER);
    textSize(14);
    text(labels[i], x + 16, 157);
  }
}


void drawGrid() {
  for (int i = 0; i < dots.length; i++) {
    dots[i].display(i == selectedDot);
  }
}

// Show information about the selected observation.
void drawSelectedInfo() {
  stroke(220, 214, 205);
  strokeWeight(1);
  line(55, 780, 745, 780);

  fill(inkColour);
  textAlign(LEFT, CENTER);
  textSize(14);

  if (selectedDot == -1) {
    text("Click any dot to explore your data.",
         57, 808);
  } else {
    MoodDot chosen = dots[selectedDot];

    text("Observation " + chosen.number
         + "  •  " + chosen.date
         + "  •  " + chosen.mood,
         57, 808);
  }
}

void drawFooter() {
  fill(mutedColour);
  textAlign(LEFT, CENTER);
  textSize(11);
  text("A personal data diary • Each dot represents one observation",
       57, 850);
}


color moodColour(String mood) {
  if (mood.equals("Red")) {
    return color(204, 78, 72);
  } else if (mood.equals("Orange")) {
    return color(235, 145, 68);
  } else if (mood.equals("Green")) {
    return color(105, 157, 112);
  } else {
    return color(145, 112, 181);
  }
}


void mousePressed() {
  for (int i = 0; i < dots.length; i++) {
    if (dots[i].isMouseOver(mouseX, mouseY)) {
      selectedDot = i;
      return;
    }
  }

  selectedDot = -1;
}


class MoodDot {
  int number;
  String date;
  String mood;
  float x;
  float y;

  MoodDot(int number, String date, String mood,
          float x, float y) {
    this.number = number;
    this.date = date;
    this.mood = mood;
    this.x = x;
    this.y = y;
  }


  void display(boolean selected) {
    float diameter = selected ? 38 : 29;


    stroke(255);
    strokeWeight(selected ? 4 : 2);
    fill(moodColour(mood));
    ellipse(x, y, diameter, diameter);

  
    fill(inkColour);
    textAlign(CENTER, CENTER);
    textSize(9);
    text(number, x, y + 43);
  }

 
  boolean isMouseOver(float mouseX, float mouseY) {
    return dist(mouseX, mouseY, x, y) < 22;
  }
}
