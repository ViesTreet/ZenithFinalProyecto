package com.codingdojo.sebastian.excepciones;

import java.io.Serializable;

public class PaginaLimiteExcedidoException extends RuntimeException implements Serializable {
    private static final long serialVersionUID = 1L;

    public PaginaLimiteExcedidoException(String message) {
        super(message);
    }
}
