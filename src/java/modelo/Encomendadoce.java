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
@Table(name = "encomendadoce")
@NamedQueries({
    @NamedQuery(name = "Encomendadoce.findAll", query = "SELECT e FROM Encomendadoce e")})
public class Encomendadoce implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idencomendadoce")
    private Integer idencomendadoce;
    @Basic(optional = false)
    @Column(name = "quantidade")
    private int quantidade;
    @Basic(optional = false)
    @Column(name = "valorunitario")
    private float valorunitario;
    @JoinColumn(name = "iddoce", referencedColumnName = "iddoce")
    @ManyToOne(optional = false)
    private Doce iddoce;
    @JoinColumn(name = "idencomenda", referencedColumnName = "idencomenda")
    @ManyToOne(optional = false)
    private Encomenda idencomenda;

    public Encomendadoce() {
    }

    public Encomendadoce(Integer idencomendadoce) {
        this.idencomendadoce = idencomendadoce;
    }

    public Encomendadoce(Integer idencomendadoce, int quantidade, float valorunitario) {
        this.idencomendadoce = idencomendadoce;
        this.quantidade = quantidade;
        this.valorunitario = valorunitario;
    }

    public Integer getIdencomendadoce() {
        return idencomendadoce;
    }

    public void setIdencomendadoce(Integer idencomendadoce) {
        this.idencomendadoce = idencomendadoce;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public float getValorunitario() {
        return valorunitario;
    }

    public void setValorunitario(float valorunitario) {
        this.valorunitario = valorunitario;
    }

    public Doce getIddoce() {
        return iddoce;
    }

    public void setIddoce(Doce iddoce) {
        this.iddoce = iddoce;
    }

    public Encomenda getIdencomenda() {
        return idencomenda;
    }

    public void setIdencomenda(Encomenda idencomenda) {
        this.idencomenda = idencomenda;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idencomendadoce != null ? idencomendadoce.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Encomendadoce)) {
            return false;
        }
        Encomendadoce other = (Encomendadoce) object;
        if ((this.idencomendadoce == null && other.idencomendadoce != null) || (this.idencomendadoce != null && !this.idencomendadoce.equals(other.idencomendadoce))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Encomendadoce[ idencomendadoce=" + idencomendadoce + " ]";
    }
    
}
