/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@Table(name = "formapag")
@NamedQueries({
    @NamedQuery(name = "Formapag.findAll", query = "SELECT f FROM Formapag f"),
    @NamedQuery(name = "Formapag.findFilter", query = "SELECT f FROM Formapag f"
    + " WHERE UPPER (f.formanome) like :filtro")})

public class Formapag implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idformapag")
    private Integer idformapag;
    @Basic(optional = false)
    @Column(name = "formanome")
    private String formanome;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idforma")
    private List<Encomenda> encomendaList;

    public Formapag() {
    }

    public Formapag(Integer idformapag) {
        this.idformapag = idformapag;
    }

    public Formapag(Integer idformapag, String formanome) {
        this.idformapag = idformapag;
        this.formanome = formanome;
    }

    public Integer getIdformapag() {
        return idformapag;
    }

    public void setIdformapag(Integer idformapag) {
        this.idformapag = idformapag;
    }

    public String getFormanome() {
        return formanome;
    }

    public void setFormanome(String formanome) {
        this.formanome = formanome;
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
        hash += (idformapag != null ? idformapag.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Formapag)) {
            return false;
        }
        Formapag other = (Formapag) object;
        if ((this.idformapag == null && other.idformapag != null) || (this.idformapag != null && !this.idformapag.equals(other.idformapag))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return formanome;
    }
    
}
