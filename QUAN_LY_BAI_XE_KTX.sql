CREATE DATABASE QUAN_LY_BAI_XE
GO
USE QUAN_LY_BAI_XE
GO
CREATE TABLE NhanVien (
    MaNV VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh VARCHAR(30),
    GioiTinh NVARCHAR(10),
    SoDienThoai NVARCHAR(15),
    DiaChi NVARCHAR(255),
    Email NVARCHAR(100),
    VaiTro NVARCHAR(50),
    NgayBatDauLam VARCHAR(30),
    TenDangNhap NVARCHAR(50),
	matKhau NVARCHAR(10),
    TrangThai NVARCHAR(30),
    AnhNV NVARCHAR(MAX) -- Lưu trữ đường dẫn hoặc dữ liệu nhị phân cho hình ảnh
);
SELECT MaNV,HoTen,NgaySinh,GioiTinh,SoDienThoai,DiaChi,Email,VaiTro,NgayBatDauLam,TenDangNhap,matKhau,TrangThai,AnhNV FROM NhanVien 

DELETE FROM NhanVien WHERE MaNV =?

UPDATE NhanVien
SET HoTen =?,NgaySinh=?,GioiTinh=?,SoDienThoai=?,DiaChi=?,Email=?,VaiTro=?,NgayBatDauLam=?,TenDangNhap=?,matKhau=?,TrangThai=?,AnhNV=? 
WHERE MaNV =?

INSERT INTO NhanVien(MaNV,HoTen,NgaySinh,GioiTinh,SoDienThoai,DiaChi,Email,VaiTro,NgayBatDauLam,TenDangNhap,matKhau,TrangThai,AnhNV) --Phần ảnh gắn link ảnh vào
VALUES ('NV01',N'LƯU SƠN TRƯỜNG','04-01-2005',N'Nam',N'0346575842',N'LỤC NGẠN - BẮC GIANG',N'truongsivar@gmail.com',N'Quản Lý','20-03-2024',N'TRUONGLS',N'lst6666',N'Đang Làm',N'C:\images\anh_nhan_vien.jpg')
INSERT INTO NhanVien(MaNV,HoTen,NgaySinh,GioiTinh,SoDienThoai,DiaChi,Email,VaiTro,NgayBatDauLam,TenDangNhap,matKhau,TrangThai,AnhNV)
VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)
GO

--BẢNG ĐĂNG KÝ VÉ XE
IF OBJECT_ID('DangKyVeXe') IS NOT NULL
DROP TABLE DangKyVeXe
GO
CREATE TABLE DangKyVeXe (
    MaVe VARCHAR(10) PRIMARY KEY,
    HoTenKH NVARCHAR(100),
    SoDienThoai NVARCHAR(15),
    BienSoXe NVARCHAR(10),
    LoaiVe NVARCHAR(50),
	LoaiXe NVARCHAR(50),
    ViTriDeXe NVARCHAR(10),
    NgayDangKy DATE,
    NgayHetHan DATE,
    DonGia INT,
	TienKhachDua INT,
	TienTraLai INT,
	TrangThai NVARCHAR(20)
);

--PHẦN HIỂN THỊ
select MaVe,HoTenKH,SoDienThoai,BienSoXe,LoaiVe,LoaiXe,ViTriDeXe,NgayDangKy,NgayHetHan,DonGia,TienKhachDua,TienTraLai,TrangThai from DangKyVeXe
--phần hóa đơn
select MaVe,HoTenKH,BienSoXe,LoaiVe,NgayDangKy,NgayHetHan,DonGia,TrangThai from DangKyVeXe
select MaVe,HoTenKH,BienSoXe,LoaiVe,NgayDangKy,NgayHetHan,DonGia,TrangThai from DangKyVeXe where MaVe = ?
--TÌM KIẾM 
select MaVe,HoTenKH,SoDienThoai,BienSoXe,LoaiVe,LoaiXe,ViTriDeXe,NgayDangKy,NgayHetHan,DonGia,TienKhachDua,TienTraLai,TrangThai from DangKyVeXe
where MaVe=?
--PHẦN INSERT(THÊM)
insert into DangKyVeXe (MaVe,HoTenKH,SoDienThoai,BienSoXe,LoaiVe,LoaiXe,ViTriDeXe,NgayDangKy,NgayHetHan,DonGia,TienKhachDua,TienTraLai,TrangThai)
values(?,?,?,?,?,?,?,?,?,?,?,?.?)
--PHẦN UPDATE
update DangKyVeXe set HoTenKH=?,SoDienThoai=?,BienSoXe=?,LoaiVe=?,LoaiXe=?,ViTriDeXe=?,NgayDangKy=?,NgayHetHan=?,DonGia=?,TienKhachDua=?,TienTraLai=?,TrangThai=?
where MaVe=?
--PHẦN XÓA
delete from DangKyVeXe where MaVe=?

