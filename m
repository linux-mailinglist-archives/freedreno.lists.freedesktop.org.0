Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE668C5D83
	for <lists+freedreno@lfdr.de>; Wed, 15 May 2024 00:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA78C10E4D2;
	Tue, 14 May 2024 22:13:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8868A10E4D2
 for <freedreno@lists.freedesktop.org>; Tue, 14 May 2024 22:13:55 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DCAC5206DE;
 Wed, 15 May 2024 00:13:51 +0200 (CEST)
Date: Wed, 15 May 2024 00:13:50 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: enable adreno_smmu
Message-ID: <bm6joejl755ynmiqdfhm3godxhfwzb7vvlb5l2vou5p2wkkfgv@4mapycyt3zzb>
References: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

How about appending "by default" to the title?

On 2024-05-14 19:04:04, Marc Gonzalez wrote:
> Right now, GPU init fails:
> 
> [    2.756363] [drm:adreno_bind] Found GPU: 5.4.0.1
> [    2.767183] [drm:a5xx_gpu_init]
> [    2.767422] [drm:adreno_gpu_init] fast_rate=710000097, slow_rate=27000000
> [    3.003869] [drm:msm_gpu_init] ebi1_clk: fffffffffffffffe
> [    3.004002] adreno 5000000.gpu: supply vdd not found, using dummy regulator
> [    3.008463] [drm:msm_gpu_init] gpu_reg: ffff0000819e4000
> [    3.015105] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
> [    3.020702] [drm:msm_gpu_init] gpu_cx: ffff0000819e4180
> [    3.028173] [drm:adreno_iommu_create_address_space]
> [    3.054552] [drm:msm_gpu_init] gpu->aspace=ffffffffffffffed
> [    3.058112] [drm:a5xx_destroy] 5.4.0.1
> [    3.065922] [drm:msm_gpu_cleanup] 5.4.0.1
> [    3.074237] msm_dpu c901000.display-controller: failed to load adreno gpu
> [    3.082412] msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
> [    3.088342] msm_dpu c901000.display-controller: [drm:drm_managed_release] drmres release begin
> ...
> [    3.197694] [drm:drm_managed_release] drmres release end
> [    3.204009] msm_dpu c901000.display-controller: adev bind failed: -19

This whole log is a tad spammy, do maintainers think that's worth having in the
commit or should it be moved below the cut (---), in favour of a more clear and
elaborate patch justification?
(Seems some logs are custom local changes, how about that?)

> 
> adreno_smmu is required, so it must be enabled.

Required for what?  This is not providing much if any context whatsoever, nor
justifying the change.  Adreno is disabled by default, so it's fine to have the
corresponding Adreno SMMU disabled by default too.

Instead, why not copy-paste the justification that was helpfully provided to
you in IRC?  At least three reasons popped up that could be used to fill up the
patch description:
- No other SoC disables adreno_smmu in DTSI;
- Nodes are typically only disabled if enabling them requires additional **board
  specific** configuration (regulators, firmware paths, ...);
- Nodes are typically also disabled if they are optional and not used on every board
  (wled and vibrator PMIC nodes were brought up).

> 
> [    3.220381] msm_dpu c901000.display-controller: bound 5000000.gpu (ops a3xx_ops)
> [    3.235503] [drm:dpu_kms_hw_init:1053] dpu hardware revision:0x30000000

And this is the expected log when it works?  You should annotate that.

The change itself is good to have.

> Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")

This isn't fixing any buggy behaviour, just lining up the DTSI to be more alike
the other SoCs.  I'd drop this line.

- Marijn

> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 3d3b1f61c0690..edf379c28e1e1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1580,7 +1580,6 @@ adreno_smmu: iommu@5040000 {
>  			 * SoC VDDMX RPM Power Domain in the Adreno driver.
>  			 */
>  			power-domains = <&gpucc GPU_GX_GDSC>;
> -			status = "disabled";
>  		};
>  
>  		gpucc: clock-controller@5065000 {
> -- 
> 2.34.1
> 
