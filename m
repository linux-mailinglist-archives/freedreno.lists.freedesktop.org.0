Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6856544C8
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 17:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A7F10E53A;
	Thu, 22 Dec 2022 16:06:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F3A10E53A
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 16:05:58 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id a14so1540676pfa.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yNYj2+faAjMFDKAvbNk2y84zda8I1j/yCB/6Jq35uqw=;
 b=yuaLOWS/FYiY3xwvYVkTZMNK3ghRu+trYkX1lJftsL9e/mHyQwKa6ntkfygZmqBGMj
 H3qCTyo8k46QpqYgbgBC8rftntKZGhaYYbfIx5xLOjMAi4hrlK4aLEmfdYVYPDVjIQpz
 gH4hFznFXTq9L2ENLd5JNb9vBhtuHunRlvOTqkQt1qTUEVtod+3fHRv3GLf+u0ziKNfL
 yO9phnIdzuNhFmlWwuz1UQBBtyOruhm+NI2878FOD85MBskflZHTWXY3OJowCVRRRPUI
 t9I8KjmAhuUD9WlHJJ2fPYaRUYCjUs+h3bQuIrsK+2tZ8t8Q7AFA+N8DN8aPKOHL/b3d
 a7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yNYj2+faAjMFDKAvbNk2y84zda8I1j/yCB/6Jq35uqw=;
 b=Ltr0k51AJT1uOQv3LNu3uLqkBGWmYTXRJPYk3GuTlvdhPOFLS6TzZekZFm/7LWwo8u
 nVh1vQ+iUaZyOt/iKUiTtwTKFFnJdf8JwP7o8Swvzd2W4MztTJf0we3u8J5THh4uKK2j
 rOj/C5o79RjVzDLpqcvsrxcHs+ma52VrJDTKlU0qv2cRXDsHKvvF66ltADaFZ/aA8e9c
 RbAn7RAs/mzYwApt5QLAxSDoMdtg66qUmm3ziFz1Lr1rPMtaabwhH+FBCm/fa300x8fW
 GpRurHIJkUzWMSEwlZZvro9a+QxnrAUNhttaxqCBU7XebzzuJhVI8CG/qBpYK/Gy69sV
 rvAw==
X-Gm-Message-State: AFqh2kri9tOWfLHdueYrZamK/EEoP9G+KujRsJGj2iElwQSFlahFsW0S
 zqnD68N6CHcKEqzvdL+Jn+e2yPWg38UmN8yM/c5/kQ==
X-Google-Smtp-Source: AMrXdXuucHOLti3ekPdYE6Bj1QKKm3rrotVU76QOg85NDX4pWDEjtUAZ1t5qIqPwXfgwa7ckwK0/p6ZVEpkdSq1dQes=
X-Received: by 2002:a63:e4f:0:b0:493:d903:6616 with SMTP id
 15-20020a630e4f000000b00493d9036616mr259913pgo.541.1671725158143; Thu, 22 Dec
 2022 08:05:58 -0800 (PST)
MIME-Version: 1.0
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221221224338.v4.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
In-Reply-To: <20221221224338.v4.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Dec 2022 17:05:21 +0100
Message-ID: <CAPDyKFrKV4aHxTosQHkkbBHS3MOx=-i+sW=jQY=sYE4XnaQHmA@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 2/5] clk: qcom: gdsc: Support
 'synced_poweroff' genpd flag
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 freedreno <freedreno@lists.freedesktop.org>,
 Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022 at 18:14, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Add support for the newly added 'synced_poweroff' genpd flag. This allows
> some clients (like adreno gpu driver) to request gdsc driver to ensure
> a votable gdsc (like gpucc cx gdsc) has collapsed at hardware.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Rename the var 'force_sync' to 'wait (Stephen)
>
>  drivers/clk/qcom/gdsc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 9e4d6ce891aa..5358e28122ab 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -136,7 +136,8 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
>         return 0;
>  }
>
> -static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
> +static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
> +               bool wait)
>  {
>         int ret;
>
> @@ -149,7 +150,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>         ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
>
>         /* If disabling votable gdscs, don't poll on status */
> -       if ((sc->flags & VOTABLE) && status == GDSC_OFF) {
> +       if ((sc->flags & VOTABLE) && status == GDSC_OFF && !wait) {
>                 /*
>                  * Add a short delay here to ensure that an enable
>                  * right after it was disabled does not put it in an
> @@ -275,7 +276,7 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>                 gdsc_deassert_clamp_io(sc);
>         }
>
> -       ret = gdsc_toggle_logic(sc, GDSC_ON);
> +       ret = gdsc_toggle_logic(sc, GDSC_ON, false);
>         if (ret)
>                 return ret;
>
> @@ -352,7 +353,7 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>         if (sc->pwrsts == PWRSTS_RET_ON)
>                 return 0;
>
> -       ret = gdsc_toggle_logic(sc, GDSC_OFF);
> +       ret = gdsc_toggle_logic(sc, GDSC_OFF, domain->synced_poweroff);
>         if (ret)
>                 return ret;
>
> @@ -392,7 +393,7 @@ static int gdsc_init(struct gdsc *sc)
>
>         /* Force gdsc ON if only ON state is supported */
>         if (sc->pwrsts == PWRSTS_ON) {
> -               ret = gdsc_toggle_logic(sc, GDSC_ON);
> +               ret = gdsc_toggle_logic(sc, GDSC_ON, false);
>                 if (ret)
>                         return ret;
>         }
> --
> 2.7.4
>
