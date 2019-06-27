/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.persistence.Query;
import modelo.Usuario;

/**
 *
 * @author aluno
 */
public class UsuarioDAO extends GenericDAO<Usuario,Integer> {
    public UsuarioDAO(){
        super(Usuario.class);
    }
    public Usuario logar(String email, String senha)
    {
        Usuario retorno;
            Query q = em.createNamedQuery("Usuario.login").setParameter("email",  email).setParameter("senha", senha);
            try{
                retorno = (Usuario)q.getSingleResult();
            }
            catch (Exception e){
                retorno = null;
            }
            return retorno;
    }
}