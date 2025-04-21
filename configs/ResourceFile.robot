*** Settings ***

Library     ${EXECDIR}/CustomLibraries/ReadFromExcel.py
Resource    ../configs/EnvDetails.robot
Resource    ../configs/BrowserDetails.robot
Resource    ../Object-repository/page-objects/api_Keywords.robot
Resource    ../Object-repository/page-objects/HomePage.robot
Resource    ../Object-repository/page-objects/LoginPage.robot
Resource    ../Object-repository/page-objects/ui_keywords.robot
Resource    ../Object-repository/locators/LoginPageLocators.robot
Resource    ../Object-repository/locators/HomePageLocators.robot

Library     ${EXECDIR}/CustomLibraries/ReadFromExcel.py
Library     RequestsLibrary
Library     SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library     String