Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33213501F68
	for <lists+freedreno@lfdr.de>; Fri, 15 Apr 2022 02:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0ECA10E3DC;
	Fri, 15 Apr 2022 00:02:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9835910E517
 for <freedreno@lists.freedesktop.org>; Fri, 15 Apr 2022 00:02:55 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id z8so7098811oix.3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 17:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lFXIXGhjvQiAzcJjIJPH2ZocTakW8F4DCyIRzI8kZmQ=;
 b=a4UWMC3Ccy7fIO00COl5o++pPXzAJXp59uvvch6NqUugy5OUGyM4dqnLcYCxTtGTFs
 Exo5iNPWolW/pq+nOr9yCp7r5sCLhqMJnPCFdnFrD5QjBf8Qbyc/O8pcq8lKkzxRciu5
 DB5F212L1L9QUmqGCIfD5Cb2uIcmq/xP98dEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lFXIXGhjvQiAzcJjIJPH2ZocTakW8F4DCyIRzI8kZmQ=;
 b=QxkoS401eTfIdhvJvb559lwG3ovDlB8mJzkqrEzEd0Bl2hn1EzXCFxduebyWBmKrbd
 1gA0Y07YD9YgPyMIcgYb55fjIXkWLDWCyHH/lmSH0S1Edvep12bkR9f9WXsQIcu8S6pA
 KA20Qrr2d2CyUa96pu3Rh+VEOY83muxm6VV/hU6AI4AUvg0GdrMV1mVSS6kHAwExjMvf
 LX6sIFmx75TBgHvWgodq2G5rr/TF9MOJTI9Vj4pbbFekXgA0rg4327OlQa1Bobb8T9xJ
 AxFhKoviJeaZIH3AJ3eZBEOQYsmzPVYZXt2fP4GTOSHZjcu0/PFv3LyX4dLfoXSlOmGi
 d7zQ==
X-Gm-Message-State: AOAM533OSIHKzuNIP2iGxu35D0AE2X2vFMNwiCYW8Bp1GtlblZ/rAjLq
 F0gdwC3/7aiayxEfKJ+AfOhWvQXvxvSdOaqBI35Rig==
X-Google-Smtp-Source: ABdhPJwI9zofyRE9RWr2YAteFhCYNo1cf6Ca5LBeolyDphWIQ4e7AZhm56lnYdqGmBbQIaHvNgr0o138d2iJdeIDoco=
X-Received: by 2002:a05:6808:10d4:b0:2fa:5fa6:e9c4 with SMTP id
 s20-20020a05680810d400b002fa5fa6e9c4mr467095ois.193.1649980974816; Thu, 14
 Apr 2022 17:02:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 17:02:54 -0700
MIME-Version: 1.0
In-Reply-To: <1649973079-5916-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649973079-5916-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 17:02:54 -0700
Message-ID: <CAE-0n53jz9EZ=ry3+zh7KgyYLcF5dQoKeBwcXDQzq8wagyzRvg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: stop event kernel thread
 when DP unbind
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

Quoting Kuogee Hsieh (2022-04-14 14:51:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..baba95d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -230,6 +231,18 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +

One too many newlines

> +static void dp_hpd_event_thread_stop(struct dp_display_private *dp_priv)
> +{
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +       /* reset event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +}

This can move after the start function?

> +
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
