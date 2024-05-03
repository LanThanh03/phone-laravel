<?php

namespace App\Exports;

use App\Models\Product;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class UsersExport implements FromCollection, WithHeadings, WithMapping
{
    public function collection()
    {
        return Product::with('category')->get(['id', 'name', 'price', 'quantity','description', 'category_id']);
    }
    public function map($product): array
    {
        return [
            $product->id,
            $product->name,
            $product->price,
            $product->quantity,
            $product->description,
            $product->category->name,
        ];
    }

    public function headings(): array
    {
        return [
            'ID',
            'Tên sản phẩm',
            'Giá',
            'Tồn kho',
            'Mô tả',
            'Danh mục', 
        ];
    }
}