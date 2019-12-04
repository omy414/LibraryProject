package com.sol.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class OpenApitest {
	public static void main(String[] args) {
        BufferedReader br = null;
        try{            
            String urlstr = "http://www.nl.go.kr/app/nl/search/openApi/search.jsp?key=52958c5a4003d7a9414cd8823fe9a13a&category=dan&detailSearch=true&f1=title&v1=토지&f2=author&v2=박경리";
            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String result = "";
            String line;
            while((line = br.readLine()) != null) {
                result = result + line + "\n";
            }
            System.out.println(result);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

}
