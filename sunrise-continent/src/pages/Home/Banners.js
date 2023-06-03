
import '../../assets/styles/scss/_home.scss';

const Banners = ({data_banner}) => {
    const banners = data_banner.map(banner => {
        return (
            <img
                className="home-banner__img"
                src={banner.src}
                alt="hotel banner"
                key={banner.id}
            />
        )
    })
    return (
        <div className="home-banner__slider">
            <div className="home-banner__slides">
                {banners}
            </div>
        </div>
    )
}

export default Banners;
