package com.exams.controller;

import com.exams.entity.QuestionOption;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/questionoptions")
@Controller
@RooWebScaffold(path = "questionoptions", formBackingObject = QuestionOption.class)
@RooWebJson(jsonObject = QuestionOption.class)
public class QuestionOptionController {
}
