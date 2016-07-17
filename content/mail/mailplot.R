# R-Script to plot my mailbox data

DATAFILE = "/home/patrick/mailcheck.csv"
ORIGIN = ISOdatetime(1970,1,1,0,0,0, tz="UTC")

col.line = rgb(0.95, 0.2, 0.2, 0.6)
col.line2 = rgb(0.6, 0.6, 0.95, 0.6)
lwd.line = 2.0
lwd.line2 = 2.0
col.axis = rgb(0.70, 0.1, 0.1, 1.0)
col.axis.font = rgb(0.7, 0.7, 0.7, 1.0)
col.bg = rgb(0.0, 0.0, 0.0, 1.0)
lwd.axis = 2.0
font.axis = 2

maildata <- read.csv(DATAFILE, header=F)
names(maildata) <- c("date", "total", "unread", "allmail", "allunread", "spam", "spamunread")
maildata$date <- ORIGIN + maildata$date
maildata <- maildata[!is.na(maildata$unread),]

plot.day <- function(indata) {
    oldest.time <- Sys.time() - 86400
    indata <- indata[indata$date >= oldest.time,]
    generic.plot(indata, mode="daily")
}

plot.month <- function(indata) {
    oldest.time <- Sys.time() - 86400 * 30
    indata <- indata[indata$date >= oldest.time,]
    generic.plot(indata, mode="monthly")
}

plot.all <- function(indata) {
    generic.plot(indata, mode="all")
}

generic.plot <- function(indata, mode) {
    # svg(width=6, height=3, pointsize=8, file=sprintf("mail-%s.svg", mode))
    png(width=640, height=320, pointsize=12, file=sprintf("mail-%s.png", mode))
    # par(bg="black", mar=c(2.5,2,0.5,2)+0.1)
    par(bg="black", mar=c(2.5,2,0.5,2)+0.1, font=2)
    plot(x=indata$date, y=indata$unread, type="l", xlab="", ylab="",
         frame.plot=F, lwd=lwd.line, col=col.line, bg=col.bg, axes=F, ylim=c(0,max(indata$unread)))
    par(font=font.axis, font.lab=font.axis, font.axis=font.axis)
    # plot the red axis
    axis(side=2, at=pretty(range(append(indata$unread, 0), na.rm=T)),
         col.axis=col.line, fg=col.axis, line=-0.25, lwd=lwd.axis,
         font.axis=font.axis)
    #axis(side=1, at=pretty(range(maildata$date, na.rm=T)), col.axis=col.axis.font,
    #     fg=col.axis, line=1,
    #     labels=strftime(ORIGIN + pretty(range(maildata$date, na.rm=T)), "%H:%M"))
    if (mode == "daily") {
        r <- as.POSIXct(round(range(indata$date), "hours"))
        axis.POSIXct(1, at=seq(r[1], r[2], by="hour"), format="%H:%M", fg=col.axis,
                     line=0.25, col.axis=col.axis.font, lwd=lwd.axis)
    } else if (mode == "monthly") {
        r <- as.POSIXct(round(range(indata$date), "days"))
        axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%b %d", fg=col.axis,
                     line=0.25, col.axis=col.axis.font, lwd=lwd.axis)
    } else if (mode == "all") {
        r <- as.POSIXct(round(range(indata$date), "days"))
        axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%b %d", fg=col.axis,
                     line=0.25, col.axis=col.axis.font, lwd=lwd.axis)
    }
    par(new=T)
    plot(x=indata$date, y=indata$total, type="l", xlab="", ylab="",
         frame.plot=F, lwd=lwd.line2, col=col.line2, axes=F,
         ylim=c(0,max(indata$total)))
    axis(side=4, at=pretty(range(append(indata$total, 0), na.rm=T)),
         col.axis=col.line2, fg=col.axis, line=-0.25, lwd=lwd.axis)
     dev.off()
}

plot.day(maildata)
plot.month(maildata)
plot.all(maildata)
