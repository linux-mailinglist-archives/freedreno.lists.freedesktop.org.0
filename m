Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733415389AE
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 03:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD44C10F777;
	Tue, 31 May 2022 01:42:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Tue, 31 May 2022 01:42:08 UTC
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC52F10F736
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 01:42:08 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 31 May
 2022 09:34:09 +0800
Received: from [172.16.137.70] (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 May
 2022 09:34:07 +0800
Message-ID: <7dd43198-2873-8767-2b17-de0b858a0ff1@meizu.com>
Date: Tue, 31 May 2022 09:34:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
References: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
From: baihaowen <baihaowen@meizu.com>
In-Reply-To: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix pointer dereferenced
 before checking
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

在 2022/5/30 下午3:33, Haowen Bai 写道:
> The ctx->hw is dereferencing before null checking, so move
> it after checking.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index bcccce292937..e59680cdd0ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -155,11 +155,13 @@ static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg *wb)
>  static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>  		struct dpu_hw_wb_qos_cfg *cfg)
>  {
> -	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	struct dpu_hw_blk_reg_map *c;
>  	u32 qos_ctrl = 0;
>  
>  	if (!ctx || !cfg)
>  		return;
> +	
> +	c = &ctx->hw;
>  
>  	DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
>  	DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
Sorry, plz ignore this patch.

ctx->hw is dereferenced, &ctx->hw is just a pointer math for pointer address offset, so it would not cause a bug(dereferencing null pointer).

 

-- 
Haowen Bai

