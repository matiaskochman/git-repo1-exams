package com.exams.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
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
public class Exam {

    @NotNull
    @JsonProperty
    private String description;

    @ManyToMany(cascade = CascadeType.ALL)
    @JsonProperty
    private Set<Question> questionsList = new HashSet<Question>();
}
