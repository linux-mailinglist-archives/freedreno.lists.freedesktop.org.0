Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800DE8C68FF
	for <lists+freedreno@lfdr.de>; Wed, 15 May 2024 16:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5160F10EA34;
	Wed, 15 May 2024 14:48:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFAA10E20E
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2024 14:48:05 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D970D1FD0A;
 Wed, 15 May 2024 16:48:01 +0200 (CEST)
Date: Wed, 15 May 2024 16:48:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Luca Weiss <luca.weiss@fairphone.com>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998: enable adreno_smmu by
 default
Message-ID: <pbwsu3w6nl2eyrpbyquo2xmlt2xeniloyhcoegsdoaxs5ezhcn@552egeqfqcz7>
References: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
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

On 2024-05-15 16:27:44, Marc Gonzalez wrote:
> 15 qcom platform DTSI files define an adreno_smmu node.
> msm8998 is the only one with adreno_smmu disabled by default.
> 
> There's no reason why this SMMU should be disabled by default,
> it doesn't need any further configuration.
> 
> Bring msm8998 in line with the 14 other platforms.
> 
> This fixes GPU init failing with ENODEV:

Nit: I'd specialize this to:

"This saves every MSM8998 board DTS from having to enable adreno_smmu when
enabling the Adreno GPU node, which leads to the following unclear probe failure
when forgotten about:"

But no need to send a v3 for that.

> msm_dpu c901000.display-controller: failed to load adreno gpu
> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19

And as a more general discussion, which is not really relevant to have your
commit message, we could have a separate patch adding an error message detailing
**where** this -19 came from.  In this case create_address_space().

> Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> New in v2: rewrote commit message with input from Martin, Bryan, Luca

Thanks!

> Supersedes: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
> 
> Maintainers, feel free to drop the Fixes tag.

For context, I don't think the original patch was necessarily wrong in disabling
this node, as any node using it (adreno_gpu) is also disabled by default.  It is
however less consistent with other DTSI, which don't require every board DTS to
re-enable adreno_smmu.

- Marijn

> Failure log:
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
