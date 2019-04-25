/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author DudaAzambuja
 */
@Entity
@Table(name = "bairros")
@NamedQueries({
    @NamedQuery(name = "Bairros.findAll", query = "SELECT b FROM Bairros b")})
public class Bairros implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "ruas")
    private String ruas;
    @Basic(optional = false)
    @Column(name = "bairros")
    private String bairros;
    @Basic(optional = false)
    @Column(name = "cidade")
    private String cidade;
    @Id
    @Basic(optional = false)
    @Column(name = "cep")
    private String cep;

    public Bairros() {
    }

    public Bairros(String cep) {
        this.cep = cep;
    }

    public Bairros(String cep, String ruas, String bairros, String cidade) {
        this.cep = cep;
        this.ruas = ruas;
        this.bairros = bairros;
        this.cidade = cidade;
    }

    public String getRuas() {
        return ruas;
    }

    public void setRuas(String ruas) {
        this.ruas = ruas;
    }

    public String getBairros() {
        return bairros;
    }

    public void setBairros(String bairros) {
        this.bairros = bairros;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cep != null ? cep.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bairros)) {
            return false;
        }
        Bairros other = (Bairros) object;
        if ((this.cep == null && other.cep != null) || (this.cep != null && !this.cep.equals(other.cep))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Bairros[ cep=" + cep + " ]";
    }
    
}
