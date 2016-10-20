package publisher
import org.asynchttpclient.*;

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

    def sendMultipleBids() {
        long start = System.currentTimeMillis()
        10.times {
            long millis = (it % 2 == 0) ? 200 : 300
//            sendBid(millis, it)
        }
        long end = System.currentTimeMillis()
        println("Total time taken: ${end-start} millis")
        render text: "Total time: ${end-start} millis"
    }
/*
    def sendSingleBid(int times, long millis){
        String url = "https://morning-chamber-26141.herokuapp.com/publisher/waitMin?millis=$millis";
        long start = System.currentTimeMillis()
        AsyncHttpClient asyncHttpClient = new DefaultAsyncHttpClient();

        asyncHttpClient.prepareGet(url).execute(new AsyncCompletionHandler<Response>(){

            @Override
            public Response onCompleted(Response response) throws Exception{
                bidComplete(start, times, response.toString())
                return response;
            }

            @Override
            public void onThrowable(Throwable t){
                println"Something went wrong with bid $times"
            }
        });
    }

    void bidComplete(long start , int times, String response){
        println"Bid $times has completed, Response: $response\n Completed in ${(System.currentTimeMillis()-start) millis}"
    }*/
}