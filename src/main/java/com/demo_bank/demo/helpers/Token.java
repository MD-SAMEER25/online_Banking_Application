package com.demo_bank.demo.helpers;

import java.util.UUID;

public class Token {
    public static String generateToken() {
        return UUID.randomUUID().toString();
    }
}
