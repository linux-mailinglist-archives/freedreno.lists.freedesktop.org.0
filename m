Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C09A94C4D5F
	for <lists+freedreno@lfdr.de>; Fri, 25 Feb 2022 19:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFDC10E921;
	Fri, 25 Feb 2022 18:12:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8B210E91E
 for <freedreno@lists.freedesktop.org>; Fri, 25 Feb 2022 18:12:41 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so4155105otp.13
 for <freedreno@lists.freedesktop.org>; Fri, 25 Feb 2022 10:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=P6W6fSTOMdI6DLwtXjDNtCkqRboRbExm2e87efd8TAE=;
 b=eIqzJQNGDjQoI00BNU+tJKXsaDa99HFdSsv0vWvNAr5r4lBlpfHfcamK2xc1519ppu
 sXVYfJq14r21w2I5V2MinOcLw41/s2PGQeFw73sUF9MS1lZ0BMokG9riYG/xhOm+z3LY
 cf0JHDdyinFanzE+Angaxs/OHpfBM977UqwKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=P6W6fSTOMdI6DLwtXjDNtCkqRboRbExm2e87efd8TAE=;
 b=DfuyugfHu1e464xxsT/MqkwTqx4+dj5QqVHKjZSIm/CPEKjz733yA2NwetldSzmBv5
 g3RDBOFeMlDBnsGGCNyeS/M4mlal/sryrk7qDbHXP3HKwizkbWcyH/dHhoRT/6zql70G
 VjzTdgOLtvdmzcLrbBS2T1jvUcvGmWJO3vhaO+3/ePJY3A6BssAUUAeL+zeDTgkSDeL5
 +GlnVIZ2PNyAB9mZ2eGIBDFp/r1wOJOaiE5RC4ooHs+/rnoajyVdah9dDupaRCwRx8Bu
 E+wP7aGsAmN9WnwjZL0HTRNfzzwoxarCqifC40osAuHUvFzrqzDXxEnXCRbhkKG2y+1l
 y/oA==
X-Gm-Message-State: AOAM531C30Zq3PXP+6MXMtGHEVshYiWuqEm+1sQ2m0UKRU2tbqzcN5tt
 zS6t7FGN2X3NBNDdPFJnCBLia2f6BMDoZ7NYUy7CAg==
X-Google-Smtp-Source: ABdhPJyZelvN2oaHvgHZQWDJl2h3BY/MvV7fI/x3v4r3uWyib6RzcGk21LpfwuLPgerrS7SuRls6Hqk4L9/OaKQ12j8=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr3289214ota.159.1645812761131; Fri, 25
 Feb 2022 10:12:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 10:12:40 -0800
MIME-Version: 1.0
In-Reply-To: <1645804670-21898-3-git-send-email-quic_vpolimer@quicinc.com>
References: <1645804670-21898-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645804670-21898-3-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 10:12:40 -0800
Message-ID: <CAE-0n50q4WitTP-dBUwGAWkkF+_hisCHQLntRf7MOi=KSyxQpQ@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/disp/dpu1: set mdp clk to
 the maximum frequency in opp table
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
Cc: quic_kalyant@quicinc.com, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-02-25 07:57:50)
> use max clock during resume sequence from the opp table.

s/use/Use/

> The clock will be scaled down when framework sends an update.
>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")

Presumably this is the wrong fixes tag, see below.

>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d550f90..3288f52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1319,6 +1319,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>         struct drm_device *ddev;
>         struct dss_module_power *mp = &dpu_kms->mp;
>         int i;
> +       unsigned long max_freq = ULONG_MAX;
>
>         ddev = dpu_kms->dev;
>
> @@ -1333,6 +1334,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>                 return rc;
>         }
>
> +       dev_pm_opp_find_freq_floor(dev, &max_freq);

This isn't exactly a cheap thing to do every runtime resume. Please get
the max frequency during probe and stash it somewhere to avoid making
this call over and over again.

> +       dev_pm_opp_set_rate(dev, max_freq);

This is entirely new. The assigned clock rates from DT aren't set during
runtime resume, only during device probe. My question is, if this is
needed now then does it mean we've been running the clk at low speed
after the first runtime suspend and never been pushing it back up again?

>         dpu_vbif_init_memtypes(dpu_kms);
>
>         drm_for_each_encoder(encoder, ddev)
