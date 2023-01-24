Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C656667A3A1
	for <lists+freedreno@lfdr.de>; Tue, 24 Jan 2023 21:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8719710E23F;
	Tue, 24 Jan 2023 20:11:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E076710E235
 for <freedreno@lists.freedesktop.org>; Tue, 24 Jan 2023 20:11:19 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kt14so42176218ejc.3
 for <freedreno@lists.freedesktop.org>; Tue, 24 Jan 2023 12:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iow9EqGZ/sIQF1py0gJwtFHKSu4rtBSm3bpjW37i26E=;
 b=fQRkNSmlMehk/emD6QnW2pvAG5FGDHZXy4xOCApamOIanGgpB3nC7UIFnYgLnkeWPY
 qFvvX2ELSvjHIThfhe6O0WklKW+6yMo1UV+SQss5uyQdgK9AY66DoypNuczqfpj771gZ
 zMwx5vq0FvuT14I1a6O79icAmUqKbrwYXXY0MnbFzFPloDOBe97xa0lFAEGrjg+cz2nm
 FxS9PuE5x62U+g5pOA8AuX8OluPqGzApi+Jl/0ws11BUV4b6bZoyNgVYmJs3uF4psTFd
 dS1QgOtiOIpMNqNVECKqF/Ai+PFV+i5x/BPKxb7Yssv3fde8IYdl8X1KC9ZMrbcs8C13
 fqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iow9EqGZ/sIQF1py0gJwtFHKSu4rtBSm3bpjW37i26E=;
 b=SDozr9Soz6sTu68KVQNivmfRX8u3Lp9l8sUGArsAjclfYKxovCHMotOI7nQH8uZUsm
 hWL2NixaeErnZ3mORUc2m2689ra9xdVoZnwvRQZcPD5TkLVadcD9Tw+Ki1iKKeD6PqHj
 cTn/b1B1iVC+Lqo36ZxEDPHYHP9e2ivTmWf8RPpvgRBqqKL0acx6cVowQQoP/7HijTji
 hi602w+vtqexdgDDu0PZ8Kr+ymXTN07Lk7frXgvhHoLkIbKxnGXPiu8sP0dsTE6M05pJ
 kdvvsxtvruyqRXNq/voQIDam8dJEmG900ebei3XWS/IHtfuJ38LZjxiWyQ25gRWeEPWc
 3TCg==
X-Gm-Message-State: AFqh2krHQzZt8znHhOFaS1yiUvctC6dy3lqa2SE3AJn0AqWKB4mlKxpL
 7mbaAkRLCSdZ32p7VIJSBI+UxQ==
X-Google-Smtp-Source: AMrXdXuHqRDems58BY2B4qPn6sOGaXy9V+jFkm9PyKHVlNPrE3x7/DxuNks/kgTigTPvNNtwCEOnNQ==
X-Received: by 2002:a17:906:3397:b0:86b:e50c:151b with SMTP id
 v23-20020a170906339700b0086be50c151bmr29082696eja.28.1674591078266; 
 Tue, 24 Jan 2023 12:11:18 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ks27-20020a170906f85b00b0085fc3dec567sm1346013ejb.175.2023.01.24.12.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 12:11:17 -0800 (PST)
Message-ID: <55cb7813-b407-a593-f822-07b1bc1af89d@linaro.org>
Date: Tue, 24 Jan 2023 22:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230112001600.12791-1-quic_abhinavk@quicinc.com>
 <20230112001600.12791-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112001600.12791-2-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 2/2] drm/msm/dsi: implement opp table
 based check for dsi_mgr_bridge_mode_valid()
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/01/2023 02:16, Abhinav Kumar wrote:
> Currently there is no protection against a user trying to set
> an unsupported mode on DSI. Implement a check based on the opp
> table whether the byte clock for the mode can be supported by
> validating whether an opp table entry exists.
> 
> For devices which have not added opp table support yet, skip
> this check otherwise it will break bootup on those devices.
> 
> changes in v3:
> 	- make the comment shorter
> 	- handle all errors except ENODEV
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I finally acquired the db410c again. And... this patch breaks support 
for the board. We were wrong on the assumption that the code will return 
-ENODEV when there is no opp table, my bad. devm_pm_opp_set_clkname(), 
called from msm_dsi_host_init(), allocates an empty table if one doesn't 
exist in DT.

> ---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 3a1417397283..b20fddb534a7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -450,6 +450,25 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>   	int id = dsi_mgr_bridge_get_id(bridge);
>   	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>   	struct mipi_dsi_host *host = msm_dsi->host;
> +	struct platform_device *pdev = msm_dsi->pdev;
> +	struct dev_pm_opp *opp;
> +	unsigned long byte_clk_rate;
> +
> +	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
> +
> +	/*
> +	 * fail all errors except -ENODEV as that could mean that opp
> +	 * table is not yet implemented
> +	 */
> +	opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
> +	if (IS_ERR(opp)) {
> +		if (PTR_ERR(opp) == -ERANGE)
> +			return MODE_CLOCK_RANGE;
> +		else if (PTR_ERR(opp) != -ENODEV)
> +			return MODE_ERROR;
> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
>   
>   	return msm_dsi_host_check_dsc(host, mode);
>   }

-- 
With best wishes
Dmitry

