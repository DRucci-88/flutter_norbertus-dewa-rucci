# Praktikum - (03) Basic Version and Branch Management (Git)

<div align='center'>
  <img src='../screenshots/Nodejs.png' style='margin: auto' width='25%' />
</div>
All code written in javascript

## Link Repository test

https://github.com/DRucci-88/git-test-rucci

## Membuat repository

Menghubungkan proyek pada local dengan git pada server.

<img src='../screenshots/1_buat_repo_github.jpg' alt='Membuat repository pada github' />

## Implementasi penggunaan brancing

Membuat 4 branch yang terdiri dari master, development, featureA dan featureB.

<img src='../screenshots/2_branching.jpg' alt='Branching' />

## Implementasi intruksi git untuk push, pull, stash and merge

#### Working Directory

<img src='../screenshots/3_1_change.jpg' alt='Working directory' />

#### Staged Area

<img src='../screenshots/3_2_staged.jpg' alt='Staged area' />

#### Commit

<img src='../screenshots/3_3_commit.jpg' alt='Commit' />

#### Push

<img src='../screenshots/3_4_push.jpg' alt='Push' />

#### Stash

<img src='../screenshots/3_5_stash.jpg' alt='Stash' />

#### Stash Apply

<img src='../screenshots/3_6_stash_apply.jpg' alt='Stash Apply' />

## Implementasi penanganan konflik

### First setup branch

Membuat kode default pada branch Development. Lalu membuat branch featureA dan featureB berdasarkan branch development serta menambahkan menuliskan kode secara unik untuk memancing terjadinya konflik.

<div align='center'>
  <img src='../screenshots/4_1_development.jpg' alt='Branch development' width='45%' />
  <img src='../screenshots/4_2_featureA.jpg' alt='Branch feature A' width='45%' />
</div>
<img src='../screenshots/4_3_featureB.jpg' alt='Branch feature B' />

### Merge branch

Branch development merge dari branch featureA lalu kemudian merge lagi dari branch featureB.

#### Development merge featureA

<img src='../screenshots/4_4_development_merge_featureA.jpg' alt='Merge development feature A' />

#### Development merge featureB

<img src='../screenshots/4_5_konflik_development_merge_featureB.jpg' alt='Konflik merge devellopment feature B' />

#### Mengatasi konflik

<img src='../screenshots/4_6_solve_konflik.jpg' alt='Mengatasi konflik' />

#### Hasil final

<img src='../screenshots/4_7_final_solve.jpg' alt='Hasil final' />
