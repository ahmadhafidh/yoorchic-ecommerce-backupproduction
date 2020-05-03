<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="row">
   <div class="col s12 l3 m12">
      <ul class="collection with-header">
         <li class="collection-header"><h5>Price</h5></li>
         <li class="collection-item">
            <br />
            <form action="<?=site_url('home/price');?>" method="post">
               <div class="row">
                  <div class="input-field col s12 m12 l12">
                     <input type="text" class="validate uang" name="min" min="0" value="0" onfocus="this.value = ''">
                     <label>Low Price</label>
                  </div>
                  <div class="input-field col s12 m12 l12">
                     <input type="text" class="validate uang" name="max" min="0" value="0" onfocus="this.value = ''">
                     <label>Hight Price</label>
                  </div>
                  <button type="submit" name="submit" class="waves-effect waves-light btn-flat blue white-text" value="Filter">Filter</button>
               </div>
            </form>
         </li>
      </ul>
   </div>

   <div class="col s12 l9 m12 content">
      <?php
      //tampilkan pesan gagal
      if ($this->session->flashdata('alert'))
      {
         echo '<div class="alert alert-danger alert-message">';
         echo '<center>'.$this->session->flashdata('alert').'</center>';
         echo '</div>';
      }
      //tampilkan pesan success
      if ($this->session->flashdata('success'))
      {
         echo '<div class="alert alert-success alert-message">';
         echo '<center>'.$this->session->flashdata('success').'</center>';
         echo '</div>';
      }
      //tampilkan header pencarian
      if (isset($search) && $search != null)
      {
         echo '<h4>Hasil Pencarian dari "'.$search.'"</h4>';
      }
      //tampilkan header kategori
      if ($data->num_rows() > 0)
      {
         if (isset($url)) {
            echo '<h4>List Item Pada Kategori "'.$url.'"</h4><hr />';
         }
      ?>
      <div class="row">
         <?php
         if (isset($fav) && $fav->num_rows() > 0) {
            foreach ($fav->result() as $f) :
               $favorite[] = $f->id_item;
            endforeach;
         }
         ?>
         <?php foreach($data->result() as $key) : ?>
            <div class="col s12 m6 l4">
               <div class="card medium">
                  <div class="card-image">
                     <a href="<?= site_url('home/detail/'.$key->link); ?>">
                        <img src="<?= base_url('assets/upload/'.$key->gambar); ?>" class="responsive-img">
                     </a>
                  </div>
                  <span class="card-title"><?= $key->nama_item; ?></span>
                  <p class="harga">
                     Rp. <?= number_format($key->harga, 0, ',', '.'); ?>,-
                  </p>
                  <div class="card-action center">
                     <form action="<?= site_url('cart/add/'.$key->link); ?>" method="post">
                        <div class="left">
                           <?php
                           if ($this->cart->contents())
                           {
                              foreach ($this->cart->contents() as $cart) {
                                 $stok = ($cart['id'] == $key->id_item) ? ($key->stok - $cart['qty']) : $key->stok;
                              }
                           } else {
                              $stok = $key->stok;
                           }

                           if ($stok >= 10)
                           {
                              echo 'Stok : <span class="badge green white-text">'.$stok.'</span>';
                           } elseif ($stok < 10 && $stok > 0) {
                              echo 'Stok : <span class="badge orange white-text">'.$stok.'</span>';
                           } else {
                              echo 'Stok : <span class="badge red white-text">Habis</span>';
                           }
                           ?>
                        </div>
                        <input type="number" name="qty" value="1" min="1" max="<?= $key->stok; ?>" <?php if ($stok < 1) { echo 'disabled'; }?>>

                        <a href="<?= site_url('home/detail/'.$key->link); ?>" class="waves-effect waves-light btn blue white-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="Lihat Detail">
                           <i class="fa fa-search-plus"></i>
                        </a>

                        <button type="submit" class="waves-effect waves-light btn green white-text tooltipped" name="submit" value="Submit" <?php if ($key->stok < 1) { echo 'disabled'; } ?> data-position="bottom" data-delay="50" data-tooltip="Tambah ke Keranjang">
                           <i class="fa fa-shopping-cart"></i>
                        </button>
                        <!-- Set tooltip dan icon untuk button favorite -->
                        <?php
                           if (isset($fav) && $fav->num_rows() > 0) {
                              if (in_array($key->id_item, $favorite))
                              {
                                 $tooltip = 'Hapus dari Favorite';
                                 $icon    = '<i class="fa fa-heart"></i>';
                              } else {
                                 $tooltip = 'Tambah ke Favorite';
                                 $icon    = '<i class="fa fa-heart-o"></i>';
                              }
                           } else {
                              $tooltip = 'Tambah ke Favorite';
                              $icon    = '<i class="fa fa-heart-o"></i>';
                           }
                        ?>

                        <a href="<?= site_url('home/favorite/'.$key->link); ?>" class="waves-effect waves-light btn pink white-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="<?= $tooltip; ?>">
                           <?= $icon; ?>
                        </a>
                     </form>
                  </div>
               </div>
            </div>
         <?php endforeach; ?>
      </div>
      <?= $link; ?>
      <?php
      } else {
         if (isset($url)) {
            echo '<h5>Kategori "'.$url.'" Masih Kosong</h5><hr />';
         } else {
            echo '<h5>Item tidak ditemukan....</h5>';
         }
      }
      ?>
   </div>
</div>

