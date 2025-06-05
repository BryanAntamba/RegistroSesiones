package global.service;

import global.models.Articulo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ArticuloServiceJdbcImplements implements ArticuloService {
    private Connection conn;

    public ArticuloServiceJdbcImplements(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void guardar(Articulo articulo) {
        String sql;
        if (articulo.getIdArticulo() != null && articulo.getIdArticulo() > 0) {
            sql = "UPDATE articulo SET idcategoria=?, codigo=?, nombre=?, stock=?, " +
                  "descripcion=?, imagen=?, condicion=? WHERE idarticulo=?";
        } else {
            sql = "INSERT INTO articulo (idcategoria, codigo, nombre, stock, " +
                  "descripcion, imagen, condicion) VALUES (?,?,?,?,?,?,?)";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, articulo.getIdCategoria());
            stmt.setString(2, articulo.getCodigo());
            stmt.setString(3, articulo.getNombre());
            stmt.setInt(4, articulo.getStock());
            stmt.setString(5, articulo.getDescripcion());
            stmt.setString(6, articulo.getImagen());
            stmt.setInt(7, articulo.getCondicion());

            if (articulo.getIdArticulo() != null && articulo.getIdArticulo() > 0) {
                stmt.setLong(8, articulo.getIdArticulo());
            }

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new ServiceJdbcException("Error al guardar el artículo", e);
        }
    }

    @Override
    public Optional<Articulo> porId(Long id) {
        Articulo articulo = null;
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM articulo WHERE idarticulo = ?")) {
            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    articulo = new Articulo();
                    articulo.setIdArticulo(rs.getInt("idarticulo"));
                    articulo.setIdCategoria(rs.getLong("idcategoria"));
                    articulo.setCodigo(rs.getString("codigo"));
                    articulo.setNombre(rs.getString("nombre"));
                    articulo.setStock(rs.getInt("stock"));
                    articulo.setDescripcion(rs.getString("descripcion"));
                    articulo.setImagen(rs.getString("imagen"));
                    articulo.setCondicion(rs.getInt("condicion"));
                }
            }
        } catch (SQLException e) {
            throw new ServiceJdbcException("Error al obtener el artículo por ID", e);
        }
        return Optional.ofNullable(articulo);
    }

    @Override
    public List<Articulo> listar() {
        List<Articulo> articulos = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM articulo")) {
            while (rs.next()) {
                Articulo articulo = new Articulo();
                articulo.setIdArticulo(rs.getInt("idarticulo"));
                articulo.setIdCategoria(rs.getLong("idcategoria"));
                articulo.setCodigo(rs.getString("codigo"));
                articulo.setNombre(rs.getString("nombre"));
                articulo.setStock(rs.getInt("stock"));
                articulo.setDescripcion(rs.getString("descripcion"));
                articulo.setImagen(rs.getString("imagen"));
                articulo.setCondicion(rs.getInt("condicion"));
                articulos.add(articulo);
            }
        } catch (SQLException e) {
            throw new ServiceJdbcException("Error al listar los artículos", e);
        }
        return articulos;
    }
}