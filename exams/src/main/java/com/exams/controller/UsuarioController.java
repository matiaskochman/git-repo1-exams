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

import com.exams.entity.Usuario;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RooWebJson(jsonObject = Usuario.class)
@Controller
@RequestMapping("/usuarios")
@RooWebScaffold(path = "usuarios", formBackingObject = Usuario.class)
public class UsuarioController {
	
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json) {
    	
    	
    	ObjectMapper mapper = new ObjectMapper();
    	ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    	
    	Usuario usuario = null;
    	try {
			usuario = mapper.readValue(json, Usuario.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	/*
		try {
			base = new Base();
			base.setName("matias");
			JsonSchema baseSchema = mapper.generateJsonSchema(Base.class);
			mapper.writeValue( buffer, base );
			String jsonText = buffer.toString();
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
    	
        //Usuario usuario = Usuario.fromJsonToUsuario(json);
        usuarioService.saveUsuario(usuario);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
	
}
