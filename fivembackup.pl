#!/usr/bin/perl

# Set these for your situation
my $MTDIR = "/home/fivemowner/fivem_resources /home/fivemowner/fivem_server";
my $BACKUPDIR = "/home/fivemowner/backups";
my $TARCMD = "/bin/tar czf";

#-------------------
# No changes below here...
#-------------------
my $VERSION = "1.0";

print "FiveMBackup.pl version $VERSION\n";
print "========================\n";
if (! -d $BACKUPDIR)
{
	print "Backup dir $BACKUPDIR not found, creating...\n";
	system("mkdir -p $BACKUPDIR");
}
print "Moving existing backups: ";

if (-f "$BACKUPDIR/fivembackup-5.tgz")
{
	unlink("$BACKUPDIR/fivembackup-5.tgz")  or warn "Could not unlink $BACKUPDIR/fivembackup-5.tgz: $!";
}
if (-f "$BACKUPDIR/fivembackup-4.tgz")
{
	rename("$BACKUPDIR/fivembackup-4.tgz", "$BACKUPDIR/fivembackup-5.tgz");
}
if (-f "$BACKUPDIR/fivembackup-3.tgz")
{
	rename("$BACKUPDIR/fivembackup-3.tgz", "$BACKUPDIR/fivembackup-4.tgz");
}
if (-f "$BACKUPDIR/fivembackup-2.tgz")
{
	rename("$BACKUPDIR/fivembackup-2.tgz", "$BACKUPDIR/fivembackup-3.tgz");
}
if (-f "$BACKUPDIR/fivembackup-1.tgz")
{
	rename("$BACKUPDIR/fivembackup-1.tgz", "$BACKUPDIR/fivembackup-2.tgz");
}
print "Done\nCreating New Backup: ";
system("$TARCMD $BACKUPDIR/fivembackup-1.tgz $MTDIR");
print("Done!\n");
exit 0;
