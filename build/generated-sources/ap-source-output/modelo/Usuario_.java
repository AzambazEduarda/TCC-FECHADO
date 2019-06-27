package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Comentario;
import modelo.Encomenda;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-06-04T22:14:03")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> complementousuario;
    public static volatile SingularAttribute<Usuario, String> ruausuario;
    public static volatile SingularAttribute<Usuario, String> bairrousuario;
    public static volatile SingularAttribute<Usuario, String> senhausuario;
    public static volatile ListAttribute<Usuario, Comentario> comentarioList;
    public static volatile ListAttribute<Usuario, Encomenda> encomendaList;
    public static volatile SingularAttribute<Usuario, Integer> numerocasausuario;
    public static volatile SingularAttribute<Usuario, String> emailusuario;
    public static volatile SingularAttribute<Usuario, String> celularusuario;
    public static volatile SingularAttribute<Usuario, String> nomeusuario;
    public static volatile SingularAttribute<Usuario, Integer> idusuario;
    public static volatile SingularAttribute<Usuario, String> cepusuario;

}