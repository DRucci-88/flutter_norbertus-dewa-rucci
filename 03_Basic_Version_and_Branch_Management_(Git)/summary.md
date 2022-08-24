# (03) Basic Version and Branch Management (Git)

## Summary

Git adalah software pengendali versi untuk manajemen kode. Dibuat oleh Linus Torvalds (2005). Sifatnya terdistribusi baik secara lokal dan server. Melalui beberapa command bisa mensinkronkan antara lokal dan server. Hal ini yang menyebabkan satu proyek bisa dikerjakan secara bersama-sama oleh beberapa developer lainnya.

### Poin 01 - Github

Git Repository (folder project) berisi semua file, folder dan file history (history). Konfigurasi Public untuk proyek yang bersifat open-source dan Private untuk proyek rahasia.

Berikut beberapa command yang tersedia:

- `git init`
- `git add [name of file]`
- `git commit -m "message"`
- `git push -u origin main`
- `git remote add origin [link repo]`
- `git branch -M main`
- `git clone`

### Poin 02 - Saving Changes

Terdapat 3 tempat dalam mekanisme git yakni:

- Working directory: melakukan pengubahan secara lokal yang nantinya akan di update ke server.
- Staging area: menandai file-file yang berubah, lakukan commit sesuai pesan perubahan.
- Repository: hasil akhir file tersimpan disini.

Saat kita melakukan perubahan, kita memasukan command `git add [name file]` untuk membawa file tersebut ke Staging area. Jadi Staging area ini menyimpan perubahan yang sudah siap untuk di masukan ke server melalui command `git commit -m "message"`.

Saat melakukan commit, diperhatikan pesan yang ingin disampaikan benar-benar jelas sesuai perubahan yang dilakukan.

### Poin 03 - Reset

Dapat kembali kepada commmit sebelumnya berdasarkan id commit tersebut. Id commit bisa didapatkan melalui command `git log --oneline`.

Terdapat 2 jenis yakni:

- `git reset [id commit] --soft` Kembali ke satu state, perubahan yang terjadi akan disimpan pada Staging Area.
- `git reset [id commit] --hard` Kembali juga namun perubahan yang terjadi hilang semua (uncommit, unstage).

### Poin 04 - Branch and merge

Branch bisa dikatakan sebagai jalur yang berbeda dalam pengembagan kode. Jadi biasa digunakan untuk menangani fitur, bug atau hal spesifik lainnya.

Beberapa command:

- `git branch --list` show all branch
- `git branch [branch]` create new branch
- `git branch -D [branch]` force delete branch
- `git branch -a` list remote
- `git checkout -b new-feature master` start new feature
- `git checkout master` 
- `git merge new-feature`
- `git branch -d new-feature`

Terdapat 2 teknik dalam melakukan merge yakni no fast forward  `git merge --no-ff [branch]` dan `git merge --f [branch]`. Ketika terjadi konflik pada kedua branch, nanti secara otomatis IDE akan melakukan penanganan. Bisa update salah satu maupun keduanya.

### Poin 5 - Pull Request

Dapat diistilahkan bahwa branch meminta merge dari branch tujuan. Contoh seperti branch spesifik telah selesai mengembangkan fiturnya, lalu ingin merge ke branch master. Maka dilakukan pull request.

### Poin 6 - Workflow Collaboration

Terkait dengan alur terbaik dari workflow dari penggunaan git sesuai kebutuhan project.

Tips and trick:

- Branch utama (`master`) sebagai final yang biasanya untuk produksi.
- Branch `development` sebagai tempat merging dari semua fitur-fitur yang ada. Sudah perfect untuk branch ini.
- Gunakan branch sebaik mungkin sesuai kebutuhan dan kegunannya.
- Branch `master` jangan diubah-ubah, hanya menerima pull request yang sudah final.
