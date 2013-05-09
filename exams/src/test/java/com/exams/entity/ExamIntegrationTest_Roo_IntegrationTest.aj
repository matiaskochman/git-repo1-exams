// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.exams.entity;

import com.exams.entity.Exam;
import com.exams.entity.ExamDataOnDemand;
import com.exams.entity.ExamIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExamIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ExamIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ExamIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ExamIntegrationTest: @Transactional;
    
    @Autowired
    ExamDataOnDemand ExamIntegrationTest.dod;
    
    @Test
    public void ExamIntegrationTest.testCountExams() {
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", dod.getRandomExam());
        long count = Exam.countExams();
        Assert.assertTrue("Counter for 'Exam' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ExamIntegrationTest.testFindExam() {
        Exam obj = dod.getRandomExam();
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exam' failed to provide an identifier", id);
        obj = Exam.findExam(id);
        Assert.assertNotNull("Find method for 'Exam' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Exam' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ExamIntegrationTest.testFindAllExams() {
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", dod.getRandomExam());
        long count = Exam.countExams();
        Assert.assertTrue("Too expensive to perform a find all test for 'Exam', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Exam> result = Exam.findAllExams();
        Assert.assertNotNull("Find all method for 'Exam' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Exam' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ExamIntegrationTest.testFindExamEntries() {
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", dod.getRandomExam());
        long count = Exam.countExams();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Exam> result = Exam.findExamEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Exam' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Exam' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ExamIntegrationTest.testFlush() {
        Exam obj = dod.getRandomExam();
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exam' failed to provide an identifier", id);
        obj = Exam.findExam(id);
        Assert.assertNotNull("Find method for 'Exam' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExam(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Exam' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ExamIntegrationTest.testMergeUpdate() {
        Exam obj = dod.getRandomExam();
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exam' failed to provide an identifier", id);
        obj = Exam.findExam(id);
        boolean modified =  dod.modifyExam(obj);
        Integer currentVersion = obj.getVersion();
        Exam merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Exam' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ExamIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", dod.getRandomExam());
        Exam obj = dod.getNewTransientExam(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Exam' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Exam' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Exam' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ExamIntegrationTest.testRemove() {
        Exam obj = dod.getRandomExam();
        Assert.assertNotNull("Data on demand for 'Exam' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exam' failed to provide an identifier", id);
        obj = Exam.findExam(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Exam' with identifier '" + id + "'", Exam.findExam(id));
    }
    
}
