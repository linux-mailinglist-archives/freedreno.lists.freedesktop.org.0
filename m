Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A0E5B60FD
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 20:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFF610E137;
	Mon, 12 Sep 2022 18:34:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED72210E137
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 18:34:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id a8so16223022lff.13
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WBFC0enl7Kdm3LxkDybDNDvUcyCzmqG0ZR1rnJp8nzs=;
 b=xEr+wqs5d6LvcAz1810yjYdeBJeAzely+lM5quRFvED357xG88HBbvGHfhsd70zxRF
 VzYo3rnnsOnAXbvg/+KrU3BDD6Uj8702ccqO/IWmn7gcY0D1x4yGYaVL3h36lNM7fnNi
 Wj/aM39uba2ujmMKM+yGJNhIBsFAFy0V3uF6G75Cs5QEfRCVpNzyVk3Hl6vUHGFK9z5r
 Ch37h+MMqrkLoGovx4c4LWTzDIz2ZPuZhCJrHcPwkCfigsW9BM5VuYWxuaxjXG+W4NAC
 rTGZWppSDYHR9qxOa1M/hCw9prcnYXaG/TPNR33Sf/sRlazbCaqDQDwn6xBf5n1NItPX
 UmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WBFC0enl7Kdm3LxkDybDNDvUcyCzmqG0ZR1rnJp8nzs=;
 b=ZDZ1eHr+cKr3f27kI8J2gxNe5MXIUv78tZNrRZGi6sH+tGkdJ5RTO2DOMpruRbepsD
 6McUsQXTJY30E134TSxiq57ntZgAnoDRdmeHkrUv7fbFpUO2OR1qY7QIqqPYwKL8Jz6u
 GVMyONa5T7Cy8PT3xDuNusoma31wcJ6E6z1AOo7bdStOA01M8NnU399/512BuUDNEZNv
 ASEMKX+232YE+jqFyex5AI0s2bRFrLJjmz6BWobfopGFcz5BzZPina1nlwf3PcMYOK+s
 dOgvBHqjzueR4+3KSh06iqKnxGUREFKtuMgK95kc8lD8YVcQwdb1Wx2BJ8z3a8tkLfl5
 PG9Q==
X-Gm-Message-State: ACgBeo3kdigEjh6NTG8S+wPa3anC6XMWl4VcjC+OKZ1hEVK+ygT5cWRF
 p7FELUnf6IKSxPWiTKjNaGiMcg==
X-Google-Smtp-Source: AA6agR415pD+2UMDTHMqn8fWv/iakaLYMeVs19lx32S1epWhy4JjbpnN4r6gArVoI9OVNjcLy+gB2Q==
X-Received: by 2002:a05:6512:3b20:b0:498:d7bc:28af with SMTP id
 f32-20020a0565123b2000b00498d7bc28afmr7212017lfv.65.1663007641266; 
 Mon, 12 Sep 2022 11:34:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056512358500b0049482adb3basm1213636lfr.63.2022.09.12.11.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:34:00 -0700 (PDT)
Message-ID: <2656127d-383f-a359-3f34-b2f9053d1f2b@linaro.org>
Date: Mon, 12 Sep 2022 21:34:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1662999830-13916-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 2/3] drm/msm/dp: replace variable err
 with len at dp_aux_link_power_up()
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/09/2022 19:23, Kuogee Hsieh wrote:
> drm_dp_dpcd_readb() will return 1 to indicate one byte had been read
> successfully. This patch replace variable "err" with "len" have more
> correct meaning.
> 
> changes in v5:
> -- split into 3 patches
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36f0af0..9d5381d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -49,21 +49,21 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>   					struct dp_link_info *link)
>   {
>   	u8 value;
> -	int err;
> +	ssize_t len;
>   
>   	if (link->revision < 0x11)
>   		return 0;
>   
> -	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> -	if (err < 0)
> -		return err;
> +	len = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> +	if (len < 0)
> +		return len;
>   
>   	value &= ~DP_SET_POWER_MASK;
>   	value |= DP_SET_POWER_D0;
>   
> -	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -	if (err < 0)
> -		return err;
> +	len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> +	if (len < 0)
> +		return len;
>   
>   	usleep_range(1000, 2000);
>   

-- 
With best wishes
Dmitry

