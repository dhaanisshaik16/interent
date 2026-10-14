# LearnLite — Learn Anywhere. Even Without Internet.

> **Offline-First Digital Education Platform for Rural and Underserved Communities**  
> *Category: Education Technology, Offline-First Learning, Digital Inclusion*

---

## 1. Project Overview & Problem Statement

### The Problem
Students in rural and underserved communities face profound barriers to digital education:
- **Unreliable & Expensive Internet:** Frequent network dropouts, 2G/3G speeds, and high mobile data costs prevent students from streaming video lectures or accessing cloud-dependent LMS platforms.
- **Shared Smartphones:** Multiple siblings often share a single budget smartphone when parents return home from work, risking overwritten study records.
- **Severe Device Storage Constraints:** Low-end Android devices with 16 GB or 32 GB total storage cannot store gigabytes of video or bloated apps.

### The LearnLite Solution
**LearnLite** is a lightweight, offline-first digital learning web application built as an installable Progressive Web App (PWA). It allows students to:
1. **Download Learning Materials:** Save full courses in under 20 KB per lesson.
2. **Learn 100% Offline:** Read structured lessons, take notes, and complete quizzes without any network connection.
3. **Persist Progress Locally:** Maintain durable reading positions, bookmarks, and quiz scores in browser IndexedDB.
4. **Share Resources Device-to-Device:** Transfer educational `.learnlite` packages directly to nearby peers using Nearby Share, Bluetooth, or SD Cards.
5. **Durable Cloud Synchronization:** Queue offline activities in an IndexedDB operations queue and synchronize when internet returns without faking server status.

---

## 2. Technology Stack

- **Frontend Framework:** React 18 with TypeScript and Vite.
- **Styling & UI:** Tailwind CSS with dark mode, high contrast, and responsive layout.
- **Icons & Charts:** Lucide React icons, Recharts for progress analytics.
- **Routing:** React Router v6.
- **Offline Storage:** IndexedDB managed via the `idb` library.
- **PWA & Caching:** Service Worker with Workbox static asset caching and offline fallback (`offline.html`).
- **Package Format:** Versioned JSON `.learnlite` format with schema validation and sanitization.
- **Localization:** Full English and Telugu (తెలుగు) language dictionaries and font support.
- **Testing:** Vitest with jsdom and fake-indexeddb.

---

## 3. Key Features

- **16 Full Routes:**
  - `/` — Public landing page explaining the problem, 3-step offline flow, and interactive preview.
  - `/dashboard` — Student dashboard with learning streak, offline courses count, storage meter, and continue learning action.
  - `/courses` — Searchable and filterable course library with 1-click offline saving.
  - `/courses/:courseId` — Course syllabus, learning objectives, and quiz links.
  - `/learn/:lessonId` — Offline-first distraction-free lesson reader with auto-saved reading positions, local study notes, bookmarking, and text resize controls.
  - `/quiz/:quizId` — Interactive offline quiz engine supporting multiple-choice, true/false, multi-select, and short-answer questions with instant local scoring and review explanations.
  - `/downloads` — Downloads manager with `navigator.storage.estimate()` meter, low storage alerts, and selective course removal without erasing progress.
  - `/progress` — Visual learning analytics with Recharts (subject completion bar chart & quiz score trends).
  - `/share` — Educational resource sharing (`.learnlite` export and import with validation).
  - `/sync` — Durable synchronization center with live connectivity heartbeat and honest backend status.
  - `/achievements` — 6 dynamic milestones calculated from real database records.
  - `/teacher` — Teacher portal with curriculum review and classroom statistics.
  - `/teacher/content` — Teacher content authoring studio for custom courses, lessons, and quizzes.
  - `/settings` — Preferences for language, theme, low-data mode, data backup, and demo reset.
  - `/about` — Technical architecture and social impact overview.
  - `/login` — Shared-device profile switcher supporting multiple family learners.

---

## 4. Preloaded Sample Courses (Bilingual English & Telugu)

1. **Mathematics: Fractions and Decimals** (3 Lessons + Quiz)
   - *Lesson 1:* Understanding Fractions: Parts of a Whole
   - *Lesson 2:* Converting Fractions to Decimals and Percentages
   - *Lesson 3:* Real-World Math: Land, Cooking & Budgeting
2. **Science: The Solar System and Space** (3 Lessons + Quiz)
   - *Lesson 1:* The Sun and Terrestrial Planets
   - *Lesson 2:* The Gas Giants and the Asteroid Belt
   - *Lesson 3:* Space Exploration, Satellites & ISRO Missions
3. **English: Grammar and Sentence Formation** (3 Lessons + Quiz)
   - *Lesson 1:* The 8 Parts of Speech in Daily Life
   - *Lesson 2:* Subject-Verb Agreement and Tenses
   - *Lesson 3:* Building Clear & Persuasive Sentences
4. **Computer Basics: Hardware & Operating Systems** (3 Lessons + Quiz)
   - *Lesson 1:* How a Computer Thinks: CPU, RAM and Storage
   - *Lesson 2:* Input, Output and Motherboard Buses
   - *Lesson 3:* Operating Systems and File Systems
5. **Digital Literacy: Internet Safety and Cybersecurity** (3 Lessons + Quiz)
   - *Lesson 1:* Staying Safe Online and Spotting Phishing Scams
   - *Lesson 2:* Passwords, Passphrases and Shared-Phone Security
   - *Lesson 3:* Evaluating Digital Information & Fact-Checking

---

## 5. Getting Started & Development

### Prerequisites
- Node.js (v18 or higher) and npm

