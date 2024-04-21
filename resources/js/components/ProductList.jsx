import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import swal from "sweetalert";

const ProductList = () => {
    const [products, setProducts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [displayedProducts, setDisplayedProducts] = useState(8); // Số lượng sản phẩm hiển thị ban đầu

    const fetchProducts = async () => {
        setLoading(true);
        const response = await axios.get('/products');
        if (response.status === 200) {
            setProducts(response.data.products);
        }
        setLoading(false);
    };

    useEffect(() => {
        fetchProducts();
    }, []);

    const handleSearch = async (keyword) => {
        setLoading(true);
        const requestData = { keyword };
        const response = await axios.post('/search', requestData, {
            headers: {
                'Content-Type': 'application/json'
            }
        });
        if (response.status === 200) {
            setProducts(response.data.products);
        }
        setLoading(false);
    };

    const addToCart = (e, productId) => {
        e.preventDefault();

        axios.post("carts", { productId }).then((res) => {
            if (res.status === 200) {
                swal("Thành công", "Đã thêm vào giỏ hàng !", "Thành công");
                window.location.reload();
            }
        });
    };

    const handleLoadMore = () => {
        setDisplayedProducts(displayedProducts + 8);
    };

    return (
        <>
            <form
                style={{ width: '1000px', margin: '0 auto' }}
                onSubmit={(e) => {
                    e.preventDefault();
                    const keyword = e.target.elements.keyword.value;
                    handleSearch(keyword);
                }}
            >
                <input
                    type="text"
                    name="keyword"
                    placeholder="Bạn cần tìm gì?"
                    style={{
                        width: '70%', padding: '10px', boxSizing: 'border-box', marginBottom: '10px',
                        border: '1px solid #ccc',
                    }}
                />
                <button
                    type="submit"
                    style={{
                        width: '10%', padding: '10px', marginBottom: '10px',
                        background: '#7FAD39',
                        color: 'white',
                        fontWeight: 'bold',
                        border: '1px solid #7FAD39',
                    }}
                >
                    Tìm kiếm
                </button>
            </form>

            <div className="row">
                {loading ? (
                    <h2>Loading...</h2>
                ) : products.length === 0 ? (
                    <h3>Không tìm thấy !</h3>
                ) : (
                    products.slice(0, displayedProducts).map((product) => (
                        <div
                            key={product.id}
                            className="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat"
                        >
                            <div className="featured__item">
                                <div
                                    className="featured__item__pic"
                                    style={{
                                        backgroundImage: `url(${product.media[0].original_url})`,
                                    }}
                                >
                                    <ul className="featured__item__pic__hover">
                                        <li>
                                            <a href="#">
                                                <i className="fa fa-heart"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a
                                                href="#"
                                                onClick={(e) => addToCart(e, product.id)}
                                            >
                                                <i className="fa fa-shopping-cart"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div className="featured__item__text">
                                    <h6>
                                        <a href={`product/${product.slug}`}>
                                            {product.name}
                                        </a>
                                    </h6>
                                    <h5>{product.price}vnđ</h5>
                                </div>
                            </div>
                        </div>
                    ))
                )}
            </div>
            {products.length > displayedProducts && (
                <div className="text-center">
                    <button
                        className="btn btn-primary"
                        onClick={handleLoadMore}
                        style={{ marginTop: '20px' }}
                    >
                        Xem thêm
                        {/* Xem thêm  Mỗi mục xem thêm chỉ được cộng 8 sp */}
                    </button>
                </div>
            )}
        </>
    );
};
export default ProductList;

if (document.getElementById("product-list")) {
    ReactDOM.render(<ProductList />, document.getElementById("product-list"));
}
