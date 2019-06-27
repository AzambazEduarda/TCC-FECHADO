
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author DudaAzambuja
 */
@Entity
@Table(name = "doce")
@NamedQueries({
    @NamedQuery(name = "Doce.findAll", query = "SELECT d FROM Doce d "),
    @NamedQuery(name = "Doce.findFilter", query = "SELECT d FROM Doce d"
            + " WHERE UPPER (d.nomedoce) like :filtro")})
public class Doce implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddoce")
    private Integer iddoce;
    @Basic(optional = false)
    @Column(name = "nomedoce")
    private String nomedoce;
    @Basic(optional = false)
    @Column(name = "pesodoce")
    private float pesodoce;
    @Basic(optional = false)
    @Column(name = "precodoce")
    private float precodoce;
    @Basic(optional = false)
    @Column(name = "ingredientes")
    private String ingredientes;
    @Basic(optional = false)
    @Column(name = "qntddoce")
    private int qntddoce;
    @Basic(optional = false)
    @Column(name = "imagemi")
    private String imagemi;
    @Basic(optional = false)
    @Column(name = "imagemii")
    private String imagemii;
    @Basic(optional = false)
    @Column(name = "imagemiii")
    private String imagemiii;
    @Basic(optional = false)
    @Column(name = "descricaodoce")
    private String descricaodoce;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddoce")
    private List<Encomendadoce> encomendadoceList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddoce")
    private List<Encomenda> encomendaList;

    public Doce() {
    }

    public Doce(Integer iddoce) {
        this.iddoce = iddoce;
    }

    public Doce(Integer iddoce, String nomedoce, float pesodoce, float precodoce, String ingredientes, int qntddoce, String imagemi, String imagemii, String imagemiii, String descricaodoce) {
        this.iddoce = iddoce;
        this.nomedoce = nomedoce;
        this.pesodoce = pesodoce;
        this.precodoce = precodoce;
        this.ingredientes = ingredientes;
        this.qntddoce = qntddoce;
        this.imagemi = imagemi;
        this.imagemii = imagemii;
        this.imagemiii = imagemiii;
        this.descricaodoce = descricaodoce;
    }

    public Integer getIddoce() {
        return iddoce;
    }

    public void setIddoce(Integer iddoce) {
        this.iddoce = iddoce;
    }

    public String getNomedoce() {
        return nomedoce;
    }

    public void setNomedoce(String nomedoce) {
        this.nomedoce = nomedoce;
    }

    public float getPesodoce() {
        return pesodoce;
    }

    public void setPesodoce(float pesodoce) {
        this.pesodoce = pesodoce;
    }

    public float getPrecodoce() {
        return precodoce;
    }

    public void setPrecodoce(float precodoce) {
        this.precodoce = precodoce;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public int getQntddoce() {
        return qntddoce;
    }

    public void setQntddoce(int qntddoce) {
        this.qntddoce = qntddoce;
    }

    public String getImagemi() {
        return imagemi;
    }

    public void setImagemi(String imagemi) {
        this.imagemi = imagemi;
    }

    public String getImagemii() {
        return imagemii;
    }

    public void setImagemii(String imagemii) {
        this.imagemii = imagemii;
    }

    public String getImagemiii() {
        return imagemiii;
    }

    public void setImagemiii(String imagemiii) {
        this.imagemiii = imagemiii;
    }

    public String getDescricaodoce() {
        return descricaodoce;
    }

    public void setDescricaodoce(String descricaodoce) {
        this.descricaodoce = descricaodoce;
    }

    public List<Encomendadoce> getEncomendadoceList() {
        return encomendadoceList;
    }

    public void setEncomendadoceList(List<Encomendadoce> encomendadoceList) {
        this.encomendadoceList = encomendadoceList;
    }

    public List<Encomenda> getEncomendaList() {
        return encomendaList;
    }

    public void setEncomendaList(List<Encomenda> encomendaList) {
        this.encomendaList = encomendaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddoce != null ? iddoce.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Doce)) {
            return false;
        }
        Doce other = (Doce) object;
        if ((this.iddoce == null && other.iddoce != null) || (this.iddoce != null && !this.iddoce.equals(other.iddoce))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nomedoce;
    }

}
