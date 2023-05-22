Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF770C11C
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 16:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BBA10E33C;
	Mon, 22 May 2023 14:29:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511410E33C
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 14:29:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f60804faf4so4110825e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684765779; x=1687357779;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Iad/inN830RPSlsPxQfnkdWFAqtBzchjxSkSm862bmI=;
 b=ypjva5DFLqvmtX35LQvIjG1dUuFIWS29AKYZG2LRkXJnaZJegKgLIUY90VXfYCerwz
 phNDmlvMhc+G8bWGbwhDSQ/+UpPnoVjCurzhhh+cKIzgPZhoDjPcq1jw+ao6gOe75M5r
 Vk/5Eni21h+VI48Jo+mjEmae7SOMRD+LMfZejn2DtUPrcjjx5kCVAFET2tUiQPMCXXYJ
 0MWdl1wHvVax83RC1QqOVHl9Yl4ev/la1P5NWZg7aWcP4io5l+FZGWbGEYF8MwpVTtnw
 35FjlRi00q3JydodonXWpDwaspX2kFkIcd6EAf7bhHB0g8eRd+dt838NE+zx9WpxYVvI
 0PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684765779; x=1687357779;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iad/inN830RPSlsPxQfnkdWFAqtBzchjxSkSm862bmI=;
 b=PsUdEoHp0i+cYx9s/RMG9jOhZQcJxcEYcXs4DXn9+ufMWL7chZtsiiWk4H1a9+xNBW
 rC84FAY1Qcv+yLeDWdmYFcZWO2bBUsAfGKF/SegTLsMt3mtzzXWHi49Sb+ZIDxSvbh4w
 wKC4RiFsjlXUNCBEp//vgvYN8s9E3sFtyIM9IRiQ5vVyWHh/6Z6OGwe2jyqQFyZD7SCK
 PcmWLDsm5ea6k7M1DPetwiGRTu65LXCJIogBiNn7emC8YP2tWZzX+r6Ai9CtspCgarAN
 FsVvUAQWJ4oEB2/BSX7xtAKPV5bYUTT0GFJUG6yS0wcJ0+uct1eoAjPQ7P+e6XWl+1GH
 AmuQ==
X-Gm-Message-State: AC+VfDykfMlNfVRFRt+1A4FkaQ61QXYpPZyjU3JNt43wI5VmaJfktUas
 iLH4vfPlw4rlHIXbwMUWDVeIIg==
X-Google-Smtp-Source: ACHHUZ7xRACcNOqYQj6vKBv911CqQyG+oqpV+epWPMiB7cFujbTJtJm8wErq4PfgG4JYjGkoolmsRQ==
X-Received: by 2002:a5d:5391:0:b0:306:2b5f:8d0a with SMTP id
 d17-20020a5d5391000000b003062b5f8d0amr7870727wrv.56.1684765778931; 
 Mon, 22 May 2023 07:29:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df?
 ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d484b000000b00307c0afc030sm8006851wrs.4.2023.05.22.07.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:29:38 -0700 (PDT)
Message-ID: <182177d8-08af-234e-f553-b9472f0b4ca9@linaro.org>
Date: Mon, 22 May 2023 16:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-2-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522004227.134501-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/6] drm/msm/dpu: don't set DPU_INTF_TE
 globally
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/05/2023 02:42, Dmitry Baryshkov wrote:
> Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
> INTF_SC7280_MASK) results in this bit (and corrsponding operations)
> being enabled for all interfaces, even the ones which do not have TE
> block. Move this bit setting to INTF_DSI_TE(), so that it is only
> enabled for those INTF blocks which have TE support.
> 
> Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1dee5ba2b312..162141cb5c83 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -101,7 +101,6 @@
>   
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> -	 BIT(DPU_INTF_TE) | \
>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>   	 BIT(DPU_DATA_HCTL_EN))
>   
> @@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	{\
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = _len, \
> -	.features = _features, \
> +	.features = _features | BIT(DPU_INTF_TE), \
>   	.type = _type, \
>   	.controller_id = _ctrl_id, \
>   	.prog_fetch_lines_worst_case = _progfetch, \

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
