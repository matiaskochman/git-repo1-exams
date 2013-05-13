package com.exams.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import com.exams.entity.Question;
import com.exams.entity.Usuario;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/questions")
@Controller
@RooWebScaffold(path = "questions", formBackingObject = Question.class)
@RooWebJson(jsonObject = Question.class)
public class QuestionController {
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
        //Question question = Question.fromJsonToQuestion(json);
    	
    	//{"description":"matias","optionsList":"matias","id":null,"version":null}
    	
    	ObjectMapper mapper = new ObjectMapper();
    	ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    	
    	Question question = null;
    	try {
    		question = mapper.readValue(json, Question.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
        question.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

}
