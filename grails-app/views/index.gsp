<%--
  Created by IntelliJ IDEA.
  User: akhil
  Date: 29/8/16
  Time: 12:33 PM
--%>
<html>
<head>
    <!-- Prebid Config Section START -->
    <!-- Make sure this is inserted before your GPT tag -->
    <script>
        var PREBID_TIMEOUT = 12000;

        var adUnits = [{
            code: 'div-ad-1460505748561-0',
            sizes: [[300, 250], [300,600]],
            bids: [{
                bidder: 'vgadp',
                params: {
                    param1: '4799418',
                    param1: 'aaab-289u-bee0-bea21'
                }
            }]
        },{
            code: 'div-ad-1460505661639-0',
            sizes: [[728, 90], [970, 90]],
            bids: [{
                bidder: 'vgadp',
                params: {
                    param1: '10290181',
                    param1: '390ba-bec1-fd28f-aeef'
                }
            }]
        }];

        var pbjs = pbjs || {};
        pbjs.que = pbjs.que || [];

    </script>
    <!-- Prebid Config Section END -->

    <!-- Prebid Boilerplate Section START. No Need to Edit. -->
    <g:javascript src="build/dev/prebid.js"></g:javascript>
    <g:javascript src="jquery/jquery-1.11.3.js"></g:javascript>
    <script>
        /*	var googletag = googletag || {};
         googletag.cmd = googletag.cmd || [];
         googletag.cmd.push(function() {
         googletag.pubads().disableInitialLoad();
         });*/

        pbjs.que.push(function() {
            pbjs.addAdUnits(adUnits);
            pbjs.requestBids({
                bidsBackHandler: sendAdserverRequest
            });
        });

        function sendAdserverRequest() {
            if (pbjs.adserverRequestSent) return;
            pbjs.adserverRequestSent = true;
           /* googletag.cmd.push(function() {
                pbjs.que.push(function() {
                    pbjs.setTargetingForGPTAsync();
                    googletag.pubads().refresh();
                });
            });*/
            console.log("bids back: ",JSON.stringify(pbjs.getBidResponses()));
            var bids = pbjs.getBidResponses().vgadp.bids;
            var max = 0;
            var cr_id="";
            jQuery.each(bids, function(i,bid){
                if(bid.cpm>max){
                    max = bid.cpm;
                    cr_id = bid.creative_id;
                }
            });

           /* jQuery.ajax(
                    {
                        method: "GET",
                        url: "http://localhost:8081/Adserver/adServer/showAd?id="+cr_id,
                        success: function(response){
                            jQuery('#div-ad-1460505748561-0').html(response);
                        }
                    }

            );
*/

            var iframe = document.createElement('iframe');
            iframe.src = "http://localhost:8081/Adserver/adServer/showAd?id="+cr_id;
            document.body.appendChild(iframe);
        }

        setTimeout(function() {
            sendAdserverRequest();
        }, PREBID_TIMEOUT);

    </script>
    <!-- Prebid Boilerplate Section END -->

    %{--<script>
        (function () {
            var gads = document.createElement('script');
            gads.async = true;
            gads.type = 'text/javascript';
            var useSSL = 'https:' == document.location.protocol;
            gads.src = (useSSL ? 'https:' : 'http:') +
                    '//www.googletagservices.com/tag/js/gpt.js';
            var node = document.getElementsByTagName('script')[0];
            node.parentNode.insertBefore(gads, node);
        })();
    </script>--}%

    %{--<script>
        googletag.cmd.push(function () {
            googletag.defineSlot('/19968336/header-bid-tag-0', [[300, 250], [300, 600]], 'div-ad-1460505748561-0').addService(googletag.pubads());

            googletag.defineSlot('/19968336/header-bid-tag1', [[728, 90], [970, 90]], 'div-ad-1460505661639-0').addService(googletag.pubads());

            googletag.pubads().enableSingleRequest();
            googletag.enableServices();
        });
    </script>--}%
</head>

<body>
<h2>Prebid.js Test</h2>
<h5>Div-1</h5>
<div id='div-ad-1460505748561-0'>
    %{--<script type='text/javascript'>
        googletag.cmd.push(function() { googletag.display('div-gpt-ad-1460505748561-0'); });
    </script>--}%
</div>

<h5>Div-2</h5>
<div id='div-ad-1460505661639-0'>
    %{--<script type='text/javascript'>
        googletag.cmd.push(function() { googletag.display('div-gpt-ad-1460505661639-0'); });
    </script>--}%
</div>

</body>
</html>