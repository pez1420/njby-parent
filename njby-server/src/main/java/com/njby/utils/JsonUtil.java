package com.njby.utils;

import java.lang.reflect.Type;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public final class JsonUtil {
	private static final Logger logger = Logger.getLogger(JsonUtil.class);
/*	private static final Gson gson = new GsonBuilder()
			.setExclusionStrategies(new CustomExclusionStrategy())
			.serializeNulls().create();*/
	private static final Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().serializeNulls().create();
	
	public static String toJson(Object o) {
		String gsonStr = null;
		try {
			gsonStr = gson.toJson(o);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gsonStr;
	}

	public static String toJson(Object o, Type type) {
		String gsonStr = null;
		try {
			gsonStr = gson.toJson(o, type);
		} catch (Exception e) {
			logger.error("序列化失败!", e);
		}
		return gsonStr;
	}
}
