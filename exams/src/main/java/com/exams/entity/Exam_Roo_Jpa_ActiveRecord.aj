// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.exams.entity;

import com.exams.entity.Exam;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Exam_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Exam.entityManager;
    
    public static final EntityManager Exam.entityManager() {
        EntityManager em = new Exam().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Exam.countExams() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Exam o", Long.class).getSingleResult();
    }
    
    public static List<Exam> Exam.findAllExams() {
        return entityManager().createQuery("SELECT o FROM Exam o", Exam.class).getResultList();
    }
    
    public static Exam Exam.findExam(Long id) {
        if (id == null) return null;
        return entityManager().find(Exam.class, id);
    }
    
    public static List<Exam> Exam.findExamEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Exam o", Exam.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Exam.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Exam.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Exam attached = Exam.findExam(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Exam.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Exam.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Exam Exam.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Exam merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
