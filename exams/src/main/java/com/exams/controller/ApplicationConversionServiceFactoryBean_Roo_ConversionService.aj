// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.exams.controller;

import com.exams.controller.ApplicationConversionServiceFactoryBean;
import com.exams.entity.Exam;
import com.exams.entity.HelloWorldEntity;
import com.exams.entity.Question;
import com.exams.entity.QuestionOption;
import com.exams.entity.Usuario;
import com.exams.service.ExamService;
import com.exams.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    ExamService ApplicationConversionServiceFactoryBean.examService;
    
    @Autowired
    UsuarioService ApplicationConversionServiceFactoryBean.usuarioService;
    
    public Converter<Exam, String> ApplicationConversionServiceFactoryBean.getExamToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.exams.entity.Exam, java.lang.String>() {
            public String convert(Exam exam) {
                return new StringBuilder().append(exam.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Exam> ApplicationConversionServiceFactoryBean.getIdToExamConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.exams.entity.Exam>() {
            public com.exams.entity.Exam convert(java.lang.Long id) {
                return examService.findExam(id);
            }
        };
    }
    
    public Converter<String, Exam> ApplicationConversionServiceFactoryBean.getStringToExamConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.exams.entity.Exam>() {
            public com.exams.entity.Exam convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Exam.class);
            }
        };
    }
    
    public Converter<HelloWorldEntity, String> ApplicationConversionServiceFactoryBean.getHelloWorldEntityToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.exams.entity.HelloWorldEntity, java.lang.String>() {
            public String convert(HelloWorldEntity helloWorldEntity) {
                return new StringBuilder().append(helloWorldEntity.getHello()).toString();
            }
        };
    }
    
    public Converter<Long, HelloWorldEntity> ApplicationConversionServiceFactoryBean.getIdToHelloWorldEntityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.exams.entity.HelloWorldEntity>() {
            public com.exams.entity.HelloWorldEntity convert(java.lang.Long id) {
                return HelloWorldEntity.findHelloWorldEntity(id);
            }
        };
    }
    
    public Converter<String, HelloWorldEntity> ApplicationConversionServiceFactoryBean.getStringToHelloWorldEntityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.exams.entity.HelloWorldEntity>() {
            public com.exams.entity.HelloWorldEntity convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), HelloWorldEntity.class);
            }
        };
    }
    
    public Converter<Question, String> ApplicationConversionServiceFactoryBean.getQuestionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.exams.entity.Question, java.lang.String>() {
            public String convert(Question question) {
                return new StringBuilder().append(question.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Question> ApplicationConversionServiceFactoryBean.getIdToQuestionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.exams.entity.Question>() {
            public com.exams.entity.Question convert(java.lang.Long id) {
                return Question.findQuestion(id);
            }
        };
    }
    
    public Converter<String, Question> ApplicationConversionServiceFactoryBean.getStringToQuestionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.exams.entity.Question>() {
            public com.exams.entity.Question convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Question.class);
            }
        };
    }
    
    public Converter<QuestionOption, String> ApplicationConversionServiceFactoryBean.getQuestionOptionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.exams.entity.QuestionOption, java.lang.String>() {
            public String convert(QuestionOption questionOption) {
                return new StringBuilder().append(questionOption.getDescription()).append(' ').append(questionOption.getOptionNumber()).toString();
            }
        };
    }
    
    public Converter<Long, QuestionOption> ApplicationConversionServiceFactoryBean.getIdToQuestionOptionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.exams.entity.QuestionOption>() {
            public com.exams.entity.QuestionOption convert(java.lang.Long id) {
                return QuestionOption.findQuestionOption(id);
            }
        };
    }
    
    public Converter<String, QuestionOption> ApplicationConversionServiceFactoryBean.getStringToQuestionOptionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.exams.entity.QuestionOption>() {
            public com.exams.entity.QuestionOption convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), QuestionOption.class);
            }
        };
    }
    
    public Converter<Usuario, String> ApplicationConversionServiceFactoryBean.getUsuarioToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.exams.entity.Usuario, java.lang.String>() {
            public String convert(Usuario usuario) {
                return new StringBuilder().append(usuario.getName()).append(' ').append(usuario.getPassword()).append(' ').append(usuario.getEmail()).toString();
            }
        };
    }
    
    public Converter<Long, Usuario> ApplicationConversionServiceFactoryBean.getIdToUsuarioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.exams.entity.Usuario>() {
            public com.exams.entity.Usuario convert(java.lang.Long id) {
                return usuarioService.findUsuario(id);
            }
        };
    }
    
    public Converter<String, Usuario> ApplicationConversionServiceFactoryBean.getStringToUsuarioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.exams.entity.Usuario>() {
            public com.exams.entity.Usuario convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Usuario.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getExamToStringConverter());
        registry.addConverter(getIdToExamConverter());
        registry.addConverter(getStringToExamConverter());
        registry.addConverter(getHelloWorldEntityToStringConverter());
        registry.addConverter(getIdToHelloWorldEntityConverter());
        registry.addConverter(getStringToHelloWorldEntityConverter());
        registry.addConverter(getQuestionToStringConverter());
        registry.addConverter(getIdToQuestionConverter());
        registry.addConverter(getStringToQuestionConverter());
        registry.addConverter(getQuestionOptionToStringConverter());
        registry.addConverter(getIdToQuestionOptionConverter());
        registry.addConverter(getStringToQuestionOptionConverter());
        registry.addConverter(getUsuarioToStringConverter());
        registry.addConverter(getIdToUsuarioConverter());
        registry.addConverter(getStringToUsuarioConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
