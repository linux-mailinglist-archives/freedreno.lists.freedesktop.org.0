Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D8F5018CC
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 18:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BE810FEC9;
	Thu, 14 Apr 2022 16:39:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024EA10FEC9
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 16:39:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bv19so11143833ejb.6
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/81+PkkPmPe/TTQwrTB+sxyYxn9iTbpRvnVkvTg+pC8=;
 b=B9wDWH42g9YW9AI0Nss9bPg2ke9AcgJPM27MaTf5FcLd2cYA8sez9IWCsZ1KH5qcqa
 Lu+dH/ZYnrkVAhHHkskGQMRfl28OXKQ8/hvdgxC+Gd1N0dqNrZq14l0edVEEzLsBFvGP
 IU9Ox5r96ULPR95h7HSZz6dMttqUaACHn8hkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/81+PkkPmPe/TTQwrTB+sxyYxn9iTbpRvnVkvTg+pC8=;
 b=WHn/MW7/DHSJrsAAf4+C51w9zZmdg2DqR1DQWtp8Ro9ab+Ngc/sMGvbXY6dSjt4N9/
 JB0lU/5YWTsltL4ahiYjJlf94fN0ETo1yMwC6YOG1oUKU16E2kaBTQY5iQ6CRNo5g7zd
 aFiFCNEW3k7vdyCoMntO9H/n5D+2xPcvMPoKs1I7I2KMwYmhk4Rc98Ze8C3JgBK9cmRN
 YpFO+TMD/tLqaK+xOTiNOpvBKQgGKSVgsDH7HpPb7cphIExoKIHGtBslQbv+kbR0xUey
 khs9hOGUsEA2Ej2Ju3K3B0DtBywbtrrMFei/Qey26GDdDwRwieOXumNhxz1DmRPf0UrA
 fURw==
X-Gm-Message-State: AOAM531BowTEiJE1r07Tf5kHRsdqFTeoG55OrsXbQC3AXAcXfxnInbbV
 wdOBFzp7EQYCe2IHZxkAv+HBVuEUmEgmochr
X-Google-Smtp-Source: ABdhPJyxCgfYKyg2dWNLAliFdC+Qsn6DXD7Uo99ej3e0XMc6wkavlwOngiuCVT8JlnKt/YdH30TyYw==
X-Received: by 2002:a17:907:94c1:b0:6e6:f038:9993 with SMTP id
 dn1-20020a17090794c100b006e6f0389993mr3087795ejc.238.1649954377177; 
 Thu, 14 Apr 2022 09:39:37 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 b25-20020a056402139900b0041904036ab1sm1267302edv.5.2022.04.14.09.39.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:39:33 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id p18so6875610wru.5
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:39:31 -0700 (PDT)
X-Received: by 2002:a05:6000:1c15:b0:207:849a:648b with SMTP id
 ba21-20020a0560001c1500b00207849a648bmr2610564wrb.513.1649954370738; Thu, 14
 Apr 2022 09:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 09:39:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
Message-ID: <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 1/4] drm/msm/dp: Add eDP support via
 aux_bus
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
> @@ -1530,6 +1532,60 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>         }
>  }
>
> +static int dp_display_get_next_bridge(struct msm_dp *dp)
> +{
> +       int rc;
> +       struct dp_display_private *dp_priv;
> +       struct device_node *aux_bus;
> +       struct device *dev;
> +
> +       dp_priv = container_of(dp, struct dp_display_private, dp_display);
> +       dev = &dp_priv->pdev->dev;
> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +
> +       if (aux_bus && dp->is_edp) {
> +               dp_display_host_init(dp_priv);
> +               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +               dp_display_host_phy_init(dp_priv);
> +               enable_irq(dp_priv->irq);
> +
> +               rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +               of_node_put(aux_bus);
> +               if (rc) {
> +                       disable_irq(dp_priv->irq);
> +                       dp_display_host_phy_exit(dp_priv);
> +                       dp_display_host_deinit(dp_priv);
> +                       return rc;
> +               }
> +       } else if (dp->is_edp) {
> +               DRM_ERROR("eDP aux_bus not found\n");
> +               return -ENODEV;
> +       }
> +
> +       /*
> +        * External bridges are mandatory for eDP interfaces: one has to
> +        * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +        *
> +        * For DisplayPort interfaces external bridges are optional, so
> +        * silently ignore an error if one is not present (-ENODEV).
> +        */
> +       rc = dp_parser_find_next_bridge(dp_priv->parser);

This gets into the same problem that Dmitry pointed out that ps8640
has that's addressed by my recent series [1].  Namely it's not
guaranteed that the panel will have finished probing by the time
devm_of_dp_aux_populate_ep_devices() finishes probing. I don't think
it's going to be really solvable without the bigger rewrite that we've
been discussing, though. ...it's probably OK to land something like
what you have here, but it might at least deserve a comment in the
code?

[1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org


> +       if (rc == -ENODEV) {
> +               if (dp->is_edp) {
> +                       DRM_ERROR("eDP: next bridge is not present\n");
> +                       return rc;
> +               }
> +       } else if (rc) {
> +               if (rc != -EPROBE_DEFER)
> +                       DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> +               return rc;

In both of your two error returns here isn't it a problem that you don't do:

  disable_irq(dp_priv->irq);
  dp_display_host_phy_exit(dp_priv);
  dp_display_host_deinit(dp_priv);

Should probably at least fix that clear error before landing, unless
I'm misunderstanding and there's some reason not to do that?


As discussed previously, I'm not convinced that we've covered every
corner case for properly doing and undoing the above things. I'm
hoping that once we do the cleanup and move to pm_runtime() management
that it will be cleaned up?


> @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>         bridge->funcs = &dp_bridge_ops;
>         bridge->type = dp_display->connector_type;
>
> -       bridge->ops =
> -               DRM_BRIDGE_OP_DETECT |
> -               DRM_BRIDGE_OP_HPD |
> -               DRM_BRIDGE_OP_MODES;
> +       if (!dp_display->is_edp) {
> +               bridge->ops =
> +                       DRM_BRIDGE_OP_DETECT |
> +                       DRM_BRIDGE_OP_HPD |
> +                       DRM_BRIDGE_OP_MODES;

Given that Dmitry had questions about why eDP has different ops in his
previous review of this code, the above probably deserves an inline
code comment. If you want to use my wording, you could paste this into
your code:

  /*
   * Many ops only make sense for DP. Why?
   * - Detect/HPD are used by DRM to know if a display is _physically_
   *   there, not whether the display is powered on / finished initting.
   *   On eDP we assume the display is always there because you can't
   *   know until power is applied. If we don't implement the ops DRM will
   *   assume our display is always there.
   * - Currently eDP mode reading is driven by the panel driver. This
   *   allows the panel driver to properly power itself on to read the
   *   modes.
   */


Overall: as discussed, I think that the current implementation is a
bit fragile and might have some wrong corner cases since it's hard for
me to reason about exactly when we init/de-init things. Even if it
works great, the fact that it's hard to reason about isn't wonderful.
That being said, I honestly believe that would benefit upstream to get
this landed and iterate on it. I don't think this should be causing
any existing behavior to be _worse_ and getting it landed upstream
will keep more people focused on the same codebase.


-Doug
