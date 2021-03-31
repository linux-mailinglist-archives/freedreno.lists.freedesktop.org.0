Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7311F3503E4
	for <lists+freedreno@lfdr.de>; Wed, 31 Mar 2021 17:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069116EAD7;
	Wed, 31 Mar 2021 15:56:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331BE6E194
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 15:56:00 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 7so19795203qka.7
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3txpl7SPHqYWFmYajWj2ZLqZQklbOiGgSGT1F0s0WDs=;
 b=NQWUaXXWMySIF2EP+8LpYt2VqT0hEYBBQPiLFjsHR6kSUpulZam5AaYGVvXpIOfMLf
 OsgyFb42lxRPZDjBSuOxeV2GqM+6W2QryNNKQ8ks3PqlyEZcN5M27OVl8w3pIYj2aS/k
 J1RzZvE1dtaWstaKZ7sZiDlHlAOiriZmnGnng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3txpl7SPHqYWFmYajWj2ZLqZQklbOiGgSGT1F0s0WDs=;
 b=XWGbyIcgfr9vPD2ENdU0/jU7FUkNWPCKwSLRSjsAoohqtookJRzgpTJOQIiAytRyRx
 906AVexPh0EWVT1hojN1zePZiTAm/irumZj7BXhtFFiuhV+bZRxdPNXbLJX493yqEIgn
 GtZlPnYjXl8ciy8n8k32D5lRnNYZnDijZ1uKAvlUwoIXcxA9VMwzVTnFnbOmrL3ihQxB
 N3t22gH4C/xA6dHD+PgsJV9/z0IxUL9rPi+JkYtmJpuu6mnwQbE+ph/mdY6ymSu3YxEV
 FGDUIB7vGmULCGV6yPOiNu6sI3tsgbu3RNSulrMjpzwcH0j4pXHsqtN90xQcE0OJPS0f
 SCXw==
X-Gm-Message-State: AOAM5337Qn9EMGRj8fR3qED9Uv+4aRgK/97v1znA8fAkMdLaQY3zN7u7
 oy0rQ3FXRVO3ItvrA7J7/TFo/Nw6PJvyvg==
X-Google-Smtp-Source: ABdhPJwNYjKlvyrYmdw1Io9PbQnOJwfzDzvsdAgZ96Pxzk8QqxTaOcd5tCJ19p3lOVhWrV0WbOT4xQ==
X-Received: by 2002:a37:6c6:: with SMTP id 189mr3715898qkg.478.1617206158592; 
 Wed, 31 Mar 2021 08:55:58 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id o21sm1574173qtp.72.2021.03.31.08.55.57
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 08:55:58 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i144so21691811ybg.1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 08:55:57 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr5658516ybp.476.1617206157416; 
 Wed, 31 Mar 2021 08:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 08:55:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XKr_0Zw+EaChRuyb9K8XZZvzF9CiZt69C6akRhCGFLvQ@mail.gmail.com>
Message-ID: <CAD=FV=XKr_0Zw+EaChRuyb9K8XZZvzF9CiZt69C6akRhCGFLvQ@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: fix warn stack reported
 during dpu resume
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Hung-yu Wu <hywu@google.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@google.com>, Rob Clark <robdclark@gmail.com>,
 Michelle Dean <midean@google.com>, Steev Klimaszewski <steev@kali.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 4:27 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> @@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>         struct icc_path *path1;
>         struct drm_device *dev = dpu_kms->dev;
>
> +       if (!dpu_supports_bw_scaling(dev))
> +               return 0;
> +
>         path0 = of_icc_get(dev->dev, "mdp0-mem");
>         path1 = of_icc_get(dev->dev, "mdp1-mem");
>

Instead of hard coding a check for specific SoC compatible strings,
why not just check to see if path0 and/or path1 are ERR_PTR(-ENODEV)?
Then change dpu_supports_bw_scaling() to just return:

!IS_ERR(dpu_kms->path[0])

It also seems like it would be nice if you did something if you got an
error other than -ENODEV. Right now this function returns it but the
caller ignores it? At least spit an error message out?


> @@ -154,6 +154,15 @@ struct vsync_info {
>
>  #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
>
> +/**
> + * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
> + * @dev: Pointer to drm_device structure
> + */
> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
> +{
> +       return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");

See above, but I think this would be better as:

  return !IS_ERR(dpu_kms->path[0]);

Specifically, I don't think of_device_is_compatible() is really
designed as something to call a lot. It's doing a whole bunch of data
structure parsing / string comparisons. It's OK-ish during probe
(though better to use the of_match_table), but you don't want to call
it on every runtime suspend / runtime resume.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
