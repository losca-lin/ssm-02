package com.example.service;

import com.example.pojo.NewsType;
import com.example.pojo.Newsperson;

import java.util.List;
import java.util.Map;

public interface NewspersonService {
    Newsperson getById(Integer id);
    Newsperson login(String name, String password);
    Newsperson getByName(String name);
    boolean insert(Newsperson bean);
    boolean update(Newsperson bean);
    List<Newsperson> getList();

    List<Newsperson> list(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);
}
