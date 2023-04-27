package com.example.service;

import com.example.pojo.Newsperson;

import java.util.List;

public interface NewspersonService {
    Newsperson getById(Integer id);
    Newsperson login(String name, String password);
    Newsperson getByName(String name);
    boolean insert(Newsperson bean);
    boolean update(Newsperson bean);
    List<Newsperson> getList();
}
