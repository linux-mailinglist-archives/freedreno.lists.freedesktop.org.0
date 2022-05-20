Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B352F444
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 22:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F0F10E11E;
	Fri, 20 May 2022 20:11:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6542710E102
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 20:11:45 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so11480466fac.9
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uCSJrMcblYtE68pI/o4aCmCDuyMBMTIK3XeFUPvOxus=;
 b=Aod2ILs1RijYKXW4aXOU2BMwT5hq9+n39aXCSNpVCSiKiV2mBseP2mnnLb2FxS2Mwt
 Q+miDEFv/E1MsuY0ay93RhZoZUTIMenvnIsznz8ZpLD8gyRukPy7eMXtndRB88hXyCzx
 I+KHm+DSXBvQFXaHFU7xEQJL28LCFHnGlgQ5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uCSJrMcblYtE68pI/o4aCmCDuyMBMTIK3XeFUPvOxus=;
 b=r2ZY7l1x4O8PNgSDu84wn9e5mBlF6gd2IuSMass1fSp11uZmZ1sQtUBykcEN/2T+kT
 oWMkUDfpa0pL1ANal52IYSpdPW4SCEn3bRfSqYDdgDKp966J7dVN64FPl41GkF5ODay9
 xzupAiCUupLyqGDB1fr5pk9Dhbm1/zJVoE/fxrT9ZQ3NDQ8S54L8TTir730Zyf5fpAt9
 vwB62df+3Ym9BgNljhM6B6rzIi+WVqTfsPxP/vy346lhrlbrZ2eCnV11sc/2zoFtkXEt
 i/GSawzTM9NoeT3kBpCmFRIW1E83vas8pl+ESlrI3ndFmnDh+NupbBMmSoaJcK5GOucI
 n6fw==
X-Gm-Message-State: AOAM533Pedw7TxwooATuYD2dcXy486E+Ehzjy+ki1vihPIIM+7Ijv0xq
 UEAkqxXghQc7pWjFBiJXI4rHbzrxVTxqhI7iW/gjlA==
X-Google-Smtp-Source: ABdhPJyZzp8Z8QM9GBZRwRI5IW+g6D1RrMyMk90vlJpNz5rkGtSO8wMKBpy5TYZYX78MlQGpAiU3hd3sIjiNZZb4lms=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr6766673oao.63.1653077504534; Fri, 20
 May 2022 13:11:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 13:11:43 -0700
MIME-Version: 1.0
In-Reply-To: <1652804494-19650-1-git-send-email-quic_khsieh@quicinc.com>
References: <1652804494-19650-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 20 May 2022 13:11:43 -0700
Message-ID: <CAE-0n51_Bp50XbjvA7-4ZAf2ReXbRCWxt3wLe3tcqAeUKjE2kw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7] drm/msm/dp: Always clear mask bits to
 disable interrupts at dp_ctrl_reset_irq_ctrl()
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
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-17 09:21:34)
> dp_catalog_ctrl_reset() will software reset DP controller. But it will
> not reset programmable registers to default value. DP driver still have
> to clear mask bits to interrupt status registers to disable interrupts
> after software reset of controller.
>
> At current implementation, dp_ctrl_reset_irq_ctrl() will software reset dp
> controller but did not call dp_catalog_ctrl_enable_irq(false) to clear hpd
> related interrupt mask bits to disable hpd related interrupts due to it
> mistakenly think hpd related interrupt mask bits will be cleared by software
> reset of dp controller automatically. This mistake may cause system to crash
> during suspending procedure due to unexpected irq fired and trigger event
> thread to access dp controller registers with controller clocks are disabled.
>
> This patch fixes system crash during suspending problem by removing "enable"
> flag condition checking at dp_ctrl_reset_irq_ctrl() so that hpd related
> interrupt mask bits are cleared to prevent unexpected from happening.
>
> Changes in v2:
> -- add more details commit text
>
> Changes in v3:
> -- add synchrons_irq()
> -- add atomic_t suspended
>
> Changes in v4:
> -- correct Fixes's commit ID
> -- remove synchrons_irq()
>
> Changes in v5:
> -- revise commit text
>
> Changes in v6:
> -- add event_lock to protect "suspended"
>
> Changes in v7:
> -- delete "suspended" flag
>
> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
