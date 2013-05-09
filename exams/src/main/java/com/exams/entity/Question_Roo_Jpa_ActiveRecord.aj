// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.exams.entity;

import com.exams.entity.Question;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Question_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Question.entityManager;
    
    public static final EntityManager Question.entityManager() {
        EntityManager em = new Question().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Question.countQuestions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Question o", Long.class).getSingleResult();
    }
    
    public static List<Question> Question.findAllQuestions() {
        return entityManager().createQuery("SELECT o FROM Question o", Question.class).getResultList();
    }
    
    public static Question Question.findQuestion(Long id) {
        if (id == null) return null;
        return entityManager().find(Question.class, id);
    }
    
    public static List<Question> Question.findQuestionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Question o", Question.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Question.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Question.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Question attached = Question.findQuestion(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Question.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Question.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Question Question.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Question merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
