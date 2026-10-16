# ⏳ WHERE DID MY TIME GO?
### A Dear Data experiment in clock time, felt time, and the space between them.

<p align="center">
  <strong>100 OBSERVATIONS · 2 DIMENSIONS OF TIME · 1 RADIAL ARTWORK</strong>
</p>

<p align="center">
  <em>A minute can be measured. But can it be felt?</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/MADE_WITH-Processing-6B5B95?style=for-the-badge" alt="Made with Processing" />
  <img src="https://img.shields.io/badge/PROJECT-Dear_Data-FF895E?style=for-the-badge" alt="Dear Data project" />
  <img src="https://img.shields.io/badge/FORMAT-Data_Art-F2D8A7?style=for-the-badge" alt="Data art" />
</p>

---

## ◉ THE IDEA

We measure our lives in minutes, hours, and days. But our experience of time rarely feels so precise.

A difficult task can feel endless. An enjoyable conversation can disappear in seconds. Waiting five minutes can feel different from spending five minutes doing something we love.

**Where Did My Time Go?** investigates the distance between the time an activity actually takes and the time it feels like it takes.

Inspired by *Dear Data*, this project transforms everyday observations into a radial artwork using Processing. Instead of presenting the information as a conventional bar chart, each observation becomes a visual mark in a circular composition.

The result is a way to explore time as both a measurement and an experience.

## ✳️ ENTER THE DATA

<p align="center">
  <em>One activity. Two experiences. One visible difference.</em>
</p>

```text
                   FELT TIME
                       ●
                      / 
                     /  ← The difference
                    /
          CLOCK ●──●
                \
                 \
                  ◎
               THE CENTRE
```

Every observation has two durations:

- **Clock time** — the measured duration in minutes.
- **Felt time** — the estimated duration as experienced by the observer.

The artwork translates those values into two endpoints. Their separation represents the difference between the two recorded durations.

When the endpoints are close, the estimates are similar. When they are further apart, the difference becomes more visually prominent.

The artwork does not assume that one activity always feels longer than another. The data provides the starting point for exploration.

---

## 🎨 THE VISUAL LANGUAGE

The circle is more than a decorative choice. It is a metaphor for time: continuous, familiar, and deceptively simple.

| Visual element | Meaning |
|---|---|
| Angular position | Position of an observation in the dataset |
| Inner endpoint | Measured duration |
| Outer endpoint | Perceived duration |
| Distance between endpoints | Difference between measured and felt time |
| Colour | Activity category |
| Highlighted mark | Observation being explored |

The radial composition lets the viewer see individual observations and the overall pattern at the same time.

## 🧠 THE QUESTIONS

This project asks:

1. When does felt time differ from measured time?
2. Can visual patterns reveal differences that are difficult to notice in a table?
3. How might the activity itself influence our experience of duration?
4. Can ordinary personal observations become a form of creative expression?

These are questions to investigate, not conclusions assumed in advance.

---

## 💻 THE CODE BEHIND THE ART

The sketch is built using Processing's Java-based programming environment. Data is loaded from a CSV file, represented as objects, and translated into positions, lines, colours, and interactive selections.

### 01 — Representing an observation

Each `TimeEntry` object stores the information associated with one observation.

```java
class TimeEntry {
  String date;
  String activity;
  String category;

  int actualMinutes;
  int feltMinutes;

  TimeEntry(String date, String activity,
            String category, int actualMinutes,
            int feltMinutes) {

    this.date = date;
    this.activity = activity;
    this.category = category;
    this.actualMinutes = actualMinutes;
    this.feltMinutes = feltMinutes;
  }

  int getTimeDifference() {
    return feltMinutes - actualMinutes;
  }
}
```

The difference is calculated by subtracting measured duration from perceived duration.

- A positive result means the activity felt longer.
- A negative result means it felt shorter.
- Zero means both durations are equal.

### 02 — Turning time into geometry

A radial composition needs an angle and a distance from the centre.

```java
float angle = TWO_PI * i / entryCount;

float actualRadius = map(
  entry.actualMinutes,
  0, maxMinutes, 80, 220
);

float feltRadius = map(
  entry.feltMinutes,
  0, maxMinutes, 80, 220
);
```

The angle determines where the observation sits around the circle. The radius determines how far its endpoint extends from the centre.

The following example shows how two different radii create two endpoints:

```java
float actualX = centerX
  + cos(angle) * actualRadius;

float actualY = centerY
  + sin(angle) * actualRadius;

float feltX = centerX
  + cos(angle) * feltRadius;

float feltY = centerY
  + sin(angle) * feltRadius;
```

These coordinates can then be used to draw the visual connection between measured and felt time.

*Implementation note: these are explanatory examples. Match the variable names, scaling limits, and calculations to the final `.pde` file.*

### 03 — The sketch lifecycle

```java
void setup() {
  size(900, 900);
  smooth();

  // Load data and prepare the artwork.
}

void draw() {
  background(18, 17, 23);

  // Draw the radial composition.
  // Update hover and selection visuals.
}
```

`setup()` prepares the sketch once. `draw()` runs repeatedly, allowing the artwork to redraw and respond to interaction.

### 04 — From data to artwork

```text
time_data.csv
      |
      v
  Load observations
      |
      v
  TimeEntry objects
      |
      v
 Map duration to radius
      |
      v
 Draw radial marks
      |
      v
 Explore individual observations
```

This structure separates data loading, data representation, visual mapping, drawing, and interaction into manageable tasks.

---

## 📊 INSIDE THE DATASET

The included `time_data.csv` contains 100 illustrative example observations across 20 dates, from 12 October 2026 to 31 October 2026, with five observations per date.

