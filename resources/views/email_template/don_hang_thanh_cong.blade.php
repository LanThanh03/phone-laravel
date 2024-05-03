<html>
    <head>
        <style>
            .book-table
            {
                border-collapse:collapse;
            }
            .book-table tr th
            {
                text-align:center;
            }
            .book-table tr th, .book-table tr td
            {
                border:1px solid #000;
                padding:3px;
            }
        </style>
    </head>
    <body>
    @php
    $customer_first_name = isset($data[0]->customer_first_name) ? $data[0]->customer_first_name : '';
    $customer_address = isset($data[0]->customer_address) ? $data[0]->customer_address : '';
    $customer_phone = isset($data[0]->customer_phone) ? $data[0]->customer_phone : '';
    $notes = isset($data[0]->notes) ? $data[0]->notes : '';
    $id = isset($data[0]->id) ? $data[0]->id : '';
    $customer_city = isset($data[0]->customer_city) ? $data[0]->customer_city : '';
    $customer_province = isset($data[0]->customer_province) ? $data[0]->customer_province : '';
    @endphp
    <div style="background: #fafaf7; border-radius: 12px; padding: 20px; width: 70%;">
    <p style="font-style: italic; color: red; font-size: 9px">
        *Đây là email được gửi tự động từ hệ thống, vui lòng không phản hồi lại email này.
    </p>
    <!-- <div style="text-align: center;">
        <img src="/hình/logo.png">
       </div> -->
    <hr  width="100%" />
    <p style="text-align: center;">Mã đơn đặt hàng: {{$id}}</p>
    <hr  width="100%" />
    <div class="col-md-6" style="text-align: center; font-weight: bold; font-size: 20px; color: blue;">
            <p>CẢM ƠN BẠN ĐÃ ĐẶT HÀNG</p>
    </div>
    <div>
    <p>Xin chào <span style="font-weight: bold; color: red;">{{$customer_first_name}}</span>, Phone Store xin chân thành cảm ơn quý khách đã tin tưởng, lựa chọn mua hàng ở Phone Store.</p>
    <p>Phone Store đã nhận được thông tin nhận hàng và thông tin đơn hàng như sau:</p>
    </div>

    <div style='font-weight:bold;color:black; text-transform: uppercase; font-size: 15px;'>
    1. Thông tin nhận hàng
    </div>
    <div>
    <p>Địa chỉ nhận hàng: {{$customer_address}}, {{$customer_city}}, {{$customer_province}}</p>
    <p>Số điện thoại: {{$customer_phone}}</p>
    <p>Ghi chú đơn hàng:{{$notes}}</p>
    </div>
    
    <div style='font-weight:bold;color:black; text-transform: uppercase; font-size: 15px;'>
        2. Thông tin đơn hàng
    </div>
    <table class='book-table' style='margin:0 auto; width:30%'>
        <thead>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Tổng tiền</th>
        </thead>
        <tbody>
            @foreach($data as $key=>$row)
                <tr align='center'>
                    <td >{{$key+1}}</td>
                    <td>{{$row->name}}</td>
                    <td>{{$row->qty}}</td>
                    <td>{{number_format($row->sub_total,0,',','.')}}đ</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    

    @php
    $grand_total = isset($data[0]->grand_total) ? $data[0]->grand_total : '';
    @endphp

<div>
    <p>Tổng giá trị đơn hàng: <span style="font-weight: bold; color: red;">{{ number_format($grand_total, 0, ',', '.') }}đ</span></p>
</div>
    </div>
</body>
</html>