package baseDeDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import dominio.Gasto;
import java.util.List;

/**
 *
 * @author eleazar
 */

public class GastoDAO extends SimpleJdbcDaoSupport {
    
    private static final String CONSULTA_GASTOS = "SELECT id, fecha, mes, tarjeta, transaccion, gastos, pagos FROM Gasto";

    public List<Gasto> consultaGastos() {
        List<Gasto> lista = getSimpleJdbcTemplate().query(
            CONSULTA_GASTOS, 
            new GastoRowMapper() 
        );
        return lista;
    }
    
    private static final String ACTUALIZA_PAGO = "UPDATE Gasto SET pagos = ? WHERE id = ?";

    public void actualizarPago(Gasto gasto) {
        getSimpleJdbcTemplate().update(
            ACTUALIZA_PAGO,
            gasto.getPagos(),
            gasto.getId()
        );
    }
    
    
    private static final class GastoRowMapper implements ParameterizedRowMapper<Gasto> {
        
        public Gasto mapRow(ResultSet rs, int rowNum) throws SQLException {
            Gasto gasto = new Gasto();
            gasto.setId(rs.getInt("id"));
            gasto.setFecha(rs.getString("fecha"));
            gasto.setMes(rs.getString("mes"));
            gasto.setTarjeta(rs.getString("tarjeta"));
            gasto.setTransaccion(rs.getString("transaccion"));
            gasto.setGastos(rs.getDouble("gastos"));
            gasto.setPagos(rs.getDouble("pagos"));
            return gasto;
        }
    }
}


