/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    $("#contraReg").blur(function () {
        if ($("#contraReg").val() === ($("#contra2Reg").val())) {
            $("#contraReg").css({'background':'green'});
            $("#contra2Reg").css({'background':'green'});
        } else {
            $("#contraReg").css({'background':'red'});
            $("#contra2Reg").css({'background':'red'});
        }
    });
    
    $("#contra2Reg").blur(function () {
        if ($("#contraReg").val() === ($("#contra2Reg").val())) {
            $("#contraReg").css({'background':'green'});
            $("#contra2Reg").css({'background':'green'});
        } else {
            $("#contraReg").css({'background':'red'});
            $("#contra2Reg").css({'background':'red'});
        }
    });

    $("#registrar").click(function () {

        if ($("#correoReg").val() !== "" && $("#nombreReg").val() !== "" && $("#apellidoReg").val() !== "" && $("#edadReg").val() !== 0 && $("#contraReg").val() !== "" && $("#contra2Reg").val() !== "") {
            
        } else {
            //alert("Revise los campos");
        }
    });
    
    $("#comprobar").click(function () {
        if ($("#contraReg").val() === ($("#contra2Reg").val())) {
            $("#contraReg").css({'background':'green'});
            $("#contra2Reg").css({'background':'green'});
        } else {
            $("#contraReg").css({'background':'red'});
            $("#contra2Reg").css({'background':'red'});
        }
    });

});

