# python3 retrieve_password.py
# outputs passwords.csv

import secretstorage
import sqlite3
import os
import csv
from Crypto.Cipher import AES
from Crypto.Protocol.KDF import PBKDF2

bus = secretstorage.dbus_init()
collection = secretstorage.get_default_collection(bus)
for item in collection.get_all_items():
    if item.get_label() == 'Chromium Safe Storage':
        MY_PASS = item.get_secret()
        break
else:
    raise Exception('Chromium password not found!')

db = sqlite3.connect(os.getenv("HOME") + '/.config/chromium/Default/Login Data')

cursor = db.cursor()
cursor.execute('''SELECT signon_realm, username_value, password_value FROM logins WHERE LENGTH(password_value) != 0''')
all_rows = cursor.fetchall()

def clean(x): 
    return x[:-x[-1]].decode('utf8')

csvfile = open('passwords.csv', mode='w')
csvwrite = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

for entry in all_rows:
	entryl = list(entry)
	encrypted_value = entry[2]
	encrypted_value = encrypted_value[3:]
	salt = b'saltysalt'
	iv = b' ' * 16
	length = 16

	my_pass = MY_PASS
	iterations = 1

	key = PBKDF2(my_pass, salt, length, iterations)
	cipher = AES.new(key, AES.MODE_CBC, IV=iv)

	decrypted = cipher.decrypt(encrypted_value)
	entryl[2] = clean(decrypted)
	csvwrite.writerow(entryl)
