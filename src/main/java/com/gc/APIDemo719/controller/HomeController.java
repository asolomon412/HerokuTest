package com.gc.APIDemo719.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.referenceData.Locations;
import com.amadeus.resources.Location;
import com.amadeus.resources.PointOfInterest;
import com.gc.APIDemo719.entity.Planet;

@Controller
public class HomeController {

	RestTemplate rt = new RestTemplate();
	private Planet[] planetInfo;

	@RequestMapping("/")
	public ModelAndView home() {
		RestTemplate restTemplate = new RestTemplate();
		planetInfo = restTemplate.getForObject("https://grandcircusco.github.io/demo-apis/planets.json",
				Planet[].class);

		// Start by using a String to test out the initial request to the API to
		// make sure you are getting some results before building too many POJOs for
		// parsing!
		// String quoteResults =
		// restTemplate.getForObject("https://gturnquist-quoters.cfapps.io/api/random",
		// String.class);
		ModelAndView mv = new ModelAndView("index", "list", Arrays.toString(planetInfo));
		mv.addObject("quoteTest", planetInfo);
		return mv;
	}

	@RequestMapping("details")
	public ModelAndView info(@RequestParam("index") int index) {
		

		return new ModelAndView("deets", "planet", planetInfo[index]);
	}

	
	@RequestMapping("test")
	public ModelAndView infoTest() {


		return new ModelAndView("testing/cloudinary2");
	}
	
	@RequestMapping("amadeaus")
	public ModelAndView infoAma() throws ResponseException {
	    Amadeus amadeus = Amadeus
	            .builder("D6fFT39JZq8ci737thFDoflLUm2OJWIv", "OeKjBj9dOFKhlOBa")
	            .build();

	    Location[] locations = amadeus.referenceData.locations.get(Params
	      .with("keyword", "LON")
	      .and("subType", Locations.ANY));

	    System.out.println(locations);
	    
	 // Points of Interest
	 // What are the popular places in Barcelona (based a geo location and a radius)
	 PointOfInterest[] points = amadeus.referenceData.locations.pointsOfInterest.get(Params
	    .with("latitude", "41.39715")
	    .and("longitude", "2.160873"));

		return new ModelAndView("amadeaus", "test", Arrays.toString(points));
		// this is awful // this is terrible
		///Users/Antonella/Desktop/APIPractice.war
	}
}
