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

import com.exams.entity.Exam;
import com.exams.entity.Usuario;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping("/exams")
@Controller
@RooWebScaffold(path = "exams", formBackingObject = Exam.class)
@RooWebJson(jsonObject = Exam.class)
public class ExamController {
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
    	
    	//{"description":"examen1","questionsList":"matias","id":null,"version":null}
    	
    	
    	
        //Exam exam = Exam.fromJsonToExam(json);
    	ObjectMapper mapper = new ObjectMapper();
    	ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    	
    	Exam exam = null;
    	try {
			exam = mapper.readValue(json, Exam.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
        examService.saveExam(exam);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
	
}
