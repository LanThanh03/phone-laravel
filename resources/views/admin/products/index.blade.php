@extends('layouts.admin')

@section('content')
        <div class="card">
            <div class="card-header">
                <h3>DANH SÁCH SẢN PHẨM
                    <a href="{{ route('export') }}" class="btn btn-success float-right">
                        Export
                    </a>
                    <a href="{{ route('admin.products.create') }}" class="btn btn-primary float-right">
                        Thêm mới
                    </a>
                </h3>     
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered" id = "product-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Danh Mục</th>
                                <th>Tag</th>
                                <th>Giá Tiền</th>
                                <th>Số Lượng</th>
                                <th>Hình Ảnh</th>
                                <th>Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($products as $product)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $product->name }}</td>
                                    <td>
                                        <span class="badge badge-success">{{ $product->category->name }}</span>
                                    </td>
                                    <td>
                                        @foreach($product->tags as $tag)
                                            <span class="badge badge-primary"> {{ $tag->name  }}</span>
                                        @endforeach
                                    </td>
                                    <td>{{ number_format($product->price) }}vnđ</td>
                                    <td>{{ $product->quantity }}</td>
                                    <td>
                                        @if(count($product->gallery)  > 0)
                                            <a href="{{ $product->getMedia('gallery')->first()->getUrl() }}" target="_blank">
                                                <img src="{{ $product->getMedia('gallery')->first()->getUrl() }}" width="45px" height="45px" alt="">  
                                            </a>
                                        @else
                                            <span class="badge badge-warning">no image</span>
                                        @endif
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="{{ route('admin.products.show', $product->id) }}" class="btn btn-warning">
                                                <i class="fa fa-eye"></i>
                                            </a>
                                            <a href="{{ route('admin.products.edit', $product->id) }}" class="btn btn-info">
                                                <i class="fa fa-pencil-alt"></i>
                                            </a>
                                            <form onclick="return confirm('bạn có chắc chắn muốn xóa sản phẩm không??');" action="{{ route('admin.products.destroy', $product->id) }}" method="post">
                                                @csrf 
                                                @method('delete')
                                                <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i></button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
    <script>
        new DataTable('#product-table');
    </script>
@endsection