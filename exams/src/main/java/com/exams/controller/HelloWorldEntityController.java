package com.exams.controller;

import com.exams.entity.HelloWorldEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/helloworldentitys")
@Controller
@RooWebScaffold(path = "helloworldentitys", formBackingObject = HelloWorldEntity.class)
@RooWebJson(jsonObject = HelloWorldEntity.class)
public class HelloWorldEntityController {
}
