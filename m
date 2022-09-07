Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57455B0C54
	for <lists+freedreno@lfdr.de>; Wed,  7 Sep 2022 20:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E94E10E81B;
	Wed,  7 Sep 2022 18:14:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7D310E7FC
 for <freedreno@lists.freedesktop.org>; Wed,  7 Sep 2022 17:32:42 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id f24so15313304plr.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Sep 2022 10:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=PV80BfdzomPMJURi087Oy7m2sToiidrH8fxfw0BanCk=;
 b=WRRE6viD0EvhH9JvdnKy35PydpK4R3QCY/miuWOrErAWVcPaRy85VWJR0c678t9Ppl
 UJeDRqiNHEAe2812nwuVeiQxxbaF2Vp+J9CHb6Zx4SjHwcf1XHtK2bgHI6p85n9jk/4M
 mUBSZhxssIJrPWHUlG1Ie0s75g9vyAhz1qJaelALcMhfxDhL3lBpvZqutwAWU5dDFqtJ
 GhFRKKtxKttbyFedwpl+YK4U/MIidIGNTwjcLrzRbUwpVh3XoI9aOyN0TBAulIfDKo6l
 L7oaMvC6JgAZrFIDLTZrQHKo/3X/J1GyN7JPh54MqIKzf2dcmXjAWc42qTGhixSwoh8Y
 u6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PV80BfdzomPMJURi087Oy7m2sToiidrH8fxfw0BanCk=;
 b=eRKtxE9WqlS8p5xMtUpAsPJ6IZeIelatmWsHsGmBb2ln+MAKWOhsGXxY5ONzsIBb3H
 gTQIMVFoQYM/6/AVuS8YVrfd4qupb0/oVrryMIt/Zx0vkXJ383Jf0L7ghhwz48DHrBdN
 9seKKmpEXnrszh9c5d2jz5ngLq+L8NuAqsjF5HphHyFUiw2kE8gHsEX9jzUqHb1T29it
 P2ReFk4RPAegmgQZYicI4om/NCf1mV780j+nYYlGuKvvNZruCRbY2bPP4vXZ/5bFVrr7
 0Q6FY1OLq5YVuZyA9dGc978QbiKpGp/o+JFwREsT+0a8nDHVI+qXfnHsu3fliipl4d2l
 Asaw==
X-Gm-Message-State: ACgBeo045soRROz5Xa6KSsdZdnDBPgYVi5k4IEiPm3if3qXnuBDm72OU
 9SQgkOPQpHbYNqe26tOVdNtF
X-Google-Smtp-Source: AA6agR4UATw/VzqQynEchHeCQ6k+uSoa//y5hg8/e35Ta7K7Nfw3Mu88+Tq3J1V+IwbNulUfgaL6Mw==
X-Received: by 2002:a17:902:e811:b0:176:a865:8b31 with SMTP id
 u17-20020a170902e81100b00176a8658b31mr4905982plg.54.1662571961768; 
 Wed, 07 Sep 2022 10:32:41 -0700 (PDT)
Received: from thinkpad ([117.217.178.248]) by smtp.gmail.com with ESMTPSA id
 o7-20020a656a47000000b004308422060csm10562677pgu.69.2022.09.07.10.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 10:32:40 -0700 (PDT)
Date: Wed, 7 Sep 2022 23:02:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20220907173234.GA539582@thinkpad>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Wed, 07 Sep 2022 18:14:04 +0000
Subject: Re: [Freedreno] [RFC PATCH 0/3] drm/msm/dp: several fixes for the
 IRQ handling
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Johan Hovold <johan@kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> Johan Hovold has reported that returning a probe deferral from the
> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> properly. This (compile-tested only) series tries to fix the issue by
> moving devm_request_irq() to the probe callback.
> 

This series fixes the probe deferral issue on Lenovo Thinkpad X13s. But I
didn't look close enough to verify if all other resource deallocation are just
fine.

Thanks for the quick series, Dmitry!

Regards,
Mani

> Dmitry Baryshkov (3):
>   drm/msm/dp: fold disable_irq into devm_request_irq
>   drm/msm/dp: switch to using platform_get_irq()
>   drm/msm/dp: move dp_request_irq() call to dp_display_probe()
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
