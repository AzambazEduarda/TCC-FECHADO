/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
    @NamedQuery(name = "Encomenda.findAll", query = "SELECT e FROM Encomenda e"),
    @NamedQuery(name = "Encomenda.findFilter", query = "SELECT e FROM Encomenda e"
    + " WHERE e.dataentrega like :filtro")})
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
    @Column(name = "valor")
    private float valor;
    @Basic(optional = false)
    @Column(name = "datapedido")
    @Temporal(TemporalType.DATE)
    private Date datapedido;
    @Basic(optional = false)
    @Column(name = "dataentrega")
    @Temporal(TemporalType.DATE)
    private Date dataentrega;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idencomenda")
    private List<Encomendadoce> encomendadoceList;
    @JoinColumn(name = "iddoce", referencedColumnName = "iddoce")
    @ManyToOne(optional = false)
    private Doce iddoce;
    @JoinColumn(name = "idforma", referencedColumnName = "idformapag")
    @ManyToOne(optional = false)
    private Formapag idforma;
    @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")
    @ManyToOne(optional = false)
    private Usuario idusuario;

    public Encomenda() {
    }

    public Encomenda(Integer idencomenda) {
        this.idencomenda = idencomenda;
    }

    public Encomenda(Integer idencomenda, int quantidade, float valor, Date datapedido, Date dataentrega) {
        this.idencomenda = idencomenda;
        this.quantidade = quantidade;
        this.valor = valor;
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

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
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

    public List<Encomendadoce> getEncomendadoceList() {
        return encomendadoceList;
    }

    public void setEncomendadoceList(List<Encomendadoce> encomendadoceList) {
        this.encomendadoceList = encomendadoceList;
    }

    public Doce getIddoce() {
        return iddoce;
    }

    public void setIddoce(Doce iddoce) {
        this.iddoce = iddoce;
    }

    public Formapag getIdforma() {
        return idforma;
    }

    public void setIdforma(Formapag idforma) {
        this.idforma = idforma;
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