### Installation
```bash
# Clone the repository
git clone https://github.com/your-username/learnlite.git
cd learnlite

# Install dependencies
npm install
```

### Running the Development Server
```bash
npm run dev
```
Open `http://localhost:5173` in your browser.

### Running Automated Tests
```bash
npm test
```
All 21 Vitest tests verify IndexedDB persistence, quiz scoring, package validation, sync queues, and localization.

### Creating a Production Build
```bash
npm run build
```
Generates the optimized static distribution and PWA service worker in `dist/`.

---

## 6. How to Perform the Genuine Offline Test

To test genuine offline functionality:

1. Open LearnLite in Google Chrome or any modern browser at `http://localhost:5173` (or the production build via `npm run preview`).
2. Navigate to the **Course Library** (`/courses`) and confirm that sample courses are saved for offline use.
3. Open Developer Tools (`F12`), switch to the **Network** tab, and select **Offline** from the throttling dropdown (or turn off Wi-Fi on your physical device).
4. Notice the offline status badge updates to **Offline Mode**.
5. Navigate to any lesson (e.g. *Fractions: Parts of a Whole* at `/learn/lesson_math_1`).
6. Scroll down to read, adjust the text size, and type notes in the **Personal Study Notes** field.
7. Click **Mark as Complete**.
8. Go to the course quiz (`/quiz/quiz_math_fractions`) and complete the assessment while offline.
9. Click **Submit Quiz Answers**. Notice the quiz grades instantly on device, saves the score, and displays comprehensive explanations!
10. **Refresh the browser while still completely offline.**
11. Observe that all lesson progress, notes, reading position, and quiz scores remain **100% intact**!
12. Navigate to the **Sync Center** (`/sync`) to inspect the pending operations queued durably in IndexedDB.

---

## 7. Hackathon Judge Demonstration Sequence

Judges can evaluate the end-to-end user journey in under 3 minutes:

1. **Step 1: Dashboard Overview:** Open `/dashboard` to see student profile "Priya Sharma", active learning streak, storage usage (~15 KB), and the Continue Learning card.
2. **Step 2: Language Switching:** Click the language pill in the top navigation to switch between **English** and **తెలుగు (Telugu)**. Notice interface and lesson content translate seamlessly without erasing progress.
3. **Step 3: Offline Experience:** Disconnect the internet or set DevTools to Offline. Read a lesson, write study notes, and submit a quiz.
4. **Step 4: Resource Sharing:** Go to `/share`. Select a course and click **Export & Share Package**. This generates a `.learnlite` file. Click the import zone to import a package and watch it validate schema, detect duplicates, and ingest cleanly into IndexedDB.
5. **Step 5: Shared Device Profile Switcher:** Click the learner avatar in the navbar or open `/login`. Switch to "Rahul Verma" to see individual profile separation on a shared device.
6. **Step 6: Sync Center & Honest Sync:** Open `/sync` to review queued offline operations. Notice LearnLite never fakes server success when cloud infrastructure is disconnected. Toggle the **Judge Mock Server Simulator** to observe queue drainage when a server connection is established.

---

## 8. Resource Sharing Package Specification (`.learnlite`)

LearnLite packages use a structured JSON schema:
```json
{
  "format": "learnlite-package",
  "version": "1.0",
  "packageId": "pkg_course_math_fractions_1713000000",
  "title": "Mathematics: Fractions and Decimals",
  "description": "Master fractions, proper/improper types, decimals conversion...",
  "exportedAt": "2026-10-14T10:00:00.000Z",
  "source": "LearnLite Educational Engine",
  "courses": [...],
  "lessons": [...],
  "quizzes": [...]
}
```
### Security & Validation Rules:
- Packages larger than 15 MB are rejected.
- Schema format header must strictly match `learnlite-package`.
- Text strings are sanitized against script injection (`<script>` removal).
- Existing student progress is preserved during course package imports.

---

## 9. Optional Cloud Backend (Supabase Setup)

LearnLite runs 100% independently in local/demo mode without any backend. To connect a live Supabase PostgreSQL backend for multi-device synchronization:

1. Create a Supabase project at [supabase.com](https://supabase.com).
2. Create tables for `student_progress`, `quiz_attempts`, and `bookmarks` matching the schema in `src/types/index.ts`.
3. Copy `.env.example` to `.env`:
   ```bash
   cp .env.example .env
   ```
4. Set your credentials:
   ```env
   VITE_SUPABASE_URL=https://your-project.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key
   ```
5. Rebuild or restart the app. The Sync Center will automatically detect the reachable Supabase backend and synchronize queued operations!

---

## 10. Privacy and Data Storage

- All educational content, quiz attempts, study notes, and reading positions are stored inside the browser's sandboxed **IndexedDB** on the user's device.
- No personal information or tracking telemetries are transmitted without explicit user synchronization.
- Users can export a complete JSON backup of their learner profile at any time from `/settings`.

---

## 11. Known Browser Limitations

- **Service Worker Availability:** Requires `localhost` or an `HTTPS` origin to register.
- **Storage Quota:** Browser storage limits vary by operating system. LearnLite includes a storage estimation monitor (`navigator.storage.estimate()`) and alerts users if remaining storage drops below 50 MB.
- **Direct Nearby Transfer:** Web browsers do not support direct Bluetooth socket discovery between two arbitrary phones without native companion apps or WebRTC signaling. LearnLite uses the native Web Share API with fallback to verified file packages.

---

## 12. License

LearnLite is open source and licensed under the [MIT License](LICENSE).
Built with passion for digital inclusion and educational equity.
