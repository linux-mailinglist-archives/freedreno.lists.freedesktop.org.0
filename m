Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2D5B5F9C
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 19:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8162B10E07A;
	Mon, 12 Sep 2022 17:52:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4510E0C6
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 17:52:48 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id q21so16202763lfo.0
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=XI0KQ8q7PFkFGP0DABWmIIcFsiDPrqSNCN4sbyFUatc=;
 b=zfaxxC5hscfj2i6FJ63hXlCZ02ftU84yLDoSWWK3pMIfqcAOk0lfJ8g9V9MQ57cc7S
 LXhqgILB3CTzBl6YbJaGZBhQeLi5CupsiCKLmsTZXJMNHkIVz+tE65jLGZjhxr3UzhEr
 LJ12NAzoLkt+3OKVwzPYos7aPoY9tCl31cGYy/V19u0/onROlQwINcPQQMHq1Otg9Jqy
 iGvuG0p+QNbs0qpXSJ0kFbWVNJ6Me5XFsxTPakWVFntoyXESNNCYBqGwuddC4grJoBgx
 6JP9y6CqhmdoubaNUVL70rb9wVzVfpI0gvLECNIR1KYNr1iZNz8HK9QDrFh6Fkbv2WWz
 8hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=XI0KQ8q7PFkFGP0DABWmIIcFsiDPrqSNCN4sbyFUatc=;
 b=sQoiXRbpuoCjFKILN+ALakqv2EfLua87QEaGu1dM3ADtEnvnZPYKQxrIVXhuCJ7ZUJ
 MgB+ms5jbduQE1yZEwei78bWqf5v5XhuT72O5NNUeZcC3YhMDPJI8zixdsVP4TRlenx4
 TtjEUHlMzm9Uby7+4pmnChx1TthaE8QC7lCyJ/l4b1mvGNrvK5Y8b7qFMmKyJMcCPO6m
 /Y7yAQd/XCF5uaqYEU23VTNONHpPOKSaO5i3Sx41fC1bsoCjoRKmLjIxE+Qet9l82yTx
 EtVp5abyUzADxKWzPIbYHW3MWKmCrXnSOU99WHNLw4Gjt3PE0VMDANE0pYJUDlWpJMnX
 kGVA==
X-Gm-Message-State: ACgBeo29ZB2d06nI+bNhTGXisvJ07eTmMONbrSj+caciSRPJxefDbrHl
 I/VDo30fFEahKHvTtFFWE25KSg==
X-Google-Smtp-Source: AA6agR58ddpzRviculgzcBsEBBSueupQl4jo1hgZZERI2CZncjlF8Iz+Ts2+bJzkmZw/T9tGQdi85w==
X-Received: by 2002:a05:6512:6d5:b0:494:990f:a820 with SMTP id
 u21-20020a05651206d500b00494990fa820mr9906341lff.536.1663005166350; 
 Mon, 12 Sep 2022 10:52:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2eb4b8000000b0026acd11cd51sm1216736ljm.59.2022.09.12.10.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 10:52:45 -0700 (PDT)
Message-ID: <518564a8-5206-80cc-8306-50296de43abf@linaro.org>
Date: Mon, 12 Sep 2022 20:52:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-2-johan+linaro@kernel.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220912154046.12900-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm: fix use-after-free on probe
 deferral
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/09/2022 18:40, Johan Hovold wrote:
> The bridge counter was never reset when tearing down the DRM device so
> that stale pointers to deallocated structures would be accessed on the
> next tear down (e.g. after a second late bind deferral).
> 
> Given enough bridges and a few probe deferrals this could currently also
> lead to data beyond the bridge array being corrupted.
> 
> Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
> Cc: stable@vger.kernel.org      # 5.19

Fixes: a3376e3ec81c ("drm/msm: convert to drm_bridge")
Cc: stable@vger.kernel.org # 3.12

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 391d86b54ded..d254fe2507ec 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -241,6 +241,7 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	for (i = 0; i < priv->num_bridges; i++)
>   		drm_bridge_remove(priv->bridges[i]);
> +	priv->num_bridges = 0;
>   
>   	pm_runtime_get_sync(dev);
>   	msm_irq_uninstall(ddev);

-- 
With best wishes
Dmitry

