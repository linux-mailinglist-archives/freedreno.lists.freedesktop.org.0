Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33F16F531D
	for <lists+freedreno@lfdr.de>; Wed,  3 May 2023 10:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D310E1F5;
	Wed,  3 May 2023 08:26:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C91010E1E1
 for <freedreno@lists.freedesktop.org>; Wed,  3 May 2023 08:26:46 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4efeea05936so5566465e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 May 2023 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683102404; x=1685694404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQnrm2QW4A/lP09UQBsC/buiW1QQXts5oTWTDd0Iapk=;
 b=lDzxex/N/6+1jPEwsRwpTbE7kdGx+/+N/+gXGXx6vSL+UVNr6oeMm21UfdIDBbZZIT
 KqQ365QFrR0ZtxGfp/u51BE3IQ7E7PZJ3VNbtqf0HMqFGnhA2j7r2Upb3xzEEavEcY8C
 qUVTvNDN+DhLtvos/3KCh88DWtiLzmtoeV6MEgKrprb1OJlLCTpqlqxSGhTuB3UamZNE
 l4azF/2/ASmLaEugvQPebmvn8g5HEhkMJaaYNgEceStBUD2suc+xPV1sT4C1+o1ZyIqu
 dFd/mwyT2OqSm3TdCEcyY6gal0OzuIsOvWm1Sd+MwsEG6fYjQgU33UNRIy0rNlnPckBf
 P88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683102404; x=1685694404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQnrm2QW4A/lP09UQBsC/buiW1QQXts5oTWTDd0Iapk=;
 b=YOKOL9EndkVORKGFf0hLtcC10X6RK3pbFfub/Jlv8vPjbgBwnL0npvpbrq1PZ1x1vw
 3+DVHFZt56sBVm4SI0nBMobUzTHhNrA2S6Msn93AB7WpVaX969qSVNXYoFlcUOlVExRp
 oBRfM2dqxplk9xDR80LfhEihOQDJoGC5mneKO9bI6axUCcNs45Y6fCPaatjPV6zfF0ie
 G0xjpNRbweIEjBn7Q/DZ9uJEt/oNuik1462hv5Z9C32KVqe0OvoVBaheyV/WNvq9sxs+
 6IxVYU4cgA5vIBQY9mOA8lyL8+QdDsadRKZIoLpnZ5ChN7JNlT1vP1aynWOTabs4hcO6
 +nlQ==
X-Gm-Message-State: AC+VfDzeM6phlHIkcZI9kPGxfZDy2demwuhFUH862CbDf+rB597qA6RG
 Bh2Vca/CWCO1USf+rgz8IG9HkA==
X-Google-Smtp-Source: ACHHUZ5I/B8/b7dNYVIEYJghFgcOuzDA4b8h+9I+HVutFLfzrBZ8gqF8yFrKzcjAPE9hprtWYeCNUQ==
X-Received: by 2002:ac2:420d:0:b0:4ef:f5fe:bc76 with SMTP id
 y13-20020ac2420d000000b004eff5febc76mr705187lfh.14.1683102404401; 
 Wed, 03 May 2023 01:26:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d14-20020ac2544e000000b004edc2a023ffsm5837150lfn.36.2023.05.03.01.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:26:43 -0700 (PDT)
Message-ID: <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
Date: Wed, 3 May 2023 11:26:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm/dsi: Fix compressed word count
 calculation
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2023 04:19, Jessica Zhang wrote:
> Currently, word count is calculated using slice_count. This is incorrect
> as downstream uses slice per packet, which is different from
> slice_count.
> 
> Slice count represents the number of soft slices per interface, and its
> value will not always match that of slice per packet. For example, it is
> possible to have cases where there are multiple soft slices per interface
> but the panel specifies only one slice per packet.
> 
> Thus, use the default value of one slice per packet and remove slice_count
> from the word count calculation.
> 
> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 35c69dbe5f6f..b0d448ffb078 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		if (!msm_host->dsc)
>   			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>   		else
> -			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
> +			/*
> +			 * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
> +			 * Currently, the driver only supports default value of slice_per_packet = 1
> +			 *
> +			 * TODO: Expand drm_panel struct to hold slice_per_packet info
> +			 *       and adjust DSC math to account for slice_per_packet.

slice_per_packet is not a part of the standard DSC, so I'm not sure how 
that can be implemented. And definitely we should not care about the 
drm_panel here. It should be either a part of drm_dsc_config, or 
mipi_dsi_device.

> +			 */
> +			wc = msm_host->dsc->slice_chunk_size + 1;
>   
>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>   			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> 

-- 
With best wishes
Dmitry

