/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.common;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

/**
 *
 * @author rajkumar.s
 */
public class DateDeserializer extends JsonDeserializer<Date> {

	public static final String DATE_FORMAT_PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

	@Override
	public Date deserialize(JsonParser jp, DeserializationContext dc) throws IOException {

		try {
			String dateString = jp.getText();
			Date date;
			if (dateString.contains("T")) {
				SimpleDateFormat format = new SimpleDateFormat(DATE_FORMAT_PATTERN);
				format.setTimeZone(TimeZone.getTimeZone("GMT"));
				date = format.parse(dateString);
			} else {
				date = new Date(Long.parseLong(dateString));
			}

			return date;
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

}
