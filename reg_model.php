<?php
namespace model;

class Registration {
    
public $name;
public $email;
public $parol;
public $language;
public $database;
public $emailCheck;
public $usernumber;
public $n;
public $encoding;
public $notes;
    
public function newUser(){
    // Делаем все необходимые для регистрации нового пользователя действия
    $this->databaseConnect()->checkEmail()->lineUpNewId()->
    newNumber()->language()->notes()->createTables();

    @mysqli_close($this->database);

    return ['n1'=>$this->n, 'id'=>$this->usernumber];
}

public function databaseConnect(){
    // Подключаемся к базе данных
    $database=@mysqli_connect("localhost","RWUser","123","rw");
    $this->database = $database;
    
    return $this;
}

public function checkEmail(){
    // Проверить нет ли уже такого e-mail в базе данных
    
    // Если удалось подключиться
    if ($this->database){
    $check=mysqli_query($this->database,
    "select `email` from `names` where `email`='".$this->email."'");
        if (mysqli_num_rows($check)==0){
        // Если e-mail уникален продолжаем
        $this->emailCheck = 1;
        }
        else {
        // Если e-mail не уникален возвращаемся на страницу регистрации
        mysqli_close($this->database);
        header ("Location: reg_controller.php");
        exit();
        }
    }
    
    return $this;
}

public function lineUpNewId(){
    // Подобрать новый уникальный ID
    
    // Если e-mail уникален
    if ($this->emailCheck){
        do {
        $usernumber=mt_rand(0,20000);
        $usernumber.=mt_rand(0,99999);
        $numbercheck=mysqli_query($this->database,
        "select `usernumber` from `names` where `usernumber`='$usernumber'");
        } while (mysqli_num_rows($numbercheck)!=0);
    
    $this->usernumber = $usernumber;
    }
    
    return $this;
}

public function newNumber(){
    // Номер новой организации
    
    // Если ID получен
    if ($this->usernumber){
    $n=mysqli_query($this->database,
    "select max(`n1`) from `names`");
    $n=mysqli_fetch_row($n);
    $n=$n[0];
    $n++;
        
    $this->n = $n;
    }

    return $this;
}

public function language(){
    // Устанавливаем кодировку для выбранного языка
    
    // Если номер новой организации получен
    if ($this->n){
        switch ($this->language){
         case "English":
           $this->encoding="cp1251";
           break;
         case "Russian":
           $this->encoding="cp1251";
           break;
         case "German":
           $this->encoding="latin1";
           break;
        }
    }

    return $this;
}

public function notes(){
    // Добавляем в базу данных регистрационные записи
    
    // Если кодировка выбрана
    if ($this->encoding){
        // Обезвредим полученную строку
        if (get_magic_quotes_gpc()){
            $this->name=stripslashes($this->name);
        }
        $this->name=mysqli_real_escape_string($this->database, $this->name);
    
    $name2=iconv("utf-8",$this->encoding,$this->name);
    $this->notes=mysqli_query($this->database,
       "insert into `names`(`name`,`name2`,`n1`,`email`,
       `parol`,`usernumber`,`language`,`encoding`,`cdate`)
        values ('".$this->name."','$name2','$this->n','".$this->email."',
        '".$this->parol."','$this->usernumber','".$this->language."',
        '$this->encoding','".date("Y-m-d H:i:s")."')");
    }

    return $this;
}

public function createTables(){
    // Создаем в базе данных все необходимые таблицы
    
    // Если регистрационные записи добавлены
    if ($this->notes){
    mysqli_query($this->database,
    "create table `n$this->n`(`name` tinytext, `n2` int unsigned,
    `category` tinytext, `print` boolean)
     engine=InnoDB  default charset=utf8");
    mysqli_query($this->database,
    "create table `w$this->n`(`n2` int unsigned, `page` int unsigned,
    `cn` int unsigned, `print` boolean, `maket` int unsigned, `data` text)
     engine=InnoDB  default charset=utf8");
    }
}

}//class registration