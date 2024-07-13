On first host, create a dump of the db:
sudo -iu postgres
pg_dump -U username -W -F custom -b -v -f "/path/to/your/dumpfile.pgdump" your_database_name

move the dump file to second host:
scp /path/to/your/dumpfile.pgdump username@new_server_ip:/path/to/target/directory



======================================
second host



Postgresql Installation:

# Import the repository signing key:
sudo apt install curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc

# Create the repository configuration file:
sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Update the package lists:
sudo apt update

# Install the latest version of PostgreSQL:
# If you want a specific version, use 'postgresql-16' or similar instead of 'postgresql'
sudo apt -y install postgresql



sudo -iu postgres
psql -U username
CREATE DATABASE new_database_name;
CREATE ROLE root WITH LOGIN;
GRANT ALL PRIVILEGES ON DATABASE new_database_name TO root;

\password











DATABASE_URL=postgresql://postgres:postgres@localhost:5432/rootamin_ir
