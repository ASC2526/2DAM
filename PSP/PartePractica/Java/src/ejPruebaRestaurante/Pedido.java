package ejPruebaRestaurante;

public class Pedido {
    private final int idPedido;
    private final int idCliente;
    private final int idMesero;
    public Pedido(int idPedido, int idCliente, int idMesero) {
        this.idPedido = idPedido;
        this.idCliente = idCliente;
        this.idMesero = idMesero;
    }
    public String ToString() {
        return "Mesero " + idMesero + " trae pedido " + idPedido
                + " para Cliente " + idCliente;
    }
    public int getIdPedido() {
        return idPedido;
    }
    public int getIdCliente() {
        return idCliente;
    }
    public int getIdMesero() {
        return idMesero;
    }
}
