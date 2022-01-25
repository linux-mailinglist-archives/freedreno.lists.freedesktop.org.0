Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3349A286
	for <lists+freedreno@lfdr.de>; Tue, 25 Jan 2022 03:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F009C10E8AA;
	Tue, 25 Jan 2022 02:00:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0564D10E8DC
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jan 2022 02:00:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y15so45518550lfa.9
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 18:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z9cFZ1E2s24LcCxX+TonvupwH3rhf/yXaLQUkB9G9lg=;
 b=e6YoBi5Li5l3ffqcYqv7m1pmWSKUtt1XgNdBzvlqTUzMdC5cVbwWAQ/yrma7sE63Bg
 7d+GNgWbQCJ8laMN+M+a6IJLgkT1VnAkApTSaQKqLFr+3NzTS1GUTCrKQ4EaLJBDc7GW
 DBwVNT6T+2mOd9Gq8TnUkWVWF9kRBzVFktg2ReG/qrOMXl2nkDo11KqKff0fLWCuuF7F
 xSIGdrywlb5w5o6eUm3jMlRzG1KFGz0g9DvzOukLPZjC0qGdadsGnJnGSgnjGI8dB61f
 PWyfvAv/RBvOb4EKD+xTCzKaVZHieZ8bdvgMPepihXo9zfBD4z1cLCwYwCIFqMLhgfLT
 1PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z9cFZ1E2s24LcCxX+TonvupwH3rhf/yXaLQUkB9G9lg=;
 b=UWww2LlNof0rIMRkD1SiRaFBUgb5VlHbLuXsc17mbROx6D6NeYZ7GJtOJ6oCJCYpX5
 ppCcoJ7ZVP9zwqQoL0BjdByhI/yegf0mofdJhpBltagxfChZJDcHOMg6FvplT2hjsn6i
 JHJt1BR0CeZ+dM0hADkbYDqRw3iR7tq9dD5a2HWufzOO3yFWJENoFWpuK01u3738z6Mc
 DxjJxUEGPDEhOim8bzQ4kOJWScdBAS/E9xWmQctAN/ucQhv5gwYCzLvHupA2x8hmXG4e
 evXvCoYMB5aUyvNEY7wSQzcnekqJTkzep4zz3Fq2P/EkpI3rCFFirKtP3cEmNubG3Wcd
 4E/Q==
X-Gm-Message-State: AOAM533wrDPNupZbg+L0T3X5K/YKCsE+FCDbFQB2FopImY152yuoYFVz
 dWvanpLdrHVaGxxZAyoN2a+ZUw==
X-Google-Smtp-Source: ABdhPJzR7Nty4CWBcIaaTsrQRiQiwDCL0FqPuoLJsr1Uu+KP4cnVI3Y3KVI80EIbpDT5tyLNEnKLQw==
X-Received: by 2002:a05:6512:114f:: with SMTP id
 m15mr4955248lfg.678.1643076019122; 
 Mon, 24 Jan 2022 18:00:19 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 8sm22197lfq.200.2022.01.24.18.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 18:00:18 -0800 (PST)
Message-ID: <d60f663a-c986-4076-736b-05d50e4aefc0@linaro.org>
Date: Tue, 25 Jan 2022 05:00:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 hali@codeaurora.org
References: <20220116181844.7400-1-jose.exposito89@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220116181844.7400-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: invalid parameter check in
 msm_dsi_phy_enable
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
Cc: freedreno@lists.freedesktop.org, rajeevny@codeaurora.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/01/2022 21:18, José Expósito wrote:
> The function performs a check on the "phy" input parameter, however, it
> is used before the check.
> 
> Initialize the "dev" variable after the sanity check to avoid a possible
> NULL pointer dereference.
> 
> Fixes: 5c8290284402b ("drm/msm/dsi: Split PHY drivers to separate files")
> Addresses-Coverity-ID: 1493860 ("Null pointer dereference")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 9842e04b5858..baa6af0c3bcc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -808,12 +808,14 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>   			struct msm_dsi_phy_clk_request *clk_req,
>   			struct msm_dsi_phy_shared_timings *shared_timings)
>   {
> -	struct device *dev = &phy->pdev->dev;
> +	struct device *dev;
>   	int ret;
>   
>   	if (!phy || !phy->cfg->ops.enable)
>   		return -EINVAL;
>   
> +	dev = &phy->pdev->dev;
> +
>   	ret = dsi_phy_enable_resource(phy);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",


-- 
With best wishes
Dmitry
