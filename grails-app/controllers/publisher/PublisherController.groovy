package publisher


class PublisherController {
    def sendBids(){
        StringBuilder response = new StringBuilder(sendBid())
        response.append(sendBid())
        render text: response
    }

    String sendBid(){
        String url = "http://localhost:8081/Adserver/bidder/bid?bidId=2801808";
        String USER_AGENT = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36"
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // optional default is GET
        con.setRequestMethod("GET");

        //add request header
        con.setRequestProperty("User-Agent", USER_AGENT);

        int responseCode = con.getResponseCode();
        println("\nSending 'GET' request to URL : " + url);
        println("Response Code : " + responseCode);

        BufferedReader bufferedReader= new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = bufferedReader.readLine()) != null) {
            response.append(inputLine);
        }
        bufferedReader.close();

        //print result
        println(response.toString());
        response.toString()
    }

    def waitMin(long millis){
        Thread.sleep(millis)

        render text: "ok"
    }
}