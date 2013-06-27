package com.exams.entity;

import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.fasterxml.jackson.annotation.JsonProperty;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class QuestionOption {

    @NotNull
    @JsonProperty
    private String description;

    @NotNull
    @JsonProperty
    private String optionNumber;
}
