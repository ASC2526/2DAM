package ejPruebaAlmacenProdsCons;

public class Producto {
    private int Id = 1;
    private int IdProductor = 1;
    public Producto(int IdProductor, int Id) {
        this.Id = Id;
        this.IdProductor = IdProductor;
    }
    public int getId() {
        return Id;
    }
    public int getIdProductor() {
        return IdProductor;
    }
}
