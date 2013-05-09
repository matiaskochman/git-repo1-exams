package com.exams.controller;

import com.exams.entity.Exam;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/exams")
@Controller
@RooWebScaffold(path = "exams", formBackingObject = Exam.class)
@RooWebJson(jsonObject = Exam.class)
public class ExamController {
}
