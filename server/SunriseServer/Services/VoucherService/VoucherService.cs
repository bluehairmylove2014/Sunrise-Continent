using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Voucher;
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

        public async Task<List<VoucherDto>> GetAllVoucher()
        {
            var rawVoucher = await _unitOfWork.VoucherRepo.GetAllVoucherAsync();
            var result = new List<VoucherDto>();

            rawVoucher.ForEach(v => {
                VoucherDto voucher = new() {
                    RequiredRank = v.AccountRank
                };
                SetPropValueByReflection.AddYToX(voucher, v);
                result.Add(voucher);
            });

            return result;
        }

        public async Task<Voucher> GetVoucherById(int VoucherId)
        {
            var result = await _unitOfWork.VoucherRepo.GetByIdAsync(VoucherId);
            return result;
        }

        #nullable enable
        public async Task<List<VoucherDto>> GetAccountVoucher(int accountId, string? rank)
        {
            var rawVoucher = await _unitOfWork.VoucherRepo.GetAccountVoucherAsync(accountId, rank);
            var result = new List<VoucherDto>();

            rawVoucher.ForEach(v => {
                VoucherDto voucher = new() {
                    RequiredRank = v.AccountRank
                };
                SetPropValueByReflection.AddYToX(voucher, v);
                result.Add(voucher);
            });

            return result;
        }
        #nullable disable

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

        public async Task<int> UpdateAccountRank(int accountId)
        {
            var result = await _unitOfWork.VoucherRepo.UpdateAccountRankAsync(accountId);
            return result;
        }

        public async Task<int> RedeemVoucher(int accountId, int voucherId, int number = 1)
        {
            var result = await _unitOfWork.VoucherRepo.RedeemVoucherAsync(accountId, voucherId, number);
            return result;
        }
    }
}
