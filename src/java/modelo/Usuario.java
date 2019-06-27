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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author DudaAzambuja
 */
@Entity
@Table(name = "usuario")
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
    @NamedQuery(name = "Usuario.findFilter", query = "SELECT u FROM Usuario u"
    + " WHERE UPPER (u.nomeusuario) like :filtro"),
    @NamedQuery(name = "Usuario.login", query = "SELECT u FROM Usuario u WHERE u.emailusuario= :email and u.senhausuario = :senha")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idusuario")
    private Integer idusuario;
    @Basic(optional = false)
    @Column(name = "nomeusuario")
    private String nomeusuario;
    @Basic(optional = false)
    @Column(name = "ruausuario")
    private String ruausuario;
    @Basic(optional = false)
    @Column(name = "cepusuario")
    private String cepusuario;
    @Basic(optional = false)
    @Column(name = "bairrousuario")
    private String bairrousuario;
    @Basic(optional = false)
    @Column(name = "numerocasausuario")
    private int numerocasausuario;
    @Basic(optional = false)
    @Column(name = "celularusuario")
    private String celularusuario;
    @Basic(optional = false)
    @Column(name = "senhausuario")
    private String senhausuario;
    @Basic(optional = false)
    @Column(name = "emailusuario")
    private String emailusuario;
    @Basic(optional = false)
    @Column(name = "complementousuario")
    private String complementousuario;

    public Usuario() {
    }

    public Usuario(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public Usuario(Integer idusuario, String nomeusuario, String ruausuario, String cepusuario, String bairrousuario, int numerocasausuario, String celularusuario, String senhausuario, String emailusuario, String complementousuario) {
        this.idusuario = idusuario;
        this.nomeusuario = nomeusuario;
        this.ruausuario = ruausuario;
        this.cepusuario = cepusuario;
        this.bairrousuario = bairrousuario;
        this.numerocasausuario = numerocasausuario;
        this.celularusuario = celularusuario;
        this.senhausuario = senhausuario;
        this.emailusuario = emailusuario;
        this.complementousuario = complementousuario;
    }

    public Integer getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public String getNomeusuario() {
        return nomeusuario;
    }

    public void setNomeusuario(String nomeusuario) {
        this.nomeusuario = nomeusuario;
    }

    public String getRuausuario() {
        return ruausuario;
    }

    public void setRuausuario(String ruausuario) {
        this.ruausuario = ruausuario;
    }

    public String getCepusuario() {
        return cepusuario;
    }

    public void setCepusuario(String cepusuario) {
        this.cepusuario = cepusuario;
    }

    public String getBairrousuario() {
        return bairrousuario;
    }

    public void setBairrousuario(String bairrousuario) {
        this.bairrousuario = bairrousuario;
    }

    public int getNumerocasausuario() {
        return numerocasausuario;
    }

    public void setNumerocasausuario(int numerocasausuario) {
        this.numerocasausuario = numerocasausuario;
    }

    public String getCelularusuario() {
        return celularusuario;
    }

    public void setCelularusuario(String celularusuario) {
        this.celularusuario = celularusuario;
    }

    public String getSenhausuario() {
        return senhausuario;
    }

    public void setSenhausuario(String senhausuario) {
        this.senhausuario = senhausuario;
    }

    public String getEmailusuario() {
        return emailusuario;
    }

    public void setEmailusuario(String emailusuario) {
        this.emailusuario = emailusuario;
    }

    public String getComplementousuario() {
        return complementousuario;
    }

    public void setComplementousuario(String complementousuario) {
        this.complementousuario = complementousuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idusuario != null ? idusuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.idusuario == null && other.idusuario != null) || (this.idusuario != null && !this.idusuario.equals(other.idusuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nomeusuario;
    }
    
}
