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

        public async Task<List<VoucherBag>> GetAccountVoucher(string email)
        {
            var result = await _unitOfWork.VoucherRepo.GetAccountVoucherAsync(email);
            return result;
        }

        public async Task<int> CreateVoucher(AddVoucherDto voucher)
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

        public async Task<int> UpdateAccountRank(string email)
        {
            var result = await _unitOfWork.VoucherRepo.UpdateAccountRankAsync(email);
            return result;
        }

        public async Task<int> RedeemVoucher(string email, int voucherId)
        {
            var result = await _unitOfWork.VoucherRepo.RedeemVoucherAsync(email, voucherId);
            return result;
        }
    }
}
