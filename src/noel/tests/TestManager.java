package noel.tests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;

import com.github.springtestdbunit.DbUnitTestExecutionListener;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.ExpectedDatabase;
import com.github.springtestdbunit.assertion.DatabaseAssertionMode;

import noel.business.Manager;
import noel.model.Produits;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "TestManager-context.xml")
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class, DirtiesContextTestExecutionListener.class,
		TransactionalTestExecutionListener.class, DbUnitTestExecutionListener.class })
@ActiveProfiles(profiles = "manager")
public class TestManager {

	@Autowired
	Manager manager;

	@Autowired
	DataSource dataSource;

	@Before
	public void setUp() throws Exception {
		this.manager.setDataSource(dataSource);
	}

	@Test
	@DatabaseSetup(value = "produits.xml")
	public void testFindOneProduit() throws SQLException {
		Produits prod = manager.findOneProduits(1);
		assertEquals("GO-Pro", prod.getNom());
	}
	
	@Test
	@DatabaseSetup(value = "produits.xml")
	public void testFindAllProduit() throws SQLException {
		assertNotNull(manager.listProduits());
		assertEquals(3, manager.listProduits().size());
	}
	
	@Test
	@DatabaseSetup(value = "produits.xml")
	@ExpectedDatabase(assertionMode = DatabaseAssertionMode.NON_STRICT, value = "produits-add.xml")
	public void testAddProduitWithSave() throws SQLException {
		Produits prod = new Produits("Samsung S6", 700, 4);
		manager.saveProduit(prod);
	}
	
	@Test
	@DatabaseSetup(value = "produits.xml")
	@ExpectedDatabase(assertionMode = DatabaseAssertionMode.NON_STRICT, value = "produits-delete.xml")
	public void testDeletePerson() throws SQLException {
		manager.deleteProduit(4);
	}

}
