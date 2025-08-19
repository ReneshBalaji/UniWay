<!-- README: UniWay – Offline Campus Navigation for MUJ (Flutter) -->

<div align="center">
  <h1>📍 UniWay – Offline Campus Navigation for MUJ</h1>
  <p><i>Find your way around campus, anytime – no internet required.</i></p>

  <!-- Badges -->
  <p>
    <img src="https://img.shields.io/badge/Flutter-Framework-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
    <img src="https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
    <img src="https://img.shields.io/badge/OpenStreetMap-Offline%20Maps-7BBE55?style=for-the-badge&logo=openstreetmap&logoColor=white" alt="OpenStreetMap">
    <img src="https://img.shields.io/github/last-commit/ReneshBalaji/UniWay?style=for-the-badge" alt="Last Commit">
  </p>
</div>

<hr/>

<h2>✨ Features</h2>
<ul>
  <li>🚶 <b>Offline Navigation</b> – Maps and building data work without internet</li>
  <li>🗺️ <b>Interactive Map</b> – Smooth zoom &amp; pan with OpenStreetMap tiles</li>
  <li>🎬 <b>Splash Screen</b> – Clean animated app intro</li>
  <li>🏠 <b>Home Screen</b> – Campus overview with quick access to locations</li>
  <li>🏢 <b>Amenities</b> – Detailed info on library, academic blocks, hostels, etc.</li>
  <li>🎉 <b>Events</b> – Stay updated with campus events in one place</li>
  <li>🔎 <b>Smart Search</b> – Find buildings, amenities, and events instantly</li>
</ul>

<h2>📦 Tech Stack</h2>
<ul>
  <li><b>Flutter</b> – App framework</li>
  <li><b>Dart</b> – Programming language</li>
  <li><b>flutter_map</b> – OpenStreetMap integration (offline tiles)</li>
  <li><b>go_router</b> – Navigation &amp; routing</li>
  <li><b>provider</b> – State management</li>
  <li><b>shared_preferences</b> – Offline data storage</li>
  <li><b>cached_network_image</b> – Image caching</li>
</ul>

<h2>🚀 Getting Started</h2>

<h3>1) Clone the repo</h3>
<pre><code>git clone https://github.com/ReneshBalaji/UniWay.git
cd UniWay
</code></pre>

<h3>2) Install dependencies</h3>
<pre><code>flutter pub get
</code></pre>

<h3>3) Run the app</h3>
<pre><code>flutter run
</code></pre>

<h2>🏗️ App Structure (Flutter)</h2>
<pre><code>lib/
├── core/
│   ├── theme/                 # Colors, fonts, app-wide styling
│   └── utils/                 # Utility functions
├── features/
│   ├── home/                  # Splash + Home screen
│   ├── map/                   # Offline campus map
│   ├── amenities/             # Building/amenities screen
│   └── events/                # Events listing screen
├── shared/
│   ├── constants/             # App constants
│   ├── models/                # Data models (Building, Event, etc.)
│   └── widgets/               # Reusable widgets
└── main.dart                  # App entry point
</code></pre>

<h2>📌 Roadmap</h2>
<ul>
  <li>[ ] Add <b>offline turn-by-turn routing</b></li>
  <li>[ ] Support for <b>multiple campuses</b></li>
  <li>[ ] <b>Event reminders &amp; push notifications</b></li>
  <li>[ ] <b>Dark mode</b> support</li>
</ul>

<h2>⚠️ License Notice</h2>
<p><b>All rights reserved.</b><br/>
This project is private and not licensed for use, modification, or distribution.</p>
