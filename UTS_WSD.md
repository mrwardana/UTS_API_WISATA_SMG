# Tugas UTS API WISATA SEMARANG
- Nama   : M. RIFKI WARDANA
- NIM    : 21.01.55.6007
- PRODI  : SISTEM INFORMASI
- MAKUL  : WEB SERVICE DEVELOPMENT
## Nama Database
-Database name : wisata_smg
### Tabel Data Wisata
- `id`: INT, A_I (centang kotak A_I, ini adalah Auto Increment agar setiap data memiliki ID unik)
- `nama`: VARCHAR, panjang 255.
- `alamat`: VARCHAR, panjang 255.
- `jenis`: VARCHAR, panjang 50.
#### File `koneksi.php`
```php
<?php

$host = 'localhost';
$db   = 'wisata';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    exit("Error: " . $e->getMessage());
}

?>
```
##### File `master.php`
```php
<?php

include "koneksi.php";

// Menentukan metode request
$method = $_SERVER['REQUEST_METHOD'];

header('Content-Type: application/json');

switch($method) {
    case 'GET':
        $sql = "SELECT * FROM wisata";
        $stmt = $pdo->query($sql);
        $wisata = $stmt->fetchAll();
        echo json_encode($wisata);
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));
        if(isset($data->nama) && isset($data->alamat) && isset($data->jenis)) {
            $sql = "INSERT INTO wisata (nama, alamat, jenis) VALUES (?, ?, ?)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$data->nama, $data->alamat, $data->jenis]);
            echo json_encode(['message' => 'Wisata berhasil ditambahkan']);
        } else {
            echo json_encode(['message' => 'Data tidak lengkap']);
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));
        if(isset($data->id) && isset($data->nama) && isset($data->alamat) && isset($data->jenis)) {
            $sql = "UPDATE wisata SET nama=?, alamat=?, jenis=? WHERE id=?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$data->nama, $data->alamat, $data->jenis, $data->id]);
            echo json_encode(['message' => 'Wisata berhasil diperbarui']);
        } else {
            echo json_encode(['message' => 'Data tidak lengkap']);
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));
        if(isset($data->id)) {
            $sql = "DELETE FROM wisata WHERE id=?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$data->id]);
            echo json_encode(['message' => 'Wisata berhasil dihapus']);
        } else {
            echo json_encode(['message' => 'ID tidak ditemukan']);
        }
        break;

    default:
        echo json_encode(['message' => 'Metode tidak dikenali']);
        break;
}

?>

```
# POSTMAN
### 1. Membaca Data (READ)
1. Buka Postman.
2. Pilih metode `GET`.
3. Masukkan URL `http://localhost/wisata_smg/master.php`.
4. Klik `Send`. Jika ada data di database, responsnya akan menampilkan data wisata dalam format JSON.

### 2. Menambah Data (CREATE)
1. Pilih metode `POST`.
2. Masukkan URL yang sama `http://localhost/wisata_smg/master.php`.
3. Pilih tab `Body`.
4. Pilih tipe `raw` dan format `JSON (application/json)`.
5. Masukkan data wisata yang ingin ditambahkan, contohnya:
```json
{
    "nama": "Museum Lawang Sewu",
    "alamat": "Jl. Pemuda no. 160",
    "jenis": "Sejarah"
}
```
6. Klik `Send`. Jika berhasil, responsnya akan mengatakan bahwa wisata berhasil ditambahkan.

### 3. Memperbarui Data (UPDATE)
1. Pilih metode `PUT`.
2. Masukkan URL yang sama.
3. Pilih tab `Body`.
4. Pilih tipe `raw` dan format `JSON (application/json)`.
5. Masukkan data wisata yang ingin diperbarui beserta `id`-nya, contohnya:
```json
{
    "id": 1,
    "nama": "Museum Mandala Bakti",
    "alamat": "Jl. Mgr. Soegijapranata No.1",
    "jenis": "Sejarah"
}
```
6. Klik `Send`. Jika berhasil, responsnya akan mengatakan bahwa Wisata berhasil diperbarui.

### 4. Menghapus Data (DELETE)
1. Pilih metode `DELETE`.
2. Masukkan URL yang sama.
3. Pilih tab `Body`.
4. Pilih tipe `raw` dan format `JSON (application/json)`.
5. Masukkan `id` Wisata yang ingin dihapus, contohnya:
```json
{
    "id": 1
}
```
6. Klik `Send`. Jika berhasil, responsnya akan mengatakan bahwa Wisata berhasil dihapus.


