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
            code: 'div-gpt-ad-1474538683157-0',
            sizes: [[480, 320], [180, 150], [234, 60], [336, 280], [240, 400], [468, 60]],
            bids: [{
                bidder: 'vgadp',
                params: {
                    param1: '4799418',
                    param1: 'aaab-289u-bee0-bea21'
                }
            }]
        },{
            code: 'div-gpt-ad-1474538683157-1',
            sizes: [[480, 320], [300, 250], [216, 54], [768, 1024], [234, 60], [468, 60]],
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
        	var googletag = googletag || {};
         googletag.cmd = googletag.cmd || [];
         googletag.cmd.push(function() {
         googletag.pubads().disableInitialLoad();
         });

        pbjs.que.push(function() {
            pbjs.addAdUnits(adUnits);
            pbjs.requestBids({
                bidsBackHandler: sendAdserverRequest
            });
        });

        function sendAdserverRequest() {
            if (pbjs.adserverRequestSent) return;
            pbjs.adserverRequestSent = true;
            googletag.cmd.push(function() {
                pbjs.que.push(function() {
                    pbjs.setTargetingForGPTAsync();
                    googletag.pubads().refresh();
                });
            });
        }

        setTimeout(function() {
            sendAdserverRequest();
        }, PREBID_TIMEOUT);

    </script>
    <script>
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
    </script>
    <script>
        googletag.cmd.push(function() {
            googletag.defineSlot('/44911176/categories', [[480, 320], [180, 150], [234, 60], [336, 280], [240, 400], [468, 60]], 'div-gpt-ad-1474538683157-0').addService(googletag.pubads());
            googletag.defineSlot('/44911176/categories//books', [[480, 320], [300, 250], [216, 54], [768, 1024], [234, 60], [468, 60]], 'div-gpt-ad-1474538683157-1').addService(googletag.pubads());
            googletag.pubads().enableSingleRequest();
            googletag.pubads().setTargeting('hb_pb', []);
            googletag.enableServices();
        });
    </script>
    <!-- Prebid Boilerplate Section END -->


</head>

<body>
<h2>Prebid.js Test</h2>
<h5>Div-1</h5>

<!-- /44911176/categories -->
<div id='div-gpt-ad-1474538683157-0'>
    <script>
        googletag.cmd.push(function() { googletag.display('div-gpt-ad-1474538683157-0'); });
    </script>
</div>

<h5>Div-2</h5>
<!-- /44911176/categories//books -->
<div id='div-gpt-ad-1474538683157-1'>
    <script>
        googletag.cmd.push(function() { googletag.display('div-gpt-ad-1474538683157-1'); });
    </script>
</div>

</body>
</html>
