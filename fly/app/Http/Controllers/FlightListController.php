<?php

namespace App\Http\Controllers;

use App\Model\Flight_list;

class FlightListController extends Controller {

    public function index() {
        $flights = Flight_list::all();
        return view('/flight-list', ['flights' => $flights]);
    }
    
    public function searchFlights($city_from, $city_to, $time_from, $time_return){
        
    $sql = "SELECT * FROM flights, airways WHERE flights.airways_id  = airways.airways_id 										AND	  flight_city_from LIKE '%$city_from%'
		 	AND   flight_city_to   LIKE '%$city_to%'
		 	AND   flight_time_from LIKE '%$time_from%'";

		$result = self::$conn->query($sql);
		$arr = array();
		while($row = $result->fetch_assoc()){
				$arr[] = $row;
		}
		return $arr;
    }

}
