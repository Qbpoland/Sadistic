<?php
 class post {
    private string $title;
    private string $imageUrl;
    private string $timeStamp;
    

    function __construct(string $title, string $imageUrl, string $timeStamp) {
    $this->title = $title;
    $this->imageUrl = $imageUrl;
    $this->timeStamp = $timeStamp;
    }
    
    static function get(int $id) : Post {
     global $db;
     $query = $db->prepare("SELECT * FROM post WHERE id = ?");
     $query->bind_param('i', $id);
     $query->execute();
     $result = $query->get_result();
     $resultArray = $result->fetch_assoc();
     return new Post($resultArray['title'],
                    $result['filename'],
                    $result['timestamp']);
    }
    static function getPage(int $pageNumber = 1, int $postPerPage = 10){
        global $db; 
        $query = $db->prepare("SELECT * From post Limit ? OFFSET ?");
        $offset = ($pageNumber-1) * $pageNumber;
        $query->bind_param('ii', $postPerPage, $offset);
        $query->execute();
        $result = $query->get_result();
        $postsArray = array();
        while($row = $result->fetch_assoc()){
            $post =  new Post($row['title'],
            $row['filename'],
            $row['timestamp']);
            array_push($postsArray, $post);

        }
        return $postsArray;
    }

    static function upload(string $tempFileName, string $title = ""){
        $uploadDir = "img/";
        $imageInfo = getimagesize($tempFileName);
        if (!is_array($imageInfo)) {
            die("BŁĄD: Nieprawidłowy format obrazu");
        }
        $randomSeed = rand(10000,99999) .hrtime(true);
        $hash= hash("sha256", $randomSeed);
        $targetFileName = $uploadDir . $hash . "webp";
        if(file_exists($targetFileName)){
            die("błąd: Podany plik już istnieje!");
        }
        $imageString = file_get_contents($tempFileName);
        $gdImage = @imagecreatefromstring($imageString);
        imagewebp($gdImage, $targetFileName);
        

        global $db;

        $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?, ?)");
        $dbTimestamp = date("Y-m-d H:i:s");
        $query->bind_param("sss", $dbTimestamp, $targetFileName, $title);
        if (!$query->execute())
        die("błąd zapisu do bazy danych");



 
 
 
    }
}
