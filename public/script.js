function prosesBooking() {
    const checkin = document.getElementById('checkin').value;
    const checkout = document.getElementById('checkout').value;
    
    if(!checkin || !checkout) {
        alert('Mohon isi tanggal Check-in dan Check-out terlebih dahulu!');
        return;
    }
    
    alert(`Memproses pemesanan Anda dari tanggal ${checkin} hingga ${checkout}.\nMohon tunggu sebentar...`);
}
