import imaplib
import sys
import re
import time

OUTFILE="/home/patrick/mailcheck.csv"

M = imaplib.IMAP4_SSL("imap.gmail.com")
M.login(sys.argv[1], sys.argv[2])
inboxcount = int(M.select("INBOX")[1][0])
unseencount = int(re.search("UNSEEN (\d+)", M.status("INBOX", "(UNSEEN)")[1][0]).group(1))
allcount = int(M.select("[Gmail]/All Mail")[1][0])
allunseencount = int(re.search("UNSEEN (\d+)", M.status("[Gmail]/All Mail", "(UNSEEN)")[1][0]).group(1))
spamcount = int(M.select("[Gmail]/Spam")[1][0])
spamunseencount = int(re.search("UNSEEN (\d+)", M.status("[Gmail]/Spam", "(UNSEEN)")[1][0]).group(1))
currenttime = int(time.time())
M.logout()

f = open(OUTFILE, "a")
f.write("%d, %d, %d, %d, %d, %d, %d\n" % (currenttime, inboxcount, unseencount, allcount, allunseencount, spamcount, spamunseencount))
f.close()
