<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class order_items extends Model
{
    use HasFactory;

    public function order_items()
    {
        return $this->belongsTo(products::class, 'product_id');
    }
}
