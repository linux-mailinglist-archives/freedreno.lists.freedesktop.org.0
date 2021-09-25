Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECE041843B
	for <lists+freedreno@lfdr.de>; Sat, 25 Sep 2021 21:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672A26E45C;
	Sat, 25 Sep 2021 19:43:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA456E45C
 for <freedreno@lists.freedesktop.org>; Sat, 25 Sep 2021 19:43:56 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b20so56349080lfv.3
 for <freedreno@lists.freedesktop.org>; Sat, 25 Sep 2021 12:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o7r6LEd84eVcpzdZevVA6CNaY4Y+fECuY4q5lSdo/i8=;
 b=qeT57O9lND44qSN3DGwfbXbhprfMBWzv2Pbsr/GdFMqo4tFkzZxERpXzSs1cJcUwup
 0o0SlgDD0hkuQSw9p71n4PH10RwheH1XAi6YMCa67Vw4BIZy8HtpSO7NnsIRn2lK0qhJ
 /ziQL7X8MpHcU/rP3kdX+MLdPxcY/1GUwccebAaNwc1saJTEmOmp1iMAyqxqYuIsKWJe
 lYOA+StLJDDbJcWmIeIq+sFjyyn4RTVPfZGzu0zFazcphiWCvmLRGbsl0vO6jCpRUTaf
 8ETccGHywqFxcgC/IHGHGVJulTsIvTJOVA+L9Cz5TvUOJJMSPjFCazaqaSTJdgC9S5/o
 iLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o7r6LEd84eVcpzdZevVA6CNaY4Y+fECuY4q5lSdo/i8=;
 b=BTc2BzVgHPaLaUCgscR5h7+vy0tCCYPM0t6v6cNy4kB+zU8fytMOHTBW1SmCbJPZLw
 +0aug2RhTbndbXdEHpaDTL/Y3AQk94A67ZrDzwjIYv42Vhg7C60VDdUzhAtEGdf8QVCm
 +9V2tItgzCM2dNKwmNRY0cm2C+0TEeZ3WOVoVI7MymnUTt9aEoacpToMP6dGZQnwuzrH
 +WI4xZnilcsHR34vonzGCPUsNBl5hgjcujkSBxPD5Mir/u0Pw1HolwQg/C0uwW0RnNPW
 DB/q9x4hb0C7Dq3gs6VkF4hAtW5IpHDxL9KNxxQGqL7ZNNq4vNRYRuYTGtu78oA88QwO
 GCFg==
X-Gm-Message-State: AOAM5319SPxEcVETf8A7jsb9EqqPV/yP1AWGxYjU+E8wxwFHrVD0okIN
 3SyDgD7BYmr0pJavDYhXOoptXOtyneBFSQ==
X-Google-Smtp-Source: ABdhPJyYDbYaE2GJOBvOxIrHttHqaheFY0ZVf9vTc6jZcXz0SWTn+4LBTvTL2QKwhZHG5uu6Nbgp8Q==
X-Received: by 2002:a2e:5450:: with SMTP id y16mr19450595ljd.21.1632599034319; 
 Sat, 25 Sep 2021 12:43:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v11sm1106002lfi.56.2021.09.25.12.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 12:43:53 -0700 (PDT)
To: abhinavk@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Heidelberg <david@ixit.cz>
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
 <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
 <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7512b299-106f-2ffa-6d4f-46dc195abb84@linaro.org>
Date: Sat, 25 Sep 2021 22:43:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: do not install irq handler
 before power up the host
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/09/2021 23:52, abhinavk@codeaurora.org wrote:
> On 2021-09-21 10:47, Dmitry Baryshkov wrote:
>> Hi,
>>
>> On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
>>>
>>> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
>>> > The DSI host might be left in some state by the bootloader. If this
>>> > state generates an IRQ, it might hang the system by holding the
>>> > interrupt line before the driver sets up the DSI host to the known
>>> > state.
>>> >
>>> > Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
>>> > so that we can be sure that the interrupt is delivered when the 
>>> host is
>>> > in the known state.
>>> >
>>> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
>>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> This is a valid change and we have seen interrupt storms in downstream
>>> happening
>>> when like you said the bootloader leaves the DSI host in unknown state.
>>> Just one question below.
>>>
>>> > ---
>>> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>>> >  1 file changed, 12 insertions(+), 9 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> > index e269df285136..cd842347a6b1 100644
>>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
>>> > mipi_dsi_host *host,
>>> >               return ret;
>>> >       }
>>> >
>>> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
>>> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>>> > -                     "dsi_isr", msm_host);
>>> > -     if (ret < 0) {
>>> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: 
>>> %d\n",
>>> > -                             msm_host->irq, ret);
>>> > -             return ret;
>>> > -     }
>>> > -
>>> >       msm_host->dev = dev;
>>> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>> >       if (ret) {
>>> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host
>>> > *host,
>>> >       if (msm_host->disp_en_gpio)
>>> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
>>> >
>>> > +     ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
>>> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>>> > +                     "dsi_isr", msm_host);
>>> > +     if (ret < 0) {
>>> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to 
>>> request IRQ%u: %d\n",
>>> > +                             msm_host->irq, ret);
>>> > +             return ret;
>>> > +     }
>>> > +
>>> > +
>>>
>>> Do you want to move this to msm_dsi_host_enable()?
>>> So without the controller being enabled it is still in unknown state?
>>
>> msm_dsi_host_power_on() reconfigures the host registers, so the state
>> is known at the end of the power_on().
>>
>>> Also do you want to do this after dsi0 and dsi1 are initialized to
>>> account for
>>> dual dsi cases?
>>
>> I don't think this should matter. The host won't generate 'extra'
>> interrupts in such case, will it?
>>
> We have seen cases where misconfiguration has caused interrupts to storm 
> only
> on one DSI in some cases. So yes, I would prefer this is done after both 
> are
> configured.

I've checked. The power_on is called from dsi_mgr_bridge_pre_enable() 
when both DSI hosts should be bound.

> 
>>>
>>> >       msm_host->power_on = true;
>>> >       mutex_unlock(&msm_host->dev_mutex);
>>> >
>>> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host
>>> > *host)
>>> >               goto unlock_ret;
>>> >       }
>>> >
>>> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
>>> > +
>>> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
>>> >
>>> >       if (msm_host->disp_en_gpio)


-- 
With best wishes
Dmitry
