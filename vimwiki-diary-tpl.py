#!/usr/bin/env python3

from datetime import date

today = date.today()
d1 = today.strftime("%Y-%m-%d")

template = f"""# {d1}

## Notes

## Todo

- [ ]
"""

print(template)
