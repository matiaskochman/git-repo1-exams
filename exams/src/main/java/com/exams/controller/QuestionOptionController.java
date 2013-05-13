package com.exams.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exams.entity.QuestionOption;
import com.exams.entity.Usuario;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping("/questionoptions")
@Controller
@RooWebScaffold(path = "questionoptions", formBackingObject = QuestionOption.class)
@RooWebJson(jsonObject = QuestionOption.class)
public class QuestionOptionController {
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
    	//{"description":"deesc","optionNumber":"1","id":null,"version":null}
    	
    	
    	ObjectMapper mapper = new ObjectMapper();
    	ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    	
    	QuestionOption questionOption = null;
    	try {
    		questionOption = mapper.readValue(json, QuestionOption.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	
        //QuestionOption questionOption = QuestionOption.fromJsonToQuestionOption(json);
        
        questionOption.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
	
}
