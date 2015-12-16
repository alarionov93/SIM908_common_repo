import json 
import serial
import time
import sys

data_last = "data.json"
coords_log = "coords.log"

def read_file():
	with open(data, "r") as f:
		s = f.readline()
		try:
			obj = json.loads(s)
		except:
			obj = {"data": []}

	return obj

def read_serial(gps_str=''):
	splitted = gps_str.split(",")
	mode = splitted[0]
	lat = 0
	lon = 0
		
	if mode == "0":
		lat = float(splitted[2])
		lon = float(splitted[1])

		if lat > 0:
			lat = lat / 100

		if lon > 0:
			lon = lon / 100

	print("parsed: lat: %s; lon: %s" % (lat, lon))
	return [lat, lon]


def convert_coordinate(coord):
	degrees = float(coord[:2])
	min_sec = float(coord[2:]) / 60
	
	return degrees+min_sec


def read_coordinates(source) :
	route = []
	with open(source, "r") as f:
		for line in f.readlines():
			splitted = line.split(",")
			lat = splitted[0]
			lon = splitted[1]
			# speed = splitted[2]
			# course = splited[3]
			if float(lat) > 0 and float(lon) > 0:
				route.append([lat, lon])
			else:
				print("NULL coords!")
	return route


def write_file(obj):
	with open(data_last, "w") as f:
		f.write(json.dumps({
			"data": obj
			}))


def main():
	# source_str = ''
	# try:
	# 	print('skip')
	# 	source_str = sys.argv[1]
	# except:
	# 	exit(0)

	# try:
	# 	coords = read_coordinates(gps_log)
	# 	write_file(coords)
	# except KeyboardInterrupt:
	# 	print("Exiting...")
	# 	sys.exit(0)
	try:
		coords = read_coordinates(coords_log)
		write_file(coords)
	except KeyboardInterrupt:
		print("Exiting...")
		sys.exit(0)
	except Exception as e:
		print("We are fucked: %s" % e)
		sys.exit(1)



main()
