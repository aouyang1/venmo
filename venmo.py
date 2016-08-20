#!/bin/python

import sys
import os
import requests
import json
from datetime import datetime
from pprint import pprint

sess = requests.Session()
adapter = requests.adapters.HTTPAdapter(max_retries=5)
sess.mount('http://', adapter)
sess.mount('https://', adapter)

def collect_data_between(limit=20, page="https://venmo.com/api/v5/public?", folder="/data", start_dt="2016_08_01", end_dt="2016_08_01"):
    if not os.path.exists(folder):
	os.makedirs(folder)

    fname = "venmo_{}.json".format(start_dt)
    f_venmo = open(folder+"/"+fname, "w")

    start_year, start_month, start_day = map(lambda x: int(x), start_dt.split("_"))
    end_year, end_month, end_day = map(lambda x: int(x), end_dt.split("_"))

    epoch_dt = datetime(1970,1,1)
    start_ts = int((datetime(start_year, start_month, start_day) - epoch_dt).total_seconds())
    end_ts = int((datetime(end_year, end_month, end_day) - epoch_dt).total_seconds())

    page += "until={}".format(end_ts)

    while True:
        page = page.replace(":8100","")
        r = sess.get(page + "&limit={}".format(limit)).json()

        if len(r["data"]) == 0:
            return

        page = r["paging"]["next"]

        for item in r["data"]:
            dt = datetime.strptime(item["created_time"], "%Y-%m-%dT%H:%M:%SZ")
            ts = (dt - epoch_dt).total_seconds()

            if ts < start_ts:
                return
            else:
                f_venmo.write("{}\n".format(json.dumps(item)))


if __name__ == "__main__":
    args = sys.argv[1:]
    start_dt = args[0]
    end_dt = args[1]
    folder = args[2]
    collect_data_between(limit=1200, folder=folder, start_dt=start_dt, end_dt=end_dt)