INSERT INTO DangKyVeXe(MaVe,HoTenKH,SoDienThoai,BienSoXe,LoaiVe,LoaiXe,ViTriDeXe,NgayDangKy,NgayHetHan,DonGia,TienKhachDua,TienTraLai,TrangThai)
VALUES ('X01',N'Nguyễn Văn A',N'0346472324',N'98A-23456',N'Vé Tháng',N'Xe máy',N'A1','2024-04-03','2024-05-03',70000,70000,0,N'Đã thanh toán')
---check trùng
select MaVe,HoTenKH,SoDienThoai,BienSoXe,LoaiVe,LoaiXe,ViTriDeXe,NgayDangKy,NgayHetHan,DonGia,TienKhachDua,TienTraLai,TrangThai from DangKyVeXe
where MaVe=?

	GO

-- Tạo bảng Quản Lý Phương Tiện
if OBJECT_ID('PhuongTien') is not null
drop table PhuongTien
go
CREATE TABLE PhuongTien (
    MaPT VARCHAR(10) PRIMARY KEY,
    HangXe NVARCHAR(50),
    MauSac NVARCHAR(20),
    LoaiXe NVARCHAR(50),
    BienSoXe NVARCHAR(10),
    HinhAnh NVARCHAR(MAX) -- Lưu trữ đường dẫn cho hình ảnh
	FOREIGN KEY (MaPT) REFERENCES DangKyVeXe(MaVe) ON DELETE CASCADE
);
SELECT MaPT,BienSoXe,HangXe,MauSac,LoaiXe,HinhAnh FROM PhuongTien

INSERT INTO PhuongTien(MaPT,HangXe,MauSac,LoaiXe,BienSoXe,HinhAnh)
VALUES ('PT01',N'HONDA',N'Đen Nhám',N'Xe Máy',N'98A-23456',N'C:\images\anh_nhan_vien.jpg')--Phần ảnh gắn link ảnh vào

INSERT INTO PhuongTien(MaPT,BienSoXe,HangXe,MauSac,LoaiXe,HinhAnh)
VALUES (?,?,?,?,?,?)

UPDATE PhuongTien
SET BienSoXe=?,HangXe=?,MauSac=?,LoaiXe=?,HinhAnh=?
WHERE MaPT=?

DELETE FROM PhuongTien WHERE MaPT=?

SELECT MaPT,BienSoXe,HangXe,MauSac,LoaiXe,HinhAnh FROM PhuongTien WHERE  BienSoXe= ?
--Check trùng
SELECT MaPT,BienSoXe,HangXe,MauSac,LoaiXe,HinhAnh FROM PhuongTien WHERE  MaPT= ?

GO
-- Tạo bảng Quản Lý Bãi Xe
if OBJECT_ID('KhuVucBaiXe') IS NOT NULL
DROP TABLE KhuVucBaiXe
go
CREATE TABLE KhuVucBaiXe (
    KhuVuc NVARCHAR(10) PRIMARY KEY,
	MaNV_PhuTrach VARCHAR(10),
    SucChua INT,
    TongSoXe INT,
    SoLuongChoConTrong INT,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaNV_PhuTrach) REFERENCES NhanVien(MaNV)
	ON DELETE CASCADE-- Ràng buộc khóa ngoại liên kết với bảng NhanVien
);


select KhuVuc,MaNV_PhuTrach,SucChua,TongSoXe,SoLuongChoConTrong,TrangThai from KhuVucBaiXe

DELETE FROM KhuVucBaiXe WHERE KhuVuc = ?;

UPDATE KhuVucBaiXe
SET KhuVuc = ? , MaNV_PhuTrach = ? ,SucChua = ? , TongSoXe = ? ,SoLuongChoConTrong = ?, TrangThai = ? 
WHERE KhuVuc = ?
select KhuVuc, MaNV_PhuTrach, SucChua, TongSoXe, SoLuongChoConTrong, TrangThai from KhuVucBaiXe where KhuVuc=?

