Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7E613D9F
	for <lists+freedreno@lfdr.de>; Mon, 31 Oct 2022 19:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6A410E0F9;
	Mon, 31 Oct 2022 18:46:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FDA10E105
 for <freedreno@lists.freedesktop.org>; Mon, 31 Oct 2022 18:46:19 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a15so17829030ljb.7
 for <freedreno@lists.freedesktop.org>; Mon, 31 Oct 2022 11:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S11pSJe+3m2UZvWKILOfbSaBNiczaTBDXuv2aL1IhrU=;
 b=Hv7Gt7yt1ZrenkBrV/xTf8N345bQcji16EmWnFa8k+bSW6LnFpsJAZsZlm+NEpNEBx
 SZ9lY9tZ5dR9KGxRJ3Ya9Gl+D7Rr3GkTDpjk7DLX0Vng9fIhKgCmvjclE5HjnwMTQlgp
 +V1ZXsBjO2bueOR08NYmrsm4Wi6uAkx38Us6M8dss4j+yXsNe0XGqhxUNpBELMT2LeO3
 QfaIAXINetaOQiOlHX/Oqt6yCEir/6w1zgZghKvkMO3jb3/aeqvOcfzSNJYvKVbew5Ax
 iEF98VaLdwSvJUW5SWx6AW8Nk7Vr4w9+fWiQMpyQTZN32CCfOssqygyfo7xxuDt0khvg
 1fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S11pSJe+3m2UZvWKILOfbSaBNiczaTBDXuv2aL1IhrU=;
 b=BA2UUpbdqwabxKA2VK4EdOyVme57ldQmxnCIfx2slDtgTguZZLEkWpGc/f/9hOAVeo
 51XjS98nrDxbY29iPg7q8P+JDoVhaMNingL0d0aR+6K0Imk6z0xnlnT+a72E1TTuMOLg
 7/kWsCxkm7Ej35U/x1CEYwnRypo9VlwY/TLl/s5KZh2/nqojT1S0cV4yHu5yMoyu6Rpl
 reb5ULZi3qHRL0/DPA+hMclxO0kRHLqIt4ACuWG2gn43hsM9jV8GzT+UEKrAIEHW4pjL
 ERyiaEZf8SgURG5+dsbPkPpsWzoxd/EIoIy8GUISvm3XYIax7Eq6CWNjMYnI+kM+VLj5
 XZNA==
X-Gm-Message-State: ACrzQf2uafGOuAAKZ9oaTDM2/96izym+DvojUGU8KkDTvgJuS7QfBS2D
 J7TDpz68awXU4MdDezaZcXyfLQ==
X-Google-Smtp-Source: AMsMyM6BASxniPfNeXTgSwyK8JDlvyz9PL/6j9II+ZUjwQkNjuL0WuoM6HN06stv0Fz/4hUFu7NW/g==
X-Received: by 2002:a05:651c:1073:b0:277:35ca:5eef with SMTP id
 y19-20020a05651c107300b0027735ca5eefmr5940508ljm.150.1667241977777; 
 Mon, 31 Oct 2022 11:46:17 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a2ea4ca000000b0026daf4fc0f7sm1457506ljm.92.2022.10.31.11.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 11:46:17 -0700 (PDT)
Message-ID: <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
Date: Mon, 31 Oct 2022 21:46:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove limitation of link rate
 at 5.4G to support HBR3
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/10/2022 20:27, Kuogee Hsieh wrote:
> An HBR3-capable device shall also support TPS4. Since TPS4 feature
> had been implemented already, it is not necessary to limit link
> rate at HBR2 (5.4G). This patch remove this limitation to support
> HBR3 (8.1G) link rate.

The DP driver supports several platforms including sdm845 and can 
support, if I'm not mistaken, platforms up to msm8998/sdm630/660. Could 
you please confirm that all these SoCs have support for HBR3?

With that fact being confirmed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 5149ceb..3344f5a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (link_info->num_lanes > dp_panel->max_dp_lanes)
>   		link_info->num_lanes = dp_panel->max_dp_lanes;
>   
> -	/* Limit support upto HBR2 until HBR3 support is added */
> -	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> -		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> -
>   	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>   	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>   	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);

-- 
With best wishes
Dmitry

