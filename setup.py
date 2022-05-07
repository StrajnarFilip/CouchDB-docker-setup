#    Copyright 2022 Filip Strajnar

#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at

#        http://www.apache.org/licenses/LICENSE-2.0

#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

# Execute this script to generate docker compose
# file with secure password.
import os
safe_root_random=os.urandom(32).hex()

def render(safe_root_password: str) -> str:
    return f"""version: '3.0'
services:
  couchdb:
    build: "."
    restart: "always"
    volumes:
      - "./couchdb-data:/opt/couchdb/data"
      - "./cert:/cert"
    ports:
      ## Host locally:
      #- "5984:5984"
      #- "6984:6984"
      ## Or publicly:
      - "0.0.0.0:5984:5984"
      - "0.0.0.0:6984:6984"
    environment:
      COUCHDB_USER: admin
      COUCHDB_PASSWORD: {safe_root_password}"""

with open("docker-compose.yaml","w",encoding='utf-8') as file:
    file.write(render(safe_root_random))

print("You can start the script with: docker-compose up -d")
print("You can visit admin panel on: http://127.0.0.1:5984/_utils/")
print("You can safely visit admin panel with HTTPS on: https://127.0.0.1:6984/_utils/")
print(f"Admin password is: {safe_root_random}")
print(f"You can find the password at any time by looking at generated docker-compose.yaml")