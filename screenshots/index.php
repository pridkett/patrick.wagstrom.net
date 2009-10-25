<?
require "../common.php";
pageHeader("See Pat's Desktop In Action!\n");


$handle = opendir('shots/');
$fileArray = array();
while ($file = readdir($handle)) {
	if ($file != "." && $file != "..") {
		array_push($fileArray, $file);
	}
}
closedir($handle);
rsort($fileArray);

while (list ($foo,$file) = each($fileArray)) {
	if ($file != "latestScreen.jpg") {
	ereg("([0-9]{4})([0-9]{2})([0-9]{2})",$file,$regs);
	$title = date("l, F jS, Y", mktime(0, 0, 0, $regs[2], $regs[3], $regs[1]));
	$imgLink =  "<A HREF=\"shots/$file\"><IMG SRC=\"thumbs/$file\" BORDER=\"0\"></A>";
	$filename = "desc/".$regs[1].$regs[2].$regs[3].".txt";
	if (is_file ($filename)) {
		$fd = fopen($filename, "r");
		$contents = fread($fd, filesize ($filename));
		fclose($fd);
	}
	if ($contents == "") { $contents = "No Description<BR>\n"; }
	$boxContent = "<TABLE BORDER=\"0\" CELLPADDING=\"2\" CELLSPACING=\"0\">\n".
	              "<TR><TD>$imgLink</TD><TD>$contents</TD></TR></TABLE>\n";
	
	infoBox($title, $boxContent);
	$contents = "";
	}
}

pageFooter('$Id: index.php,v 1.4 2001/11/08 17:11:54 patrick Exp $');
?>

