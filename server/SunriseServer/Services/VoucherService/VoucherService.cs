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

        public async Task<List<Voucher>> GetAccountVoucher(int AccountId)
        {
            var result = await _unitOfWork.VoucherRepo.GetAccountVoucherAsync(AccountId);
            return result;
        }

        public async Task<Voucher> CreateVoucher(AddVoucherDto voucher)
        {
            var result = await _unitOfWork.VoucherRepo.CreateAsync(voucher);
            return result;
        }

        public async Task<int> UpdateAccountRank(int accountId)
        {
            var result = await _unitOfWork.VoucherRepo.UpdateAccountRankAsync(accountId);
            return result;
        }
    }
}
