package com.momolela.util;

import java.util.Properties;

public class SunOSUtil {
	public static OSType getOsType() {
		Properties props = System.getProperties();
		if (props.getProperty("os.name").toLowerCase().contains("windows")) {
			return OSType.WINDWODS;
		} else if (props.getProperty("os.name").toLowerCase().contains("linux")) {
			return OSType.LIUNX;
		}
		return OSType.UNNOWE;
	}

	public enum OSType {
		WINDWODS, LIUNX, UNNOWE
	}
}
