package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author DudaAzambuja
 */
@Entity
@Table(name = "comentario")
@NamedQueries({
    @NamedQuery(name = "Comentario.findAll", query = "SELECT c FROM Comentario c")})
public class Comentario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcomen")
    private Integer idcomen;
    @Basic(optional = false)
    @Column(name = "comen")
    private String comen;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(optional = false)
    private Usuario idusuario;

    public Comentario() {
    }

    public Comentario(Integer idcomen) {
        this.idcomen = idcomen;
    }

    public Comentario(Integer idcomen, String comen) {
        this.idcomen = idcomen;
        this.comen = comen;
    }

    public Integer getIdcomen() {
        return idcomen;
    }

    public void setIdcomen(Integer idcomen) {
        this.idcomen = idcomen;
    }

    public String getComen() {
        return comen;
    }

    public void setComen(String comen) {
        this.comen = comen;
    }

    public Usuario getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Usuario idusuario) {
        this.idusuario = idusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcomen != null ? idcomen.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comentario)) {
            return false;
        }
        Comentario other = (Comentario) object;
        if ((this.idcomen == null && other.idcomen != null) || (this.idcomen != null && !this.idcomen.equals(other.idcomen))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Comentario[ idcomen=" + idcomen + " ]";
    }
    
}
