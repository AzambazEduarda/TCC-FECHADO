package modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Doce;
import modelo.Encomendadoce;
import modelo.Formapag;
import modelo.Usuario;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-06-04T22:14:03")
@StaticMetamodel(Encomenda.class)
public class Encomenda_ { 

    public static volatile SingularAttribute<Encomenda, Integer> idencomenda;
    public static volatile SingularAttribute<Encomenda, Doce> iddoce;
    public static volatile SingularAttribute<Encomenda, Formapag> idforma;
    public static volatile SingularAttribute<Encomenda, Float> valor;
    public static volatile ListAttribute<Encomenda, Encomendadoce> encomendadoceList;
    public static volatile SingularAttribute<Encomenda, Integer> quantidade;
    public static volatile SingularAttribute<Encomenda, Date> dataentrega;
    public static volatile SingularAttribute<Encomenda, Date> datapedido;
    public static volatile SingularAttribute<Encomenda, Usuario> idusuario;

}