package com.gc.APIDemo719.alpha;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AlphaResults {
	
	@JsonProperty("Meta Data")
	private MetaData metaData;
	@JsonProperty("Time Series (5 Min)")
	private TimeSeries timeSeries;

}
