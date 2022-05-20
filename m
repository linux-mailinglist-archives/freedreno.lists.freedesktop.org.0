Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4CF52F4CD
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 23:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E80910ECF2;
	Fri, 20 May 2022 21:12:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B6C10EC7D
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 21:12:23 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 30-20020a9d0121000000b0060ae97b9967so3263216otu.7
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4ZcyIGcvDMZ0Wk1DSYhTSmlkdvT7fKKWDNVZgAqDgGs=;
 b=eaQmMn+s8uRwoapg8tdT+VIW36IHFmIaLDAaqPy1SY9nmnNRwYcHAUMMdYnfIhxJS0
 WshDX+JkE8GIL74lyEXI3yqi26ADb9QFljgwiKOGJMmas/u9kUsntbKtGzi2K8NGFiPm
 igQfJRlBr7mVQ0l7n/QR8CVQVCSAzlyw+6T6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4ZcyIGcvDMZ0Wk1DSYhTSmlkdvT7fKKWDNVZgAqDgGs=;
 b=cYl+rZSz1LV0BsOAXVykm+MxWzbX5nr3cMr32ziGPyZdPWxE31QVJUDwp2mm+k7WQg
 EKodwPloIhrVXlhWRIMwfvWO/8tWi09p3ugvJupHwOYHI1BXEmh64xrowdICjh0Vg4gT
 Zj4qq/VYxFqztXT5i8Z5j+Uy0tHL+IdXxVRRiMjShnVhQdK7upKyM70uS4GTYvf8ZSiF
 6japL36cnLkggzpBx6G8jr+cW6lY1O6NVxY4sGLQEDSIDxjGca4essZY0x/n8QWl0zqB
 W8StBplYVQz2rlDNAM1gIku6fOG7py7X8KEmqgrM+YVXzH+GPDiKZPXRs+Cl7sB4gLtX
 5puA==
X-Gm-Message-State: AOAM531CnyN8rodkpOcnL7/6AvtZfb6C2chAWibu9bZiYQOnomYTTfim
 HA3ZZnViHg3WUtz1HGl/FN2+KgSBbA/iSiqBCQvCFQ==
X-Google-Smtp-Source: ABdhPJxk+2xo1hoJV75bGy29jmo3pmmEPymugHRbVngVyWNYYyVDr1T3jSaGlzrMC2H6l+67cPlv6Ov3vyOsySFzwTI=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr4797333otl.77.1653081143110; Fri, 20
 May 2022 14:12:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 14:12:22 -0700
MIME-Version: 1.0
In-Reply-To: <1653079257-20894-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653079257-20894-1-git-send-email-quic_khsieh@quicinc.com>
 <1653079257-20894-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 20 May 2022 14:12:22 -0700
Message-ID: <CAE-0n50EUVwckogNT1ey-HP7QoMCPZPF9AyP+xw7J9o8MOk6YQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v10 1/3] phy: qcom-edp: add
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

Quoting Kuogee Hsieh (2022-05-20 13:40:55)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..955466d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -639,6 +639,18 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       ret = regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
> +       if (ret) {
> +               dev_err(dev, "failed to set load\n");

Which supply failed to set load?

> +               return ret;
> +       }
> +
> +       ret = regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
> +       if (ret) {
> +               dev_err(dev, "failed to set load\n");

This printk is the same as above. I hope this print never happens or it
will not be useful enough to narrow down the issue.

> +               return ret;
> +       }
