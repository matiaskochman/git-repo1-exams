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

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Question {

    @NotNull
    private String description;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<QuestionOption> optionsList = new HashSet<QuestionOption>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<QuestionOption> correctOptionsList = new HashSet<QuestionOption>();
}
