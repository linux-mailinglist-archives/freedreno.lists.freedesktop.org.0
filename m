Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04461501909
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 18:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B908910E01F;
	Thu, 14 Apr 2022 16:48:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C0210E01F
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 16:48:12 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bv19so11185368ejb.6
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uNCknelIIQ0A0jhcGpNkNt/itvQulq3csLsSq+jMi4k=;
 b=OFD1FNp9YuGu2v7rR5vIDLHqSlz5x0ooKxLOUUFLXVcVscIABJa9XczVMvEG6Hdpic
 QEwuykdd5CFYaIM4fwYl2u3dNKd7uLY+YmmM3txQhfvMJ2+kl0ds92uwsXIkXH97bUKc
 WjRgnLpsfAzXQuHotizBIDeTEdVOmrYFEECKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uNCknelIIQ0A0jhcGpNkNt/itvQulq3csLsSq+jMi4k=;
 b=cYGNYOPDtwcttAvdrpCseaTNnsDFeT26NHD5mc6ZaUdBkscqEuiLDgZ5cXegdO6zCl
 FuH4S6nma9U3oIyDkL7EI7ol6urtTroOwtLknrLm0U9UBuUE4ObyMh6m/h3foE4HRjBM
 tE2eZHxOWocJS0aiRitu4AxX8QMqzBqPW542+7ckN4LJYzRT073Vxixt4Tf07hrIowYA
 8XfoAR+Y95FzJEPj05MpTfq+vfZQ/dWknJjc5fSt0fRnwsdbaq4qN5oYJK7zixlIF2Vz
 VP9t7eS0MpZz18Y0HHxe/pY4dVooGVsPmMvbHlwE6EzrKyiSZp6IFueDd9R0I7Cq9a2v
 6sBw==
X-Gm-Message-State: AOAM530PFRTEZt/Tc8blDmSBBwaBfpjJNyhzPh7NhSOrtCztEeKxj30X
 y3Dt+DQ/LBoZMPDvpxR7CuUpElmlsFHZIVaC7BI=
X-Google-Smtp-Source: ABdhPJyB+pI505mzKPfkGKLCM3zuZD/S82XzLqBInQp4i5IIM1VBIVyN/c/DEloa2uSSC1VCDdZB7A==
X-Received: by 2002:a17:907:1b15:b0:6d7:13bd:dd62 with SMTP id
 mp21-20020a1709071b1500b006d713bddd62mr2994670ejc.673.1649954890948; 
 Thu, 14 Apr 2022 09:48:10 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 sa23-20020a1709076d1700b006e89f401d7esm759106ejc.206.2022.04.14.09.48.10
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:48:10 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id t11so11119913eju.13
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:48:10 -0700 (PDT)
X-Received: by 2002:adf:c14d:0:b0:207:a28f:f5dd with SMTP id
 w13-20020adfc14d000000b00207a28ff5ddmr2647776wre.679.1649954418519; Thu, 14
 Apr 2022 09:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-5-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:40:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xrsnk0PYENn5Een1xdUc9B1DKy8jvd1itKbFkvHAivMg@mail.gmail.com>
Message-ID: <CAD=FV=Xrsnk0PYENn5Een1xdUc9B1DKy8jvd1itKbFkvHAivMg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 4/4] Support the eDP modes given by panel
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The eDP controller does not have a reliable way keep panel
> powered on to read the sink capabilities. So, the controller
> driver cannot validate if a mode can be supported by the
> source. We will rely on the panel driver to populate only
> the supported modes for now.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c7277f0..0f18a16 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -998,6 +998,14 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>                 return -EINVAL;
>         }
>
> +       /*
> +        * The eDP controller currently does not have a reliable way of
> +        * enabling panel power to read sink capabilities. So, we rely
> +        * on the panel driver to populate only supported modes for now.
> +        */
> +       if (dp->is_edp)
> +               return MODE_OK;

As discussed out-of-band, I agree that this is the right thing for now
and making this assumption won't break anything. In general the set of
eDP panels is known ahead of time it's fairly unlikely someone would
set things up so that a panel couldn't use the mode it was reporting.

Longer term we should figure out a way to solve this but it doesn't
have to be today. To properly implement mode_valid() we've got to
combine knowledge from the panel (mostly rates supported and number of
lanes supported) with the controller (rates supported, number of lanes
supported/hooked up on this board).

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
