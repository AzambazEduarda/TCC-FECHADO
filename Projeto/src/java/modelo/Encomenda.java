/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author DudaAzambuja
 */
@Entity
@Table(name = "encomenda")
@NamedQueries({
    @NamedQuery(name = "Encomenda.findAll", query = "SELECT e FROM Encomenda e")})
public class Encomenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idencomenda")
    private Integer idencomenda;
    @Basic(optional = false)
    @Column(name = "quantidade")
    private int quantidade;
    @Basic(optional = false)
    @Column(name = "datapedido")
    @Temporal(TemporalType.DATE)
    private Date datapedido;
    @Basic(optional = false)
    @Column(name = "dataentrega")
    @Temporal(TemporalType.DATE)
    private Date dataentrega;
    @JoinColumn(name = "iddoce", referencedColumnName = "iddoce")
    @ManyToOne(optional = false)
    private Doce iddoce;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(optional = false)
    private Usuario idusuario;

    public Encomenda() {
    }

    public Encomenda(Integer idencomenda) {
        this.idencomenda = idencomenda;
    }

    public Encomenda(Integer idencomenda, int quantidade, Date datapedido, Date dataentrega) {
        this.idencomenda = idencomenda;
        this.quantidade = quantidade;
        this.datapedido = datapedido;
        this.dataentrega = dataentrega;
    }

    public Integer getIdencomenda() {
        return idencomenda;
    }

    public void setIdencomenda(Integer idencomenda) {
        this.idencomenda = idencomenda;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Date getDatapedido() {
        return datapedido;
    }

    public void setDatapedido(Date datapedido) {
        this.datapedido = datapedido;
    }

    public Date getDataentrega() {
        return dataentrega;
    }

    public void setDataentrega(Date dataentrega) {
        this.dataentrega = dataentrega;
    }

    public Doce getIddoce() {
        return iddoce;
    }

    public void setIddoce(Doce iddoce) {
        this.iddoce = iddoce;
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
        hash += (idencomenda != null ? idencomenda.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Encomenda)) {
            return false;
        }
        Encomenda other = (Encomenda) object;
        if ((this.idencomenda == null && other.idencomenda != null) || (this.idencomenda != null && !this.idencomenda.equals(other.idencomenda))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Encomenda[ idencomenda=" + idencomenda + " ]";
    }
    
}
