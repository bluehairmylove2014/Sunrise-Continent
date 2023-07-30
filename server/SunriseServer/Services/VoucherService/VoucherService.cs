using SunriseServerCore.Dtos;
using SunriseServerCore.Models;

namespace SunriseServer.Services.VoucherService
{
    public class VoucherService : IVoucherService
    {
        private readonly UnitOfWork _unitOfWork;

        public VoucherService(UnitOfWork uof)
        {
            _unitOfWork = uof;
        }

        public async Task<IEnumerable<Voucher>> GetAllVoucher()
        {
            var result = await _unitOfWork.VoucherRepo.GetAllAsync();
            return result;
        }

        public async Task<Voucher> GetVoucherById(int VoucherId)
        {
            var result = await _unitOfWork.VoucherRepo.GetByIdAsync(VoucherId);
            return result;
        }

        public async Task<IEnumerable<Voucher>> GetAccountVoucher(int AccountId)
        {
            var result = await _unitOfWork.VoucherRepo.GetAccountVoucherAsync(AccountId);
            return result;
        }
    }
}
