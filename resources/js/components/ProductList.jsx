import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import swal from "sweetalert";
import styles from "./products.module.css";

const formatPrice = (price) => {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

const ProductList = () => {
    const [products, setProducts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [visibleProducts, setVisibleProducts] = useState(8);
    const [loadingMore, setLoadingMore] = useState(false);
    const [allProductsLoaded, setAllProductsLoaded] = useState(false);

    const fetchProducts = async () => {
        setLoading(true);
        const response = await axios.get('/products');
        if (response.status === 200) {
            setProducts(response.data.products);
            setVisibleProducts(8);
            setAllProductsLoaded(false);
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
            setVisibleProducts(8);
            setAllProductsLoaded(false);
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

    const loadMoreProducts = () => {
        setLoadingMore(true);
        setTimeout(() => {
            setVisibleProducts((prevVisibleProducts) => prevVisibleProducts + 8);
            setLoadingMore(false);
            if (visibleProducts + 8 >= products.length) {
                setAllProductsLoaded(true);
            }
        }, 2000);
    };

    return (
        <>
            <form
                className={styles.searchForm}
                style={{ width: '1000px', margin: '0 auto' }}
                onSubmit={(e) => {
                    e.preventDefault();
                    const keyword = e.target.elements.keyword.value;
                    handleSearch(keyword);
                }}
            >
                <input type="text" name="keyword" placeholder="Bạn cần tìm gì?"
                    style={{
                        width: '70%', padding: '10px', boxSizing: 'border-box', marginBottom: '10px',
                        border: '1px solid #ccc',
                    }}
                />
                <button type="submit" style={{
                    width: '10%', padding: '10px', marginBottom: '10px',
                    background: '#7FAD39',
                    color: 'white',
                    fontWeight: 'bold',
                    border: '1px solid #7FAD39',
                }}>Tìm kiếm</button>
            </form>
            {loading ? (
                <h2>Loading...</h2>
            ) : products.length === 0 ? (
                <h3>Không tìm thấy !</h3>
            ) : (
                <>
                    {products.slice(0, visibleProducts).map((product) => (
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
                                    <h5>{formatPrice(product.price)}đ</h5>
                                </div>
                            </div>
                        </div>
                    ))}
                    {products.length > visibleProducts && (
                        <button disabled={loadingMore} onClick={loadMoreProducts}>
                            {loadingMore ? 'Loading...' : 'Load more'}
                        </button>
                    )}
                    {!allProductsLoaded && visibleProducts === products.length && (
                        <button onClick={() => setVisibleProducts(8)}>
                            Ẩn bớt
                        </button>
                    )}
                </>
            )}
        </>
    );
};

export default ProductList;

if (document.getElementById("product-list")) {
    ReactDOM.render(<ProductList />, document.getElementById("product-list"));
}
