"""Remove retired Karousel settings without resetting unrelated KDE preferences."""

import re
import sys
from pathlib import Path


def clean_config(path):
    if not path.exists():
        return

    original = path.read_text()
    result = []
    group = ""
    for line in original.splitlines(keepends=True):
        header = re.match(r"^\[([^\]]+)\]", line)
        if header:
            group = header.group(1)

        key = line.partition("=")[0].strip().split("[", 1)[0]
        if path.name == "kwinrc":
            if group == "Script-karousel":
                continue
            if group == "Plugins" and key == "karouselEnabled":
                continue
        elif group == "kwin" and key.startswith("karousel-"):
            continue

        result.append(line)

    updated = "".join(result)
    if updated != original:
        path.write_text(updated)


if __name__ == "__main__":
    config_home = Path(sys.argv[1])
    for name in ("kwinrc", "kglobalshortcutsrc"):
        clean_config(config_home / name)
