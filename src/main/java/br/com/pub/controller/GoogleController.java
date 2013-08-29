package br.com.pub.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import br.com.pub.mapper.GoogleMapper;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GoogleController {
	
	private static final String KEY = "AIzaSyCls5tuHpeHNlhBx13z8zi7g7FKWcKv2ww";
	private String nextPageToken = "";
	
	public GoogleMapper getPubsFromGoogle() {
		
		String url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json??location=53.330256,-6.270415&radius=50000&types=bar&sensor=false&key=" + KEY;
		StringBuilder retorno = new StringBuilder();
		
		HttpClient client = new DefaultHttpClient();
		HttpGet request = new HttpGet(addParams(url, nextPageToken));
		
		try {
            HttpResponse response = client.execute(request);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                InputStream stream = entity.getContent();
                try {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
                    String line;
                    while ((line = reader.readLine()) != null) {
						retorno.append(line);
                    }
                } finally {
                    stream.close();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		Gson gson = new GsonBuilder().serializeNulls().create();
	    GoogleMapper mapper = gson.fromJson(retorno.toString(), GoogleMapper.class);
		
		return mapper;
	}

	private String addParams(String url, String nextPageToken) {
	    List<NameValuePair> params = new LinkedList<NameValuePair>();
	    if (!StringUtils.isBlank(nextPageToken)) {
	    	params.add(new BasicNameValuePair("next_page_token", nextPageToken));
		}
	    
	    String paramString = URLEncodedUtils.format(params, "utf-8");
	    url += paramString;
	    return url;
	}
}
