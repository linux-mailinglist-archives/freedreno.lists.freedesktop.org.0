Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424C4C03AB
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 22:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A686310E737;
	Tue, 22 Feb 2022 21:19:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2910E73B
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 21:19:51 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so10383969oot.11
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PZXGdH7QOkFGdyZL9vslSSuJH2T6cBvsFBVFd42Xdko=;
 b=RwQ1qfHBX5YIxEy+KPyWxkJlAkJ/VTS081sLpYhZ0tAeKOngBOgBWhMOaTMHHoekQ5
 seKF/z0Zlz2Lmun8lOKI8aBPHiQZHtZ9LDVAQTPhoRLdCa/L+35K1WP4BjQa1fRMMs0l
 CQ8EwktT9W/rqR0ixUMXRnp8SEpUEob+vtQLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PZXGdH7QOkFGdyZL9vslSSuJH2T6cBvsFBVFd42Xdko=;
 b=qTEHnWfTraAoiat1QlS5oNo8MpYQkpsIWlWgL3G0fxbUHr9EQFO00dDS1Z5trq5Bgt
 YfzMpo5sbLhyJIIiO6GRGcIkIlJloOWtz1VRzsqcuchze/dcOkBMYP8uDUMfOD/riRDI
 KZdjKNY6DWfVr1Pd5LsmUa41eRrWm+hnW3WNC11655JjLjxntKOKMRZwFYGRnLluYr9/
 RfsalMjybT+iparj3WkYkZ1Jyth91UCk9APZv8ZWFhfNl0Sh5CS2HlP0bI+RPEUP6oi4
 wZI5Y5sRxaycAYd/3Y9Hufpl9oCnAcPeVmZSDYTq9zfg8ZFZ2j2u4VyrjZVUIg4ia7dX
 hA1g==
X-Gm-Message-State: AOAM532x9/vl73RGFL35rEtV3Y1ldbuJIpQBFyd6c9iDFuyBQ8yay1vy
 QT9cCbLhthHwmlrfJIlK9vXPvEeHhiWy3rV4O2uI5w==
X-Google-Smtp-Source: ABdhPJy7r6Dp6z5t3lrBYpzhD+7i1xvLB2uoHm7Qkx145lEhXBxvO1W68wKoliw01/Yq59Ok3PUuUtXn3CmG57UGp7U=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr2737701oap.54.1645564791160; Tue, 22
 Feb 2022 13:19:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Feb 2022 21:19:50 +0000
MIME-Version: 1.0
In-Reply-To: <1645455086-9359-3-git-send-email-quic_vpolimer@quicinc.com>
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-3-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Feb 2022 21:19:50 +0000
Message-ID: <CAE-0n53a5akPXSJjkD4SvnparcxBpN2LaGt_7J=6petTPukHeQ@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, agross@kernel.org,
 airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, krzysztof.kozlowski@canonical.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, robh+dt@kernel.org, sam@ravnborg.org, 
 seanpaul@chromium.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/bridge: use atomic
 enable/disable for bridge callbacks
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_vproddut@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-02-21 06:51:24)
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index b32295a..5c7dc82 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -102,30 +136,82 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>                 drm_connector_cleanup(connector);
>  }
>
> -static void panel_bridge_pre_enable(struct drm_bridge *bridge)
> +static void panel_bridge_pre_enable(struct drm_bridge *bridge,
> +               struct drm_bridge_state *old_bridge_state)
>  {
>         struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_encoder *encoder = bridge->encoder;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *old_crtc_state;
> +
> +       crtc = bridge_drm_get_new_connector_crtc(encoder, old_state);
> +       if (!crtc)
> +               return;
> +
> +       old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
> +       if (old_crtc_state && old_crtc_state->self_refresh_active)

Can you please add some comment about why self_refresh_active means we
should bail out from this function? Such a comment would be helpful to
understand the code quickly vs. having to figure out what the intention
of the logic is. The analogix driver has

/* Don't touch the panel if we're coming back from PSR */

so even mentioning PSR here would be helpful.
