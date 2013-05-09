// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.exams.controller;

import com.exams.controller.QuestionController;
import com.exams.entity.Question;
import com.exams.entity.QuestionOption;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect QuestionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String QuestionController.create(@Valid Question question, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, question);
            return "questions/create";
        }
        uiModel.asMap().clear();
        question.persist();
        return "redirect:/questions/" + encodeUrlPathSegment(question.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String QuestionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Question());
        return "questions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String QuestionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("question", Question.findQuestion(id));
        uiModel.addAttribute("itemId", id);
        return "questions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String QuestionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("questions", Question.findQuestionEntries(firstResult, sizeNo));
            float nrOfPages = (float) Question.countQuestions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("questions", Question.findAllQuestions());
        }
        return "questions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String QuestionController.update(@Valid Question question, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, question);
            return "questions/update";
        }
        uiModel.asMap().clear();
        question.merge();
        return "redirect:/questions/" + encodeUrlPathSegment(question.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String QuestionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Question.findQuestion(id));
        return "questions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String QuestionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Question question = Question.findQuestion(id);
        question.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/questions";
    }
    
    void QuestionController.populateEditForm(Model uiModel, Question question) {
        uiModel.addAttribute("question", question);
        uiModel.addAttribute("questionoptions", QuestionOption.findAllQuestionOptions());
    }
    
    String QuestionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}