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

        public async Task<List<VoucherBag>> GetAccountVoucher(int AccountId)
        {
            var result = await _unitOfWork.VoucherRepo.GetAccountVoucherAsync(AccountId);
            return result;
        }

        public async Task<Voucher> CreateVoucher(AddVoucherDto voucher)
        {
            var result = await _unitOfWork.VoucherRepo.CreateAsync(voucher);
            return result;
        }

        public async Task<int> UpdateVoucher(Voucher voucher)
        {
            var result = await _unitOfWork.VoucherRepo.UpdateVoucherAsync(voucher);
            return result;
        }

        public async Task<int> DeleteVoucher(int voucherId)
        {
            var result = await _unitOfWork.VoucherRepo.DeleteVoucherAsync(voucherId);
            return result;
        }

        public async Task<int> UpdateAccountRank(int accountId)
        {
            var result = await _unitOfWork.VoucherRepo.UpdateAccountRankAsync(accountId);
            return result;
        }

        public async Task<int> RedeemVoucher(int accountId, int voucherId)
        {
            var result = await _unitOfWork.VoucherRepo.RedeemVoucherAsync(accountId, voucherId);
            return result;
        }
    }
}
