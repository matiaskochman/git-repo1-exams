// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.exams.controller;

import com.exams.controller.HelloWorldEntityController;
import com.exams.entity.HelloWorldEntity;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect HelloWorldEntityController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> HelloWorldEntityController.showJson(@PathVariable("id") Long id) {
        HelloWorldEntity helloWorldEntity = HelloWorldEntity.findHelloWorldEntity(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (helloWorldEntity == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(helloWorldEntity.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> HelloWorldEntityController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<HelloWorldEntity> result = HelloWorldEntity.findAllHelloWorldEntitys();
        return new ResponseEntity<String>(HelloWorldEntity.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> HelloWorldEntityController.createFromJson(@RequestBody String json) {
        HelloWorldEntity helloWorldEntity = HelloWorldEntity.fromJsonToHelloWorldEntity(json);
        helloWorldEntity.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> HelloWorldEntityController.createFromJsonArray(@RequestBody String json) {
        for (HelloWorldEntity helloWorldEntity: HelloWorldEntity.fromJsonArrayToHelloWorldEntitys(json)) {
            helloWorldEntity.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> HelloWorldEntityController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        HelloWorldEntity helloWorldEntity = HelloWorldEntity.fromJsonToHelloWorldEntity(json);
        if (helloWorldEntity.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> HelloWorldEntityController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (HelloWorldEntity helloWorldEntity: HelloWorldEntity.fromJsonArrayToHelloWorldEntitys(json)) {
            if (helloWorldEntity.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> HelloWorldEntityController.deleteFromJson(@PathVariable("id") Long id) {
        HelloWorldEntity helloWorldEntity = HelloWorldEntity.findHelloWorldEntity(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (helloWorldEntity == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        helloWorldEntity.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
