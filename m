Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E26CF398
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 21:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A979910E1AB;
	Wed, 29 Mar 2023 19:49:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687B410E1AB
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 19:49:10 +0000 (UTC)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl [83.9.3.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DEF463EF48;
 Wed, 29 Mar 2023 21:49:03 +0200 (CEST)
Message-ID: <8ebea3bc-6f1f-e5f9-40a1-827a0b22a1ea@somainline.org>
Date: Wed, 29 Mar 2023 21:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-16-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20230211231259.1308718-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2,
 15/50] drm/msm/dpu: constify DSC data structures
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> DSC hw catalog data is not supposed to be changed, so mark it as const
> data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2d53ed92de85..54d706dfdbec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1829,14 +1829,14 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  	.features = _features, \
>  	}
>  
> -static struct dpu_dsc_cfg sdm845_dsc[] = {
> +static const struct dpu_dsc_cfg sdm845_dsc[] = {
>  	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>  	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>  	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
>  	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
>  };
>  
> -static struct dpu_dsc_cfg sm8150_dsc[] = {
> +static const struct dpu_dsc_cfg sm8150_dsc[] = {
>  	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>  	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>  	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e6590302b3bf..a56581b34ddf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -867,7 +867,7 @@ struct dpu_mdss_cfg {
>  	const struct dpu_merge_3d_cfg *merge_3d;
>  
>  	u32 dsc_count;
> -	struct dpu_dsc_cfg *dsc;
> +	const struct dpu_dsc_cfg *dsc;
>  
>  	u32 intf_count;
>  	const struct dpu_intf_cfg *intf;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926da1441..4e1396575e6a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -175,7 +175,7 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>  	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
>  }
>  
> -static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
> +static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
>  				       const struct dpu_mdss_cfg *m,
>  				       void __iomem *addr,
>  				       struct dpu_hw_blk_reg_map *b)
> @@ -207,7 +207,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
>  				   const struct dpu_mdss_cfg *m)
>  {
>  	struct dpu_hw_dsc *c;
> -	struct dpu_dsc_cfg *cfg;
> +	const struct dpu_dsc_cfg *cfg;
>  
>  	c = kzalloc(sizeof(*c), GFP_KERNEL);
>  	if (!c)
