<?php

$array = array(1, 2, 3);
$array[3] = $array;
$array[3][3] = $array;

$array2 = array(1, 2, 3);
$array2[3] = $array2;
$array2[3][3] = &$array2;

class ArrayLevel {

    protected $number_of_levels = 0;
    public $array_copy = array();

    /**
     * Free allocated memory before exit
     * 
     * @return mixed
     */
    public function check($array) {
        $this->array_copy = $array;
        $checking_result = $this->checking($this->array_copy);

        //free allocated memory
        unset($this->array_copy);

        return $checking_result;
    }

    /**
     * Checks array
     * 
     * @return mixed
     */
    public function checking(&$array, $current_level = 0) {

        //check array level
        if (!array_key_exists("checked_array_level", $array)) {

            //count levels
            $current_level++;
            $level = $this->number_of_levels;
            if ($current_level > $level) {
                $level++;
                $this->number_of_levels = $level;
            }

            $array["checked_array_level"] = $current_level;

            foreach ($array as $key => &$value) {
                if (is_array($value)) {
                    $check_result = $this->checking($value, $current_level);
                    if (!$check_result) {
                        //clear marker "array_level_checked"
                        unset($array["checked_array_level"]);
                        return false;
                    }
                }
            }

            //clear marker "array_level_checked"
            unset($array["checked_array_level"]);
        } else {
            return false;
        }

        return $this->number_of_levels;
    }

}

$array_check = new ArrayLevel();
echo "Number of levels: " . $array_check->check($array);

echo "<pre>";
print_r($array);
echo "</pre>";

$array_check = new ArrayLevel();
echo "Number of levels: " . $array_check->check($array2);

echo "<pre>";
print_r($array2);
echo "</pre>";