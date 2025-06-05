package global.service;

import global.models.Articulo;
import java.util.List;
import java.util.Optional;

public interface ArticuloService {
    List<Articulo> listar();
    Optional<Articulo> porId(Long id);
    void guardar(Articulo articulo);
}