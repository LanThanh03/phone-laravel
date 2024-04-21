import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import swal from "sweetalert";
import styles from "./products.module.css";
const formatPrice = (price) => {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

const ProductShop = () => {
    const [products, setProducts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");
    const [currentPage, setCurrentPage] = useState(1);
    const [productsPerPage] = useState(6);
    const [slug, setSlug] = useState("");
    const [sortingBy, setSortingBy] = useState("default"); // Thêm state mới cho tiêu chí sắp xếp

    useEffect(() => {
        const search = window.location.pathname;
        let currentSlug = search.split("/").slice(-1).pop();
        if (currentSlug === "shop") {
            currentSlug = ""; // Chuyển "shop" thành chuỗi trống
        }
        setSlug(currentSlug); // Cập nhật giá trị slug

        // Gọi API khi currentPage hoặc sortingBy thay đổi
        axios
            .get(`/products/${currentSlug}?sortingBy=${sortingBy}`)
            .then((res) => {
                if (res.status === 200) {
                    setProducts(res.data.products);
                }
                setLoading(false);
            })
            .catch((error) => {
                setError(error.response.statusText);
                setLoading(false);
            });
    }, [currentPage, slug, sortingBy]); // Thêm sortingBy vào dependency array

    const indexOfLastProduct = currentPage * productsPerPage;
    const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
    const currentProducts = products.slice(indexOfFirstProduct, indexOfLastProduct);

    const paginate = (pageNumber) => setCurrentPage(pageNumber);

    const addToCart = (e, productId) => {
        e.preventDefault();

        axios.post("/carts", { productId }).then((res) => {
            if (res.status === 200) {
                swal("Success", "Added to Cart !", "success");
                window.location.reload();
            }
        });
    };

    const handleSortingChange = (e) => {
        setSortingBy(e.target.value); // Cập nhật tiêu chí sắp xếp khi thay đổi
    };

    return (
        <>
            <div className="filter__item">
                <div className="row">
                    <div className="col-lg-4 col-md-5">
                        <form method="get">
                            <div
                                className="filter__sort"
                                style={{
                                    display: "flex",
                                    alignItems: "center",
                                    columnGap: ".5rem",
                                }}
                            >
                                <label>Sắp xếp theo:</label>
                                <select
                                    name="sortingBy"
                                    style={{ width: "150px" }}
                                    className="form-control"
                                    onChange={handleSortingChange}
                                >
                                    <option value="default">
                                        Mặc định
                                    </option>
                                    <option value="popularity">
                                        Phổ biến
                                    </option>
                                    <option value="low-high">
                                        Giá: Từ thấp tới cao
                                    </option>
                                    <option value="high-low">
                                        Giá: Từ cao xuống thấp
                                    </option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div className="col-lg-4 col-md-4">
                        <div className="filter__found">
                            <h6>
                                <span>{products.length}</span> Sản phẩm được tìm thấy
                            </h6>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-3">
                        <div className="filter__option">
                            <span className="icon_grid-2x2"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div className="row">
                {loading ? (
                    <h3>Loading...</h3>
                ) : error === "Not Found" ? (
                    <h3>Không tìm thấy !</h3>
                ) : products.length === 0 ? (
                    <h3>Không tìm thấy !</h3>
                ) : (
                    currentProducts.map((product) => {
                        return (
                            <div
                                key={product.id}
                                className="col-lg-4 col-md-6 col-sm-6"
                            >
                                <div className="product__item">
                                    <div
                                        className="product__item__pic"
                                        style={{
                                            backgroundImage: `url(${product.media[0].original_url})`,
                                        }}
                                    >
                                        <ul className="product__item__pic__hover">
                                            <li>
                                                <a href="#">
                                                    <i className="fa fa-heart"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a
                                                    href="#"
                                                    onClick={(e) =>
                                                        addToCart(e, product.id)
                                                    }
                                                >
                                                    <i className="fa fa-shopping-cart"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div className="product__item__text">
                                        <h6>
                                            <a
                                                href={`/product/${product.slug}`}
                                            >
                                                {product.name}
                                            </a>
                                        </h6>
                                        <h5>{formatPrice(product.price)}đ</h5>
                                    </div>
                                </div>
                            </div>
                        );
                    })
                )}
            </div>
            <div className={styles.pagination}> {/* Sử dụng className từ CSS module */}
                {Array.from({ length: Math.ceil(products.length / productsPerPage) }).map((_, index) => (
                    <button key={index} onClick={() => paginate(index + 1)}>
                        {index + 1}
                    </button>
                ))}
            </div>
        </>
    );
};

export default ProductShop;

if (document.getElementById("product-shop")) {
    ReactDOM.render(<ProductShop />, document.getElementById("product-shop"));
}