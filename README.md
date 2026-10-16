Where Did My Time Go?
Dear Data 100 — Creative Coding — Processing
Concept
Where Did My Time Go? compares measured time with perceived time. Each observation records an activity, how many minutes it actually lasted, and how long it felt. The sketch turns those observations into a radial artwork: one endpoint represents actual duration and the other represents felt duration. The gap between them makes the difference visible.
Important data note
time_data.csv contains 100 illustrative example observations, with five rows for each date from 12 October 2026 to 31 October 2026. They are not Ruth's real observations and must not be presented as personally collected data. Replace the example rows with observations you genuinely record before submitting the assignment. Keep the same column headings and 100-row structure.
Files
- WhereDidMyTimeGo.pde — Processing sketch.
- time_data.csv — 100 example observations.
- README.md — project explanation and run instructions.
Run it in Processing
1. Install and open Processing.
2. Create a sketch folder named WhereDidMyTimeGo.
3. Save WhereDidMyTimeGo.pde inside that folder.
4. Copy time_data.csv into the same sketch folder (alongside the .pde file).
5. Open the sketch and press Run.
6. Move the mouse over a mark or click a mark to inspect its date, activity, actual duration, felt duration and difference.
If Processing reports that it cannot find time_data.csv, check that the CSV is inside the sketch folder and that its filename matches exactly.
Data format
Column	Meaning
date	Observation date, in YYYY-MM-DD format
observation	Unique number from 1 to 100
activity	Activity observed
category	Category used to choose a colour
actual_minutes	Measured duration in minutes
felt_minutes	Estimated perceived duration in minutes


Visual encoding
- The angle around the centre represents the observation's position in the dataset.
- The inner endpoint is based on actual duration.
- The outer endpoint is based on perceived duration.
- The line between the endpoints represents the difference.
- Colour represents the activity category.
- Selecting or hovering over an observation reveals its details.
The artwork does not claim to measure subjective time objectively. felt_minutes is a personal estimate and should be described as such in the final reflection.
Creative coding topics used
This project uses only the relevant topics from the listed course material:
- Dear Data: a question about everyday life, collected observations and a visual key.
- Sketches: setup() and draw().
- Variables: positions, durations, colours and selection state.
- Decisions: if / else for categories and highlighting.
- Methods: separate methods for loading, drawing, selection and colour mapping; methods return values such as color and int.
- Interaction: mouse movement and clicking.
- Loops & Groups: loops process the observations and draw the artwork.
- Classes & Objects: each TimeEntry object stores one observation.
- Data Visualization / Data: a CSV table is loaded and represented visually.
- Art / Creativity: the radial distortion is a visual metaphor for the difference between clock time and felt time.
- Computational Thinking: the problem is divided into data loading, mapping, drawing and interaction.
Images, sound/video and 3D graphics are not used.
SCAMPER reflection prompts
Use these prompts to explain your own design decisions; adapt them to what you actually developed.
- Substitute: Instead of a conventional bar chart, I used radial marks.
- Combine: I combined measured duration, perceived duration and activity category in one composition.
- Adapt: I adapted the idea of a clock face to show subjective experience.
- Modify: I distorted the distance of each endpoint according to duration.
- Put to another use: I used time-tracking data as material for an artwork rather than a productivity report.
- Eliminate: I removed a standard timeline and most conventional chart labels from the main artwork.
- Reverse / Rearrange: I arranged observations around a circle rather than in chronological rows.
Make these statements accurate to your final version and discuss what worked, what did not, and what you changed.
GitHub and assessment evidence
Keep your development evidence honest and regular. Commit the sketch and data on separate days as you make real progress. For example:
1. Create initial sketch and concept
2. Add and check first collected observations
3. Implement TimeEntry class and radial marks
4. Add interaction and data details
5. Refine legend and final reflection
Only make commits when you have actually made those changes. Do not backdate commits or claim example data is personal data.
Limitations and reflection
The perceived duration is a subjective estimate. Activities may be remembered imperfectly, and the sample of activities is not a complete record of every minute. The artwork can help reveal differences between measured and felt time, but it cannot explain why each difference occurred.
