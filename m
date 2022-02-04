Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F74AA25F
	for <lists+freedreno@lfdr.de>; Fri,  4 Feb 2022 22:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E1410E275;
	Fri,  4 Feb 2022 21:35:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF0210E7B3
 for <freedreno@lists.freedesktop.org>; Fri,  4 Feb 2022 21:35:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id j14so10301653lja.3
 for <freedreno@lists.freedesktop.org>; Fri, 04 Feb 2022 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oWjZYPRQ/m7Ib0jZmdVRcCli6CugjAVAZIgA6S+3JN4=;
 b=Vjr1Gle+MW/tK9aKK8kIvtOGlBDQr05bDaNmUJKodcz1GpaXMKlqKSLrC9i9Ej0V/O
 pVwNVAPuhdCJmSLYQ6UB6Eg0zD4n1QA0KR4YR7JdtCKVXO7c4SaTib0q1kAK3dHiYZhU
 nhwfEg9xLEbr89Ggp8mX6LB3ajjUUrNUNeQHosnZ06zzg94CwIEEBl4V7wSUheNntFYn
 D/WmTkuxqFbWmmlWuydVvX075Wqk7CiO1TbHhGv4fY5InK3Q4Yz+Txkhwv9mweIxVw5Y
 Hd/WtDn4O69F7aYswrB35WB9O/r2AuuSPEr494OUU4szJhAxhkqtTpJBAIoqi0ECsFFJ
 2NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oWjZYPRQ/m7Ib0jZmdVRcCli6CugjAVAZIgA6S+3JN4=;
 b=3ibWVrFBasLz8SqYxDIkV5FKG4WiWAtUfP82ocIsfM3Rf3LFebVvq7Zo5PNoKme0du
 Z0aleNHD65YbsLyCDAm7CLkqXDsu9C19n+sHjchm0ZOcJe9hXwOt3TLBxzy51oD70n9O
 UJue5B2Ukt7Igw28EgN6J8sdZlzfY87BAjrWrYzax2+QzybIoUqkj/krZiBY3mBzytU/
 aBlQK1b0tBk3EWzKcUyAKJ/Wuyiphdcx73J3xyHOHeQHsw57Cc/YaPCSLr8mkg93QWOe
 tS78iQ1UFwA8jxoWBMSO3icaAOeKrzuKromykE7XKjqYQgawMiqwpBoRWoYFcZHmaeS+
 eTpg==
X-Gm-Message-State: AOAM5308I3T2Mxo3EQE8PLKn0B0aIrl7NAHYEzUKAlNy7M3GV1PTtOLA
 EXKUScNAzDyhH+ZZonvUtTbwNA==
X-Google-Smtp-Source: ABdhPJxfjoITKG12Gxj2xM21hl5OuYpXZIA2e880TguoMzaCtryBEsUWAZbhIkTIltrUQHry9QEbEQ==
X-Received: by 2002:a2e:b17a:: with SMTP id a26mr549657ljm.172.1644010549503; 
 Fri, 04 Feb 2022 13:35:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o17sm462255lfu.180.2022.02.04.13.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 13:35:48 -0800 (PST)
Message-ID: <859ff316-de11-e1a3-a714-addd7a490eb0@linaro.org>
Date: Sat, 5 Feb 2022 00:35:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1643999801-20359-1-git-send-email-quic_khsieh@quicinc.com>
 <1643999801-20359-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1643999801-20359-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 2/3] drm/msm/dp: revise timing engine
 programming to support compression (DSC)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/02/2022 21:36, Kuogee Hsieh wrote:
> Divides horizontal width by 3 at timing engine of interface. There are
> major part of  compression (DSC) programming have to be done at DSC
> controller which is not covered by this patch.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 22 ++++++++++++++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +++
>   2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 35d4aaa..ee7ca34 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -128,7 +128,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	 * video timing. It is recommended to enable it for all cases, except
>   	 * if compression is enabled in 1 pixel per clock mode
>   	 */
> -	if (p->wide_bus_en)
> +	if (!p->compression_en || p->wide_bus_en)
>   		intf_cfg2 |= BIT(4);

So, what exactly is BIT(4)? Is it WIDE_BUS_ENABLE of some kind? Then why 
do you disable it for compression_en?

Please, add defines for all the respective BIT(n) values.

>   
>   	if (p->wide_bus_en)
> @@ -150,10 +150,16 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	 */
>   	data_width = p->width;
>   
> -	if (!dp_intf && p->wide_bus_en)
> +	if (p->compression_en) {
> +		data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
> +
> +		if (p->wide_bus_en)
> +			data_width >>= 1;
> +	} else if (!dp_intf && p->wide_bus_en) {
>   		data_width = p->width >> 1;
> -	else
> +	} else {
>   		data_width = p->width;
> +	}
>   
>   	hsync_data_start_x = hsync_start_x;
>   	hsync_data_end_x =  hsync_start_x + data_width - 1;
> @@ -178,8 +184,16 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   
>   	active_hctl = (active_h_end << 16) | active_h_start;
>   
> -	if (dp_intf)
> +	if (dp_intf) {
>   		display_hctl = active_hctl;
> +		if (p->compression_en) {
> +			active_data_hctl = (hsync_start_x +
> +					p->extra_dto_cycles) << 16;
> +			active_data_hctl += hsync_start_x;
> +
> +			display_data_hctl = active_data_hctl;
> +		}
> +	}
>   
>   	den_polarity = 0;
>   	if (ctx->cap->type == INTF_HDMI) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index e4a518a..8fc71ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -32,6 +32,9 @@ struct intf_timing_params {
>   	u32 hsync_skew;
>   
>   	bool wide_bus_en;
> +	bool compression_en;
> +	u32 extra_dto_cycles;   /* for DP only */
> +	u32 dce_bytes_per_line;
>   };
>   
>   struct intf_prog_fetch {


-- 
With best wishes
Dmitry
