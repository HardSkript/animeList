<?php 


  /*
   * getAnimeData
   *
   * This function uses myanimelist api, get anime data, 
   * convert to a xml type, converts invalid characters
   * and finnaly parses the text converting to an array
   *
   * @param (url) about this param
   * @return (array)
   */


    $ch = curl_init($animeAlvo); // opens the curl module
    $options = array(
        CURLOPT_URL => $animeAlvo,
        CURLOPT_HEADER => "Content-Type:application/xml", // get a xml object
        CURLOPT_USERPWD => "asumashinohara:maiden", // mal credential
        CURLOPT_HTTPAUTH => CURLAUTH_BASIC, // http auth
        CURLOPT_RETURNTRANSFER => TRUE // download file
    );

    curl_setopt_array($ch, $options);
    $data = curl_exec($ch);
    curl_close($ch);
    // converting xml entity for valid ones
    function char_to_entity($text) 
    { 
      $text = str_replace('&amp;', ' ', $text); 
      $text = str_replace('&ndash;', '-', $text); 
      $text = str_replace('&forall;', '-', $text); 
      $text = str_replace('&forall;', '-', $text); 
      $text = str_replace('&hellip;', '...', $text); 
      $text = str_replace('&mdash;', '—', $text);
      $text = str_replace('&rsquo;', "'", $text);
      $text = str_replace('&sbquo;', "'", $text);
      $text = str_replace('&eacute;', "É", $text);
      $text = str_replace('&auml;', "Ä", $text);
      $text = str_replace('Odd & Even Numbers;', '—', $text);
      return $text; 
    }

    // return valid xml to user
    $parsed = char_to_entity($data);

    // maka an array for external uses 
    $xml= new SimpleXMLElement($parsed);

    // file_put_contents('test.xml', $parsed);

  ?>