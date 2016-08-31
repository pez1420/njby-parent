package com.njby.utils;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;

/***
 * 定制自己的注解和排除策略
 * 只要在不序列化的字段前面加上@NotSerialize注解
 * 
 * @author pez1420@163.com
 *
 */
public class CustomExclusionStrategy implements ExclusionStrategy {

	private final Class<?> typeToSkip;
	
	
	public CustomExclusionStrategy() {
		this.typeToSkip = null;
	}

	public CustomExclusionStrategy(Class<?> typeToSkip) {
		this.typeToSkip = typeToSkip;
	}

	@Override
	public boolean shouldSkipClass(Class<?> clazz) {
		return clazz == typeToSkip;
	}
	
	@Override
	public boolean shouldSkipField(FieldAttributes f) {
		return f.getAnnotation(NotSerialize.class) != null;
	}

}
