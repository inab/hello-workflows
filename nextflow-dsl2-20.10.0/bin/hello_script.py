#!/usr/bin/env python

import datetime
import sys

if __name__ == "__main__":
    print(f"Right now it is {datetime.datetime.now().astimezone().isoformat()}")
    sys.exit(0)
