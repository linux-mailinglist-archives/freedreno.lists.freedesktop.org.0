Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88EE73A865
	for <lists+freedreno@lfdr.de>; Thu, 22 Jun 2023 20:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E2F10E5A8;
	Thu, 22 Jun 2023 18:42:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74FF10E5A0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 18:42:29 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b47a15ca10so74701031fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 11:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687459347; x=1690051347;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sjj3Boe/HdR5zbtRo/fyylNooQOkgRfrOTZ9rBEe6Bw=;
 b=Omoq/Psf65h/J0Xnd36qTxSaAMzihoVX/9b2fJWYcum0UPoYymXDz9mk2wwEn3JoeH
 npYR9qKvLoLqWY+v04GFXG6qQpqSSqsXjaNNn30xs72VpDbWu7zfPgmDXz5IQ3PK43Hj
 uJp2yFqObG1CTXIMjfBAERVKUiv7s0BA65tuRw0YHtwAPaFYEp8TXUyUNWnaXVMNKHzH
 GehQdO/5+9qOCBbHQVn3r/l8WmH5mA3OfbRL84GMJYZBkAsHW058IO+TZiZwIjC0tak0
 IKA/ioe6NICNoL9aFuVYJeCoreNHdQkopgWShydzeuGxOqXf6EloNkLRTi8tI2pIPzz4
 U78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459347; x=1690051347;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sjj3Boe/HdR5zbtRo/fyylNooQOkgRfrOTZ9rBEe6Bw=;
 b=HL7O3SJZQN3eaics0PSE1C/1E0/x41rtDu6VxHHqhHspfXQr605QijNIPBvE5iAi4F
 zs7A/TmgM/IVNUav9kkPO0xvuD8DyiATNOlORdOoisLRUeuUZQ1vRE4ywuBMau6appLJ
 gtdVI18iiXisi3zSCSUZvfWoF2rc+kRxkYMYIIZ7jw2DsPh3eOSUslr4SK/oBiQ/2Pus
 1jzzD1rEBkpDQLOq/g+vaBIEA0OMsApneHuQcDH3tZCcyTUw/9wH7HW1/NIg+feNlfCw
 gA7ZPsYN+DAhlZTd5N9wvySTAMeILBo2b7DtHJsn02jVt1MvQ8IP0vC7ul4ohuqyxfGG
 u2kQ==
X-Gm-Message-State: AC+VfDzB6TtRBf1BR7bOs9oCzSr/lnwkHEEXoiOb3FdOsEWISaePavw4
 il4oDEoeLG3vuuMN84qRzV5jPw==
X-Google-Smtp-Source: ACHHUZ45fBGVA7hhjEz9ruDoM5N1Xdmlgj5bRXIJecI+q+YtDZCQzJGfn3VzZPrqrZJ/dHgobkjzTg==
X-Received: by 2002:a2e:9f56:0:b0:2b4:45bd:fd7 with SMTP id
 v22-20020a2e9f56000000b002b445bd0fd7mr11840621ljk.50.1687459347539; 
 Thu, 22 Jun 2023 11:42:27 -0700 (PDT)
Received: from [10.2.145.31] ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a2e9851000000b002b331e241edsm1427299ljj.133.2023.06.22.11.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 11:42:26 -0700 (PDT)
Message-ID: <8f69cb15-6c70-031c-7632-15daddaddce2@linaro.org>
Date: Thu, 22 Jun 2023 21:42:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
 <20230620-topic-dsiphy_rpm-v2-2-a11a751f34f0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-2-a11a751f34f0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dsi: Enable runtime PM
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/06/2023 14:43, Konrad Dybcio wrote:
> Some devices power the DSI PHY/PLL through a power rail that we model
> as a GENPD. Enable runtime PM to make it suspendable.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

So, we were calling pm_runtime_get/put, but we didn't have runtime PM 
enabled for this device? It might be a nice place for dev_warn() in the 
driver core.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 2f319e0eb74f..22431e106529 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -689,6 +689,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
>   				     "Unable to get ahb clk\n");
>   
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
>   	/* PLL init will call into clk_register which requires
>   	 * register access, so we need to enable power and ahb clock.
>   	 */
> 

-- 
With best wishes
Dmitry

