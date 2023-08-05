using SunriseServerData;
using SunriseServerCore.RepoInterfaces;
using SunriseServerData.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace SunriseServerData
{
    public class UnitOfWork
    {
        readonly DataContext _dataContext;
        public UnitOfWork(DataContext dataContext)
        {
            _dataContext = dataContext;
        }

        #region Hotel
        private IHotelRepo _hotelRepo;
        public IHotelRepo HotelRepo
        {
            get
            {
                if (_hotelRepo == null)
                    _hotelRepo = new HotelRepo(_dataContext);
                return _hotelRepo;
            }
        }
        #endregion

        #region Room
        private IRoomRepo _roomRepo;
        public IRoomRepo RoomRepo
        {
            get
            {
                if (_roomRepo == null)
                    _roomRepo = new RoomRepo(_dataContext);
                return _roomRepo;
            }
        }
        #endregion

        #region Review
        private IReviewRepo _reviewRepo;
        public IReviewRepo ReviewRepo
        {
            get
            {
                if (_reviewRepo == null)
                    _reviewRepo = new ReviewRepo(_dataContext);
                return _reviewRepo;
            }
        }
        #endregion

        #region Voucher
        private IVoucherRepo _voucherRepo;
        public IVoucherRepo VoucherRepo
        {
            get
            {
                if (_voucherRepo == null)
                    _voucherRepo = new VoucherRepo(_dataContext);
                return _voucherRepo;
            }
        }
        #endregion

        #region Voucher
        private IOrderRepo _orderRepo;
        public IOrderRepo OrderRepo
        {
            get
            {
                if (_orderRepo == null)
                    _orderRepo = new OrderRepo(_dataContext);
                return _orderRepo;
            }
        }
        #endregion

        #region Account
        private IAccountRepo _accountRepo;
        public IAccountRepo AccountRepo
        {
            get
            {
                if (_accountRepo == null)
                    _accountRepo = new AccountRepo(_dataContext);
                return _accountRepo;
            }
        }
        #endregion

        #region Booking
        private IBookingRepo _bookingRepo;
        public IBookingRepo BookingRepo
        {
            get
            {
                if (_bookingRepo == null)
                    _bookingRepo = new BookingRepo(_dataContext);
                return _bookingRepo;
            }
        }
        #endregion

        public async Task<bool> SaveChangesAsync()
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var result = await _dataContext.SaveChangesAsync();
                    scope.Complete();
                    return result > 0;
                }
                catch (Exception)
                {
                    scope.Dispose();
                    return false;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns>Error list</returns>
        public List<string> SaveChanges()
        {
            var errors = new List<string>();
            try
            {
                _dataContext.SaveChanges();
                return errors;
            }
            catch(Exception ex)
            {
                var currentEx = ex;
                do
                {
                    errors.Add(currentEx.Message);
                    if (currentEx.InnerException == null)
                        break;
                    currentEx = currentEx.InnerException;
                } while (true);
                return errors;
            }
        }
    }
}
