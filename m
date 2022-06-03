Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A861753C7D1
	for <lists+freedreno@lfdr.de>; Fri,  3 Jun 2022 11:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45719113023;
	Fri,  3 Jun 2022 09:46:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED6C113023
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jun 2022 09:46:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id be31so11756928lfb.10
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jun 2022 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PV8WqoUGxOFZRKshOw3NOc1zZVTzDgewpvw4AU5r3QI=;
 b=BIVLMG0D76swp19/yzM/9m9y5tcb/zqi8QgQHU8OHU+N7zKnrWGzE/UPZ7F1osfRLb
 ZcMjIjpm5ZUVaPoi6qZRqJXCO7uUehgc+tnpxeL7oHTqGz2ap2+FXBln0iiQ9M3Lxeur
 JcoaKi5uTlaA2YptWUqLtQYnfDRww/UVr62SMpaFlfPePlYiFOAL6ozldiOvOyULvbWT
 awYIp4833HuLklWK4EIyVTwr9pnoi5ZhaZx9hIQUdNwpLU0GOLjGRWpq5+KCJnsH59Bg
 2MD/aH+ZV3yRdZv0KFJD8D/ZwXZOV805tYETCqiP0qivXU3rwg9/aos4kDMt+J/+i+k6
 VQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PV8WqoUGxOFZRKshOw3NOc1zZVTzDgewpvw4AU5r3QI=;
 b=AWTJGDmPJDyVLy+5u2ENK74b9ETO2J5Txs4pW6FXLKlJK72txNwUISbfMfTgBYyBrR
 pw9/lMn8fAsPVMKnEFuYjmRordSR9RvcoxXjgpc5zuKAi1fysKtBml3bnM2aZAzwRBnI
 UI0BF3lMlfwb4E9cboFknMEwq4ZflWDgJXQthh/j8Rv2zGjK9pDQ3FeSITHN1IzxZdvA
 KFBrDMSRLLYtrmIzPGK29OAdFEdXhC0kippTz//3IEp+qS0nZS4ra9qE2R+FLYxfJex6
 0za/WgVy4iaaTSja+1wfpEaS+J5HEZt4c5pB2xN/ILCZIj+n+H/NR2twjaopXxi5H2Q8
 nRHw==
X-Gm-Message-State: AOAM5311rQqCmoWw5aN/Sexl42GMv2GfdyxwwZUdTndWeWqpcu9KwAyQ
 6vW3bqrQ9mOv23lKvF9J3tdEjQ==
X-Google-Smtp-Source: ABdhPJyZSV21gNOrhCLTgOfOurM3xrgrxWRV/usdiINVAJc+n5B5QGzanddUNnKj+NV3L96tC+R3fA==
X-Received: by 2002:a05:6512:3e11:b0:473:9f5f:feda with SMTP id
 i17-20020a0565123e1100b004739f5ffedamr6358550lfv.244.1654249565460; 
 Fri, 03 Jun 2022 02:46:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a2e6a09000000b00254319f8e63sm1223352ljc.91.2022.06.03.02.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 02:46:05 -0700 (PDT)
Message-ID: <be1d59c3-049f-b9f0-3281-9875a0102aaf@linaro.org>
Date: Fri, 3 Jun 2022 12:46:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2] drm/msm: add null checks for drm device to
 avoid crash during probe defer
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
Cc: robdclark@gmail.com, swboyd@chromium.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/06/2022 12:42, Vinod Polimera wrote:
> During probe defer, drm device is not initialized and an external
> trigger to shutdown is trying to clean up drm device leading to crash.
> Add checks to avoid drm device cleanup in such cases.
> 
> BUG: unable to handle kernel NULL pointer dereference at virtual
> address 00000000000000b8
> 
> Call trace:
> 
> drm_atomic_helper_shutdown+0x44/0x144
> msm_pdev_shutdown+0x2c/0x38
> platform_shutdown+0x2c/0x38
> device_shutdown+0x158/0x210
> kernel_restart_prepare+0x40/0x4c
> kernel_restart+0x20/0x6c
> __arm64_sys_reboot+0x194/0x23c
> invoke_syscall+0x50/0x13c
> el0_svc_common+0xa0/0x17c
> do_el0_svc_compat+0x28/0x34
> el0_svc_compat+0x20/0x70
> el0t_32_sync_handler+0xa8/0xcc
> el0t_32_sync+0x1a8/0x1ac
> 
> Changes in v2:
> - Add fixes tag.
> 
> Fixes: 623f279c778 ("drm/msm: fix shutdown hook in case GPU components failed to bind")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Also please remove bouncing quicinc.com emails from cc list

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4448536..d62ac66 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -142,6 +142,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   
> +	if (!irq_has_action(kms->irq))
> +		return;
> +
>   	kms->funcs->irq_uninstall(kms);
>   	if (kms->irq_requested)
>   		free_irq(kms->irq, dev);
> @@ -259,6 +262,7 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	ddev->dev_private = NULL;
>   	drm_dev_put(ddev);
> +	priv->dev = NULL;
>   
>   	destroy_workqueue(priv->wq);
>   
> @@ -1167,7 +1171,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
>   	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>   	struct drm_device *drm = priv ? priv->dev : NULL;
>   
> -	if (!priv || !priv->kms)
> +	if (!priv || !priv->kms || !drm)
>   		return;
>   
>   	drm_atomic_helper_shutdown(drm);


-- 
With best wishes
Dmitry
