package receitasedespesas.modelo.entidade;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


/**
 * 
 * @author Leonardo Silva
 *
 */
@Entity
@Table(name = "tb_receita_despesa", schema = "receitasedespesas")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class ReceitaDespesa implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	@Column(name = "id_credito_debito")
	private Integer idCreditoDebito;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_categoria" , referencedColumnName = "id")
	private ListaItem listaItemCategoria;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = " id_sub_categoria" , referencedColumnName = "id")
	private ListaItem listaItemSubCategoria;
	
	
	@Column(name = "id_objeto")
	private Integer idObjeto;
	
	@Column(name = "id_evento")
	private Integer idEvento;
	
	@Column(name = "id_status")
	private Integer idStatus;
	
	@Column(name = "nr_valor")
	private Integer nrValor;
	
	@Column(name = "dh_lancamento")
	@Temporal(TemporalType.DATE)
	private Date dataLancamento;
	
	@Column(name = "ds_comentario" , length = 200)
	private String comentario;
	
	@Column(name = "ds_login" , length = 50)
	private String login;
	
	@Column(name = "dh_criacao")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCriacao;
		
	@Column(name = "dh_atualizacao")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataAtualizacao;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIdCreditoDebito() {
		return idCreditoDebito;
	}

	public void setIdCreditoDebito(Integer idCreditoDebito) {
		this.idCreditoDebito = idCreditoDebito;
	}

	public ListaItem getListaItemCategoria() {
		return listaItemCategoria;
	}

	public void setListaItemCategoria(ListaItem listaItemCategoria) {
		this.listaItemCategoria = listaItemCategoria;
	}

	public ListaItem getListaItemSubCategoria() {
		return listaItemSubCategoria;
	}

	public void setListaItemSubCategoria(ListaItem listaItemSubCategoria) {
		this.listaItemSubCategoria = listaItemSubCategoria;
	}

	public Integer getIdObjeto() {
		return idObjeto;
	}

	public void setIdObjeto(Integer idObjeto) {
		this.idObjeto = idObjeto;
	}

	public Integer getIdEvento() {
		return idEvento;
	}

	public void setIdEvento(Integer idEvento) {
		this.idEvento = idEvento;
	}

	public Integer getIdStatus() {
		return idStatus;
	}

	public void setIdStatus(Integer idStatus) {
		this.idStatus = idStatus;
	}

	public Integer getNrValor() {
		return nrValor;
	}

	public void setNrValor(Integer nrValor) {
		this.nrValor = nrValor;
	}

	public Date getDataLancamento() {
		return dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Date getDataAtualizacao() {
		return dataAtualizacao;
	}

	public void setDataAtualizacao(Date dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comentario == null) ? 0 : comentario.hashCode());
		result = prime * result + ((dataAtualizacao == null) ? 0 : dataAtualizacao.hashCode());
		result = prime * result + ((dataCriacao == null) ? 0 : dataCriacao.hashCode());
		result = prime * result + ((dataLancamento == null) ? 0 : dataLancamento.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((idCreditoDebito == null) ? 0 : idCreditoDebito.hashCode());
		result = prime * result + ((idEvento == null) ? 0 : idEvento.hashCode());
		result = prime * result + ((idObjeto == null) ? 0 : idObjeto.hashCode());
		result = prime * result + ((idStatus == null) ? 0 : idStatus.hashCode());
		result = prime * result + ((listaItemCategoria == null) ? 0 : listaItemCategoria.hashCode());
		result = prime * result + ((listaItemSubCategoria == null) ? 0 : listaItemSubCategoria.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((nrValor == null) ? 0 : nrValor.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReceitaDespesa other = (ReceitaDespesa) obj;
		if (comentario == null) {
			if (other.comentario != null)
				return false;
		} else if (!comentario.equals(other.comentario))
			return false;
		if (dataAtualizacao == null) {
			if (other.dataAtualizacao != null)
				return false;
		} else if (!dataAtualizacao.equals(other.dataAtualizacao))
			return false;
		if (dataCriacao == null) {
			if (other.dataCriacao != null)
				return false;
		} else if (!dataCriacao.equals(other.dataCriacao))
			return false;
		if (dataLancamento == null) {
			if (other.dataLancamento != null)
				return false;
		} else if (!dataLancamento.equals(other.dataLancamento))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (idCreditoDebito == null) {
			if (other.idCreditoDebito != null)
				return false;
		} else if (!idCreditoDebito.equals(other.idCreditoDebito))
			return false;
		if (idEvento == null) {
			if (other.idEvento != null)
				return false;
		} else if (!idEvento.equals(other.idEvento))
			return false;
		if (idObjeto == null) {
			if (other.idObjeto != null)
				return false;
		} else if (!idObjeto.equals(other.idObjeto))
			return false;
		if (idStatus == null) {
			if (other.idStatus != null)
				return false;
		} else if (!idStatus.equals(other.idStatus))
			return false;
		if (listaItemCategoria == null) {
			if (other.listaItemCategoria != null)
				return false;
		} else if (!listaItemCategoria.equals(other.listaItemCategoria))
			return false;
		if (listaItemSubCategoria == null) {
			if (other.listaItemSubCategoria != null)
				return false;
		} else if (!listaItemSubCategoria.equals(other.listaItemSubCategoria))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		} else if (!login.equals(other.login))
			return false;
		if (nrValor == null) {
			if (other.nrValor != null)
				return false;
		} else if (!nrValor.equals(other.nrValor))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReceitaDespesa [id=" + id + ", idCreditoDebito=" + idCreditoDebito + ", listaItemCategoria="
				+ listaItemCategoria + ", listaItemSubCategoria=" + listaItemSubCategoria + ", idObjeto=" + idObjeto
				+ ", idEvento=" + idEvento + ", idStatus=" + idStatus + ", nrValor=" + nrValor + ", dataLancamento="
				+ dataLancamento + ", comentario=" + comentario + ", login=" + login + ", dataCriacao=" + dataCriacao
				+ ", dataAtualizacao=" + dataAtualizacao + "]";
	}
	
	
}
