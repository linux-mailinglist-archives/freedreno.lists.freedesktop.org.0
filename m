Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3C52F448
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 22:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6408610E11E;
	Fri, 20 May 2022 20:14:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357A710E227
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 20:14:24 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v65so11167888oig.10
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HWJji6gVytG9NaepPJsUpOE+oqctRwW53y/Rg2/3daI=;
 b=L5wdilZPPhLeZ6H9txo7C+yQMMnJoaeLu6EewH66Q73sZn7CgIshPVfGQt58p2T1rF
 z7QeS2uLJnC624MbM5zt8fBPnBh+VHRq7OO8RY0kOqZapAwf1WxaNEnVe9wSh6nhfAU1
 u6lKg8SoY9PqpD/V98ioNwwwLlmY/2daDSeTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HWJji6gVytG9NaepPJsUpOE+oqctRwW53y/Rg2/3daI=;
 b=p4oXLB6RKB9j4Cz1wNQ+zDdwlHg+0iNIoYULbITipLxv9AUBQ6QMrmfUMjV9BZDsBG
 YsToym/eIaPdNLhuOgEG3nD2QY5eyuU/aQPZtssLwO8OQQmMt11SsMk92ovQuwW5CYxf
 HtKJ66toTBLeLyeVgq4SfhGceVmZx4BPM9omEtC04vy+vi1+QWM8701BxMzn66bHYl0F
 L4Fv0SqG/89tl/hSQN8arRMHxTrX6gC+NG6t/PKTvtq/AyxCKADe7NvJGoh9Vsm3ovK+
 s4Zwnq/ThIAWSEC8SXTrPeLVFMSRWK6s380y2KEIfS2pvOt5cZcVAq+y41RyQMANpVPe
 71Fw==
X-Gm-Message-State: AOAM531ul3/zUFwg6+tXt71/3n9OfhtslVNBJkUdL03WAMCEx937ZZZX
 xazJIZ4Kj2n13hcwoBmOWeWgClhEbC26DO9ZCTohpA==
X-Google-Smtp-Source: ABdhPJwP7L0SMXKFI6625vEQZTfFfECarUErW2tlmkzH+D2As2PkcfrO1Fh8376ZDCpcT7+qRqUbX8ACus/aB+6rZHQ=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr6601653oib.63.1653077663519; Fri, 20
 May 2022 13:14:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 13:14:23 -0700
MIME-Version: 1.0
In-Reply-To: <1653077167-16684-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653077167-16684-1-git-send-email-quic_khsieh@quicinc.com>
 <1653077167-16684-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 20 May 2022 13:14:23 -0700
Message-ID: <CAE-0n51B3Crb0ZFUppu2MXAGfCEfRcO9FX-6KMTTcPia3w8TkQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 1/3] phy: qcom-edp: add
 regulator_set_load to edp phy
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-20 13:06:05)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..0b7f318 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,9 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +       regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */

Why aren't there checks for errors on these API calls?
