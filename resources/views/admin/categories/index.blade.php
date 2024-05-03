@extends('layouts.admin')

@section('content')
        <div class="card">
            <div class="card-header">
                <h3> DANH SÁCH DANH MỤC
                    <a href="{{ route('admin.categories.create') }}" class="btn btn-primary float-right">
                        Thêm mới
                    </a>
                </h3>     
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered"  id = "categories-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Nhãn</th>
                                <th>Số Lượng Tag</th>
                                <th>Hình Ảnh</th>
                                <th>Danh Mục Lớn</th>
                                <th>Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($categories as $category)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $category->name }}</td>
                                    <td>{{ $category->slug }}</td>
                                    <td>{{ $category->products_count }}</td>
                                    <td>
                                        @if($category->photo)
                                            <a href="{{ $category->photo->getUrl() }}" target="_blank">
                                                <img src="{{ $category->photo->getUrl() }}" width="50px" height="50px">
                                            </a>
                                        @else
                                            <span class="badge badge-warning">No Image</span>
                                        @endif
                                    </td>
                                    <td>{{ $category->parent->name ?? 'Null' }}</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="{{ route('admin.categories.edit', $category->id) }}" class="btn btn-info">
                                                <i class="fa fa-pencil-alt"></i>
                                            </a>
                                            <form onclick="return confirm('are you sure ?');" action="{{ route('admin.categories.destroy', $category->id) }}" method="post">
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
        new DataTable('#categories-table');
    </script>
@endsection