GO
-- Tạo bảng Quản Lý Xe Ra Vào

if OBJECT_ID('XeRaVao') IS NOT NULL
DROP TABLE XeRaVao
go
CREATE TABLE XeRaVao (
    MaVe VARCHAR(10),
	KhuVuc NVARCHAR(10),
    ThoiGianVao VARCHAR(30),
    ThoiGianRa VARCHAR(30),
    LoaiVe NVARCHAR(50),
	BienSoXe NVARCHAR(10),
	DonGia VARCHAR(10),
    PRIMARY KEY (MaVe, ThoiGianVao),
	 FOREIGN KEY (KhuVuc) REFERENCES KhuVucBaiXe(KhuVuc)
	 ON DELETE CASCADE
);

SELECT MaVe,KhuVuc, BienSoXe, LoaiVe, ThoiGianVao, ThoiGianRa,DonGia  FROM XeRaVao

SELECT MaVe,KhuVuc, BienSoXe, LoaiVe, ThoiGianVao, ThoiGianRa,DonGia  FROM XeRaVao WHERE MaVe=?


INSERT INTO XeRaVao(MaVe,KhuVuc,BienSoXe,LoaiVe,ThoiGianVao,ThoiGianRa,DonGia)
VALUES (?,?,?,?,?,?,?)

DELETE FROM XeRaVao WHERE MaVe = ?

UPDATE XeRaVao
SET MaVe = ?,KhuVuc=?, BienSoXe = ?, LoaiVe = ?, ThoiGianVao = ?, ThoiGianRa = ?,DonGia=?
WHERE MaVe = ?


GO
if OBJECT_ID('DoanhThu') is not null
drop table DoanhThu
-- Tạo bảng Quản Lý Doanh Thu
CREATE TABLE DoanhThu (
	IDDoanhThu VARCHAR(10) PRIMARY KEY,
    KhuVuc NVARCHAR(10) FOREIGN KEY REFERENCES KhuVucBaiXe(KhuVuc) ON DELETE CASCADE,
	Nam Date, --đầu
    TongSoVeBanRa INT,
    LoaiVe NVARCHAR(255),
    TongDoanhThu INT,
	LoaiXe NVARCHAR(50)

);


DELETE FROM DoanhThu where IDDoanhThu = ?;
UPDATE DoanhThu
SET TongSoVeBanRa = (SELECT COUNT(MaVe)
         				FROM XeRaVao
          				WHERE LoaiVe = N'Vé Ngày' 
				   and MONTH(ThoiGianRa) = 8 
				   AND  YEAR(ThoiGianRa) = 2024)
                where LoaiVe = N'Vé Ngày' AND KhuVuc = N'A1' and MONTH(NAM) = 8 AND  YEAR(NAM) = 2024

		select IDDoanhThu,LoaiVe,Nam,KhuVuc,TongSoVeBanRa,TongDoanhThu from DoanhThu
		INSERT INTO DoanhThu(IDDoanhThu,LoaiVe,Nam,KhuVuc,TongSoVeBanRa,TongDoanhThu) 
		VALUES (?,?,?,?,?,?)
		select IDDoanhThu,LoaiVe,Nam,KhuVuc,TongSoVeBanRa,TongDoanhThu from DoanhThu order by  TongDoanhThu desc
		select IDDoanhThu,LoaiVe,Nam,KhuVuc,TongSoVeBanRa,TongDoanhThu from DoanhThu where IDDoanhThu=?
		select IDDoanhThu,LoaiVe,Nam,KhuVuc,TongSoVeBanRa,TongDoanhThu from DoanhThu where IDDoanhThu=?


GO
CREATE TABLE HoTro (
    MaHoTro VARCHAR(10) PRIMARY KEY,
    TenHoTro NVARCHAR(100),
    MoTa NVARCHAR(255),
    NgayTao VARCHAR(30),
	GhiChu NVARCHAR(255)
);
INSERT INTO HoTro(MaHoTro,TenHoTro,MoTa,NgayTao,GhiChu)
VALUES ('HT01',N'Hỗ Trợ Sửa Xe',N'Xe máy bị đứt xích','12-07-2024',N'KHẨN CẤP')

