#!/usr/bin/python
import cgi
import cgitb; cgitb.enable()
from pysqlite2 import dbapi2 as sqlite
import sys

SQLITE_DB = "/www/patrick/party/wineAboutTheElection/registration.sqlite"

def db_connect():
    """Connect to the database"""
    con = sqlite.connect(SQLITE_DB)
    cur = con.cursor()
    return con, cur

def raise_error(errmsg):
    """Simple stupid error handler"""
    print "Content-type: text/html\n\n"
    print "<html><body><h1>I know your type!</h1><p>You've managed to break something.  The error is:<br/>%s</body></html>" % (errmsg)
    sys.exit()

def decode_party(party):
    pmapping = {"red": "American Red Traditionalist",
                "white": "Chilled Whites",
                "other": "Fruit, Rose, and Ice Coalition",
                "cheese": "Wisconsin Dairy Farmers Union",
                "prohibition": "Pennsylvanian Prohibitionist Party",
                "driver": "Americans United for Transportation"}
    return pmapping[party];

def voterrolls(conn, cur):
    query = """select firstname, lastname, party from voters where firstname != "" and lastname != "" and party != "" order by lastname, firstname, create_date desc"""
    cur.execute(query)
    res = cur.fetchall()
    rolls = """<table><tr><th>Last Name</th><th>First Name</th><th>Party</th></tr>\n"""
    lastfirst = None
    lastlast = None
    for thisres in res:
        if lastfirst == thisres[0] and lastlast == thisres[1]:
            continue
        rolls = rolls + "<tr><td>%s</td><td>%s</td><td>%s</td>\n" % (thisres[1], thisres[0], decode_party(thisres[2]))
        lastfirst = thisres[0]
        lastlast = thisres[1]
    rolls = rolls + "</table>\n"
    return rolls

def show_thankyou(firstname, lastname, party, conn, cur):
    """Show a thank you for registering page"""
    print """Content-type: text/html\n\n
<html>
<head>
  <title>Thanks for Registering!</title>
</head>
<body>
  <h1>Thank you for registering!</h1>
  Dear %s %s,<br/>
  You have been successfully registered to wine about the election with the %s party.  If you need to change your status, please contact
  one of the election judges.
  <br/><br/>Thank You,<br/>
  Patrick and Kristina Wagstrom<br/>
  <br/>
  <br/>
  <h2>List of Registered Voters</h2>
  %s
</body>
</html>
""" % (firstname, lastname, decode_party(party), voterrolls(conn, cur))

def trunc_value(form, field, length):
    value = form.getvalue(field)
    if value == None:
        value = ""
    return value[:length]

def process_registration_form():
    """Main handler for processing the registration forms for people"""
    conn, cur = db_connect()

    form = cgi.FieldStorage()
    citizen = form.getvalue("citizen") == "yes"
    ofage = form.getvalue("ofage") == "yes"
    salut = trunc_value(form, "salut", 5)
    firstName = trunc_value(form, "firstName", 63)
    lastName = trunc_value(form, "lastName", 63)
    middleName = trunc_value(form, "middleName", 63)
    address = trunc_value(form, "address", 255)
    apt = trunc_value(form, "apt", 6)
    state = trunc_value(form, "state", 6)
    zipcode = trunc_value(form, "zipCode", 10)
    phone = trunc_value(form, "telephoneNumber", 20)
    email = trunc_value(form, "emailAddress", 255)
    municipality = trunc_value(form, "municipality", 63)
    county = trunc_value(form, "county", 63)
    dob = trunc_value(form, "dob", 20)
    race = trunc_value(form, "race", 63)
    party = trunc_value(form, "party", 20)
    others = trunc_value(form, "otherpeople", 255)
    initials = trunc_value(form, "initials", 63)

    if len(firstName) == 0:
        raise_error("invalid first name, try again bucko!")
    if len(lastName) == 0:
        raise_error("invalid last name, try again bucko!")
    if len(initials) == 0:
        raise_error("invalid initials, try again bucko!")

    if party not in ["red", "white", "other", "cheese", "prohibition", "driver"]:
        raise_error("invalid party")

    """
Create table voters (
       id integer primary key autoincrement not null,
       citizen varchar(8),
       ofage varchar(8),
       salut varchar(8),
       firstname varchar(64) not null,
       lastname varchar(64) not null,
       middlename varchar(64),
       address varchar(255),
       apt varchar(8),
       state varchar(8),
       zipcode varchar(12),
       phone varchar(32),
       email varchar(255),
       municipality varchar(64),
       county varchar(64),
       dob varchar(32),
       race varchar(64),
       party varchar(20),
       others varchar(255),
       initials varchar(12),
       create_date datetime default null);
create trigger voters_create_date after insert on voters
begin
  update voters set create_date=DATETIME('NOW') where rowid = new.rowid;
end;
    """
    query = """insert into voters(citizen, ofage, salut, firstname, lastname, middlename, address, apt, state,
                                  zipcode, phone, email, municipality, county, dob, race, party, others, initials)
                           values(?, ?, ?, ?, ?, ?, ?, ?, ?,
                                  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    cur.execute(query, (citizen, ofage, salut, firstName, lastName, middleName, address, apt, state,
                        zipcode, phone, email, municipality, county, dob, race, party, others, initials))
    conn.commit()

    show_thankyou(firstName, lastName, party, conn, cur)
    
if __name__ == "__main__":
  process_registration_form()
