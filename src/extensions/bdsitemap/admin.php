<?php
!function_exists("adminmsg") && exit("Forbidden");
     ini_set('max_execution_time', '360');

	$sumurl = $_POST['sumurl'];
	$websiteset = $_POST['siteurl'];
	$webmasterset = $_POST['sitemaster'];
	$updateperiset = $_POST['updateper'];
    $versionset = $_POST['siteversion'];
	$hszidset = $_POST['hszid'];
  
if($hszidset!="" AND $sumurl!=""){
	
 $sitemaptitle = '<?xml version="1.0" encoding="GB2312"?>
<document xmlns:bbs="http://www.baidu.com/search/bbs_sitemap.xsd">
<webSite>';
    $websitechar  = '</webSite>
<webMaster>';
    $webmasterchar  ='</webMaster>
<updatePeri>';
    $updateperichar ='</updatePeri>
<updatetime>';
    $updatetimechar = '</updatetime>
<version>';
    $versionchar = '</version>
';
    $itemchar = '<item>
<link>';
    $linkchar = '</link>
<title>';
    $titlechar ='</title>
<pubDate>';
    $pubdatechar ='</pubDate>
<bbs:lastDate>';
    $lastdatechar ='</bbs:lastDate>
<bbs:reply>';
    $replychar ='</bbs:reply>
<bbs:hit>';
    $hitchar ='</bbs:hit>
<bbs:boardid>';
    $boardidchar ='</bbs:boardid>
<bbs:pick>';
    $pickitemchar ='</bbs:pick>
</item>';    
    $sitemapbot = '
</document>';

 //&#545;??????
         $q=$db->get_one("SELECT COUNT(tid) AS count FROM pw_threads");
         $num=$q['count'];
         if ($sumurl > $num ){
         $sumurl = $num;
         }  
         
 // &#545;??itemap ??????
        $makemapdate = getdate();
        $makemapdate = gmdate ("Y-m-d",$makemapdate[0])." ".gmdate ("H:i:s",$makemapdate[0]);
        $query = $db->query("SELECT * FROM {$PW}threads WHERE fid<>$hszidset ORDER BY tid DESC");
        $sitemaptop = "$sitemaptitle$websiteset$websitechar$webmasterset$webmasterchar$updateperiset$updateperichar$makemapdate$updatetimechar$versionset$versionchar";
        $maptop = fopen("sitemap_baidu.xml", "w");
        fwrite($maptop, $sitemaptop);
        fclose($maptop);
        $totalnum =0;        
        for($i=0;$i<$sumurl; $i++){
        $n =  $db->fetch_array($query);
        $ab[$i]= $n;
        $link = $R_url."/read.php?tid=".$ab[$i][tid];
        $ab[$i][postdate] =  gmdate ("Y-m-d",$ab[$i][postdate])." ".gmdate ("H:i:s",$ab[$i][postdate]);
        $ab[$i][lastpost] =  gmdate ("Y-m-d",$ab[$i][lastpost])." ".gmdate ("H:i:s",$ab[$i][lastpost]);
        $tidget = $ab[$i][tid];
        $titleget1 =  $ab[$i][subject];
        $titleget = htmlspecialchars($titleget1); 
        $postdateget = $ab[$i][postdate];
        $lstptimeget = $ab[$i][lastpost];
        $repliesget = $ab[$i][replies];
        $hitsget = $ab[$i][hits];
        $fidget = $ab[$i][fid];
        $pickget = $ab[$i][digest];
        if ($pickget> 1){
        $pickget = 1;
        }
        $fnamequery = $db->query("SELECT * FROM {$PW}forums WHERE fid=$fidget");
        $m =  $db->fetch_array($fnamequery);
        $cd[$i] = $m;       
        $boardidget1 = $cd[$i][name];
        $boardidget = htmlspecialchars($boardidget1);  
               
        $linkmap = "$itemchar$link$linkchar$titleget$titlechar$postdateget$pubdatechar$lstptimeget$lastdatechar$repliesget$replychar$hitsget$hitchar$boardidget$boardidchar$pickget$pickitemchar";
        $maplink = fopen("sitemap_baidu.xml", "a");
        fwrite($maplink, $linkmap);
        fclose($maplink);
        $totalnum=$totalnum+1;
         }  
        $mapbot = fopen("sitemap_baidu.xml", "a");
        fwrite($mapbot, $sitemapbot);
        fclose($mapbot);
        $outsitemap = $R_url."/sitemap_baidu.xml" ;
  }             
require PrintHack("admin");exit;

?>