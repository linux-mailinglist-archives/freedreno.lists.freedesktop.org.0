Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850C694E2F
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 18:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C0010E647;
	Mon, 13 Feb 2023 17:37:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B10C10E209
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 17:37:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a2so13074759wrd.6
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Lm+nS8Gg8zNsJOeniVA8BF4O8dai6Uu2xhyHNn6AZp4=;
 b=qGq1QCag4qvKIbeV2URGx845jQQNrAsNE7/t8mft4MhTsu9ZbU8ugiTi5lUMDxNYxP
 BqHoGYc633QgSywg7CrslRA1oU0yvhytYL9fsjY0PVSOp6OEnBJSVjQ6HUWlMgrr0g/X
 ygQutKQae7oNQvhWUEyagVI5sBp50cFL+mRMV2PB8wbmpQZMXIHoOChE98bKR7cffw4X
 QK4QcX1V10sJSLy8Fg8OEFiS2gehrh+/kwr3KRzZEYadELRrBYIJcKnHwGh3YTSLy9nW
 6MmE8Ep7dznhB7yLGXWFXmGle6TBeJJ4kD7dZ/NYeU4Oilkq8f0usbyvsqnX1SR06K3L
 azxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lm+nS8Gg8zNsJOeniVA8BF4O8dai6Uu2xhyHNn6AZp4=;
 b=FoKAXFdnMRcfRTScSGGyODzO2qOWIeh2ybcrtym83b+ZShgvnqBDMDRx7QLO64q0m5
 7cXaASSWBwBn8GVj+vSTL6SB+aKg2UH/OXMzQ1hDpFMMaWSMYVmFhZALOgCN2h/oZlJh
 pUbsJrOUA56QMBzK1xVuYg+YcH+MLS8WS3o7BqL24G3gEz9FvRp/4uILel0eHMf6u7Jn
 rAYZsTQQV3bUTx/QqSLe8CPF5bzUopsUVk7T/JvJ2KJ+n6vZZqKfBMB9N5Q35FjlDLng
 EvkUJCcQMdULMMA2lg9G9lmvK56RYjbDHtjuasFhwOzycS/PGAWDeptuEQfj9WtIk6fu
 G7qg==
X-Gm-Message-State: AO0yUKULgTIxSQZeSLw61ffZuMLNUXaTUG/U+j6z+XpLiqZg8VEVmvk8
 gV9OMF6AQwxAmAbySmRWkoUePQ==
X-Google-Smtp-Source: AK7set+wfm9Wu6RZwRDIjW5aqZ6Def93fJ8BzWh4HA3WKGaWSH+d4r3QTVYCqzv0sYj4mVyUnNjGNA==
X-Received: by 2002:a5d:4690:0:b0:2c5:4659:3e76 with SMTP id
 u16-20020a5d4690000000b002c546593e76mr8641780wrq.18.1676309871115; 
 Mon, 13 Feb 2023 09:37:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:915c:811a:b081:f099?
 ([2a01:e0a:982:cbb0:915c:811a:b081:f099])
 by smtp.gmail.com with ESMTPSA id
 i14-20020adff30e000000b00241fab5a296sm11084142wro.40.2023.02.13.09.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:37:50 -0800 (PST)
Message-ID: <fd8985d1-4eb6-3d69-230a-485aa8bc66dc@linaro.org>
Date: Mon, 13 Feb 2023 18:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 03/50] drm/msm/dpu: fix typo in in
 sm8550's dma_sblk_5
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
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/02/2023 00:12, Dmitry Baryshkov wrote:
> Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index eea026cf3ac2..e8b12788dc94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1309,7 +1309,7 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>   				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
> -static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
> +static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   
>   static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> @@ -1331,7 +1331,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
>   		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>   	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
> -		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
>   static const struct dpu_sspp_cfg sc7280_sspp[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
