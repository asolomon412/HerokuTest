package com.gc.APIDemo719.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class MilesFromSun {

	private String min;
	private String average;
	private String max;

	public MilesFromSun() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMin() {
		return min;
	}

	public void setMin(String min) {
		this.min = min;
	}

	public String getAverage() {
		return average;
	}

	public void setAverage(String average) {
		this.average = average;
	}

	public String getMax() {
		return max;
	}

	public void setMax(String max) {
		this.max = max;
	}

	@Override
	public String toString() {
		return "MilesFromSun [min=" + min + ", average=" + average + ", max=" + max + "]";
	}

}