**Important data note:** These records are examples, not Ruth's personally collected observations. They must not be presented as genuine personal measurements.

For a final submission based on personal experience, replace the illustrative records with observations you genuinely collect. Preserve the column names and the expected 100-row structure.

### Data dictionary

| Column | Description |
|---|---|
| `date` | Observation date in `YYYY-MM-DD` format |
| `observation` | Unique observation number, from 1 to 100 |
| `activity` | Activity being recorded |
| `category` | Category used for colour mapping |
| `actual_minutes` | Measured duration in minutes |
| `felt_minutes` | Estimated perceived duration in minutes |

### Example CSV record

```csv
date,observation,activity,category,actual_minutes,felt_minutes
2026-10-12,1,Studying,Study,60,90
```

This is a fictional example row to illustrate the format, not a claim about a real observation.

### Why collect the data?

The purpose is not to rank activities by productivity. It is to examine the relationship between a measurable quantity and a subjective estimate.

The quality of the interpretation depends on collecting observations consistently and recording genuine estimates rather than inventing patterns to fit the artwork.

---

## 🖱️ EXPLORE THE ARTWORK

Run the sketch in Processing and explore the marks using the mouse.

1. Move the cursor over a mark to inspect an observation, if hover detection is implemented.
2. Click a mark to select it, if click selection is implemented.
3. Compare its measured and perceived durations.
4. Look for patterns across categories and observations.

The goal is to encourage the viewer to move between the overall composition and the details behind individual marks.

*For the finished repository, add a real screenshot or GIF of the running sketch here.*

```markdown
![Where Did My Time Go? — screenshot of the running Processing artwork](images/where-did-my-time-go.png)
```

Save the actual screenshot at `images/where-did-my-time-go.png` before using this image link. The image is not included automatically by writing the Markdown.

---

## 🧩 CREATIVE CODING CONCEPTS

This project combines the technical concepts taught in creative coding with a personal question about everyday life.

| Topic | How it contributes |
|---|---|
| Dear Data | Everyday observations and visual encoding |
| Sketches | `setup()` and `draw()` |
| Variables | Coordinates, durations, colours, and selection state |
| Decisions | `if` and `else` for categories and highlighting |
| Methods | Separate tasks for loading, drawing, selection, and colour mapping |
| Interaction | Mouse movement and clicking |
| Loops and groups | Repeatedly processing observations and drawing marks |
| Classes and objects | `TimeEntry` represents an observation |
| Data visualisation | Translating structured data into a visual form |
| Computational thinking | Breaking a complex problem into smaller tasks |

Only describe features that are actually implemented in the final sketch.

## 🔬 DESIGN PROCESS — SCAMPER

**Substitute:** Replace a conventional bar chart with radial marks.

**Combine:** Represent measured duration, felt duration, and category in one composition.

**Adapt:** Borrow the familiar form of a clock face without reproducing a conventional clock.

**Modify:** Change radial distance to express differences between durations.

**Put to another use:** Turn time-tracking observations into material for a data artwork rather than a productivity report.

**Eliminate:** Remove the conventional timeline and most chart labels from the main composition.

**Reverse / Rearrange:** Arrange observations around a circle instead of displaying them in chronological rows.

The final reflection should explain which decisions worked, which did not, and what changed during development.

---

## 🚀 RUN IT LOCALLY

### Requirements

- Processing installed on your computer.
- `WhereDidMyTimeGo.pde`, the main sketch.
- `time_data.csv`, the dataset in the location expected by the code.

### Setup

1. Open Processing.
2. Create a sketch named `WhereDidMyTimeGo`.
3. Save `WhereDidMyTimeGo.pde` inside the sketch folder.
4. Put the CSV in the correct location for your code. If it uses Processing's standard `loadTable()` data-folder convention, place the CSV in the sketch's `data` folder.
5. Open the sketch and press **Run**.
6. If the CSV fails to load, check the filename, column headings, and folder location.

### Project structure

```text
WhereDidMyTimeGo/
├── WhereDidMyTimeGo.pde
├── README.md
├── time_data.csv
└── images/
    └── where-did-my-time-go.png
```

This shows the intended repository structure. The screenshot file must be created separately, and the CSV location should match the implementation.

---

## ⚠️ LIMITATIONS & REFLECTION

Felt time is a subjective estimate, not an objective measurement. An observer may remember an activity imperfectly, and the recorded activities may not represent every minute of a day.

The artwork can reveal differences between recorded durations. It cannot, on its own, explain why those differences occurred or establish a universal rule about how people experience time.

These limitations are part of the investigation. They encourage further questions about memory, attention, activity, and the way people experience everyday life.

## 🛠️ DEVELOPMENT & REPOSITORY

Document genuine progress as the project develops.

Possible milestones include:

- [ ] Establish the initial concept and sketch.
- [ ] Load and validate the dataset.
- [ ] Implement the `TimeEntry` class.
- [ ] Draw the radial marks.
- [ ] Implement and test selection and hover behaviour.
- [ ] Refine the colour mapping and legend.
- [ ] Capture the finished artwork.
- [ ] Complete the reflection using genuine observations.

Commit changes when they actually happen. Do not fabricate development history, backdate commits, or present illustrative records as personally collected data.

---

<p align="center">
  <strong>WE CAN MEASURE A MINUTE WITH A CLOCK.</strong>
  <br/>
  <em>But can a clock tell us what that minute felt like?</em>
</p>

<p align="center">
  <sub>WHERE DID MY TIME GO? · DEAR DATA · CREATIVE CODING WITH PROCESSING</sub>
</p>
