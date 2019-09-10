package com.gc.APIDemo719.entity;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Planet {

	private String name;
	private ArrayList<String> colors;
	@JsonProperty("million-miles-from-sun")
	private MilesFromSun miles;

	public Planet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<String> getColors() {
		return colors;
	}

	public void setColors(ArrayList<String> colors) {
		this.colors = colors;
	}

	public MilesFromSun getMiles() {
		return miles;
	}

	public void setMiles(MilesFromSun miles) {
		this.miles = miles;
	}

	@Override
	public String toString() {
		return "Planet [name=" + name + ", colors=" + colors + ", miles=" + miles + "]";
	}

}
