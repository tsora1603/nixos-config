# Plasma Overdose — Classic Cream (Taskbar Fixed)

Based on the working All Icons Buttons edition.

## Fixed

1. **Restored pinned-launcher buttons** by retaining the unprefixed nine-slice
   frame (`center`, `top`, `left`, etc.). Plasma's documented five task
   states (`normal`, `focus`, `hover`, `minimized`, `attention`) are all present.
2. **Removed focus stripes** by replacing the old stack of 26 individually
   drawn 1px rectangles in each frame center with one solid rectangle.
   All tile geometry is compacted into solid contiguous rectangles to prevent
   resizing/rasterization seams.
3. **Wider buttons**: the source art's horizontal padding was reduced to 2px
   on each side (48px visible versus 42px in the original source).
4. **Distinct states retained**: raised beige for pinned/open, recessed bronze
   for focused, cream hover, pale minimized, amber attention.
5. **Original palette and brown hard shadows unchanged** (`#6A5C46`).

The actual task item dimensions are controlled by Plasma's Task Manager.
The Plasma style only supplies the task button backgrounds.

## Install

Extract the ZIP into `~/.local/share/plasma/desktoptheme/` and select
**Plasma Overdose — Classic Cream (Taskbar Fixed)** in System Settings >
Colors & Themes > Plasma Style. Log out and in if Plasma still shows the
previous version.
