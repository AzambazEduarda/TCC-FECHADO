package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Encomenda;
import modelo.Encomendadoce;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-06-04T22:14:03")
@StaticMetamodel(Doce.class)
public class Doce_ { 

    public static volatile SingularAttribute<Doce, String> descricaodoce;
    public static volatile SingularAttribute<Doce, String> imagemii;
    public static volatile SingularAttribute<Doce, String> ingredientes;
    public static volatile SingularAttribute<Doce, String> imagemi;
    public static volatile SingularAttribute<Doce, String> imagemiii;
    public static volatile SingularAttribute<Doce, Integer> iddoce;
    public static volatile SingularAttribute<Doce, String> nomedoce;
    public static volatile ListAttribute<Doce, Encomenda> encomendaList;
    public static volatile SingularAttribute<Doce, Float> precodoce;
    public static volatile ListAttribute<Doce, Encomendadoce> encomendadoceList;
    public static volatile SingularAttribute<Doce, Integer> qntddoce;
    public static volatile SingularAttribute<Doce, Float> pesodoce;

}