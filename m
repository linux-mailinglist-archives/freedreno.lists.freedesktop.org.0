Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560A3DAEBA
	for <lists+freedreno@lfdr.de>; Fri, 30 Jul 2021 00:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943656EE8B;
	Thu, 29 Jul 2021 22:15:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4E6EE89
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 22:15:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id z2so13813112lft.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jul 2021 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cMLNPPri6qLYLmbcVjGDPuvyqtHljwKPt/Kw2945Q8E=;
 b=gPVrciZQ0H8OrEVgkRGpPXwmnlXGi7IWOCVNplY7URViIvt6MrB0kGudrK2Rk5TNc+
 ZcVQyfxpcAPc3nx1OlPimwZBQanmsrWD3TCAbWJ8wtmeenHGiR60rDWiJbOFqpe9RAGd
 XhUvkfca3FOIF/QVPFCHWWoboKq82Y6QK36tVzauhDzGBIHYR5G3StQ8DKjg3gOmkyn1
 0dYct0XQJQbYA2J0BgabP/EmLcqPIJ2An8UQX/AU/IIblCqcNCFfiBQwbELmzU1kMbey
 480no7OxS/qbxI1QyNSwu85Z6VZ99JWTdQJhnZ4Vg0ITHvnf0dVnWo+TlwyhapRvLmFN
 UhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cMLNPPri6qLYLmbcVjGDPuvyqtHljwKPt/Kw2945Q8E=;
 b=WnFIKRYyaaxB9w3RjEkgg6oPC0ecVgBb4s/DcaMgnc+/Fv5Yn6avg3Xd0wgttPfQYB
 tiLenX1Mzj3g8/uQDeux9tE/BSrqv0MCWT79SHMWPKNgcwtIxYth4ZNaH37LePE/5kke
 qYk8zxLU0WGVhMR5jiWi99wpFe7PmskGMFGYfdE1UgZ3IpApAhUfwXP4TVpcFVD2tK3M
 Ea2kOvQvhiIv8FKrzSRhbYQejkPMSeF0UWLfcnL6kWr8/epRSXf35ftAwx8Q0zI2Gcqm
 fX/ktO2n75aROEGOotIlue7STiBlgUO8Iql/Et6fm5R+jslb8CJyw4GKRuLlAwpehS29
 MM/g==
X-Gm-Message-State: AOAM533bQ3QNRjGtHHmDL4yrbUK+iHBBj6tCPRGCdesb+skn14rffvhJ
 dQ2XhoIsRvsrUb02Ksq4COyMsL8eCTahBA==
X-Google-Smtp-Source: ABdhPJxntgaYB/1tvYMlU6ktcdkPNVEahQjjruAi4HU1XiR/oTZsvA4LvveewHUduXk6h9s+8nKR3g==
X-Received: by 2002:a05:6512:118c:: with SMTP id
 g12mr4806358lfr.143.1627596910850; 
 Thu, 29 Jul 2021 15:15:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j14sm455041lfc.20.2021.07.29.15.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 15:15:10 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-7-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <79e693c8-ff9c-d4a8-d4a8-8a1f075f77c7@linaro.org>
Date: Fri, 30 Jul 2021 01:15:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210715065203.709914-7-vkoul@kernel.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH 06/11] drm/msm/disp/dpu1: Add DSC support in
 hw_ctl
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/07/2021 09:51, Vinod Koul wrote:
> Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> bits so that DSC would work there as well
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 2d4645e01ebf..aeea6add61ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -25,6 +25,8 @@
>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
>   #define   CTL_INTF_ACTIVE               0x0F4
>   #define   CTL_MERGE_3D_FLUSH            0x100
> +#define   CTL_DSC_ACTIVE                0x0E8
> +#define   CTL_DSC_FLUSH                0x104
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> @@ -34,6 +36,7 @@
>   
>   #define DPU_REG_RESET_TIMEOUT_US        2000
>   #define  MERGE_3D_IDX   23
> +#define  DSC_IDX        22
>   #define  INTF_IDX       31
>   #define CTL_INVALID_BIT                 0xffff
>   
> @@ -120,6 +123,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   
>   static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> +	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | BIT(3));

Please pass DSC indices using intf cfg and use them to configure 
register writes.

>   
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
> @@ -128,7 +132,7 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>   				ctx->pending_intf_flush_mask);
>   
> -	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask |  BIT(DSC_IDX));

Only if DSCs are used

>   }
>   
>   static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
> @@ -507,6 +511,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, BIT(0) | BIT(1) | BIT(2) | BIT(3));

And here

>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> 


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
