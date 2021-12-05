Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC1469385
	for <lists+freedreno@lfdr.de>; Mon,  6 Dec 2021 11:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845A673F7A;
	Mon,  6 Dec 2021 10:20:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02E6E323
 for <freedreno@lists.freedesktop.org>; Sun,  5 Dec 2021 04:05:28 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so8980618oto.13
 for <freedreno@lists.freedesktop.org>; Sat, 04 Dec 2021 20:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AXzcZCKOBu/msJYDlg3Y+fzM95FhQ9eIvXKzuLg8CYs=;
 b=AmuNcydbQKjrjST36znuG6aIEps8lr+NEoZm8GTsEJRrucyjgTzlxRG5CWPEAF5zLI
 jQzT0P+RXN+fZz1zyegaxKmqkaob+q9Qx7NFgGzwYqMNNvPNLIv10p44avHxK1L5LOi3
 bygNpdX9oJMohTtI3RY5UtfKzoaa+WypyAjpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AXzcZCKOBu/msJYDlg3Y+fzM95FhQ9eIvXKzuLg8CYs=;
 b=e6xk5Tcup2wd1uwwZWKzN6AjkVIZlv87pkK5NYQbUWoIZiI8Q7byQWZQSJzjt3j8ce
 OnTP4wh611TMksvspA2wPDeVQDLHiM0JX0+kOVch6i/aE8/M0VrGQj1+Yb46TL5k7vTu
 e9mcRXajzoyHMhco4LM4gqS/VHQZETnuDoFeCpLSEf1QfD5/se21cXBliNIQBUw03hfA
 5aMFqIpewKhe7BgcJDiXIFmJnmgR4BbznjPjK06OUoMSzAOLbEw3BDpV7lhpruAsKdDx
 /kXMsjIOh7qvxpBvDBzTqkHLkVYTMCtdIQdGO8WEDBPDd3TP9nluUPaHnEGtyTbzZS8X
 B3Lg==
X-Gm-Message-State: AOAM5327feESmpJgM5hXBMcrKsJlM1lqrRhydO0h8OX4kAx6V8DcU01N
 17e01NERQY3bVOougHAvZZEdxOrAJQoxykKk1je9vg==
X-Google-Smtp-Source: ABdhPJxWcPtz+q1YJarR+oJWSUf3FTjY0xDPDQPv8K4vpWyix5KmjKghi6TmOgkMKNZ83F0NU4bIZDFmxzAfdegAiwA=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr23402340ota.126.1638677127497; 
 Sat, 04 Dec 2021 20:05:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Dec 2021 20:05:27 -0800
MIME-Version: 1.0
In-Reply-To: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
References: <1638568959-7564-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 4 Dec 2021 20:05:26 -0800
Message-ID: <CAE-0n51TZG9SjjOaNmNJPhzOZmQLsywcAT7_Vf4uz4VPga5xhw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Add "qcom,
 sc7280-dp" to support display port.
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
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-12-03 14:02:39)
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)

One nit

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d44f18b..91582d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -146,6 +146,7 @@ static const struct msm_dp_config sc7280_dp_cfg = {
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>         { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> +       { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },

The letter d comes before e so it would be better to sort this
alphanumerically and avoid conflicts later.
