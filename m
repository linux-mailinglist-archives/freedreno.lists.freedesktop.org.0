Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B350A3F0
	for <lists+freedreno@lfdr.de>; Thu, 21 Apr 2022 17:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECC010E4A6;
	Thu, 21 Apr 2022 15:23:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8810E4A6
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 15:23:21 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id bv19so10753503ejb.6
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2qYFYu6NyJpi225C8WnZCw8hzgNqZ3b2idUeLWDl6E=;
 b=T72udbyPW1VL0ZRokeN2lVKk3WmrP25bUUbwuR1yQnvwLB9IKLveCQxYQaPiAtb23v
 G2F4yUKDMn/rihEoo3k0eVGpN3867P45pzCTx9T+LCW/SnfTrsvNyCiSIgzbqaZb+xHW
 my2utY+f/CJ/ShNW34MbXTj9YkokSsMPlgEo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2qYFYu6NyJpi225C8WnZCw8hzgNqZ3b2idUeLWDl6E=;
 b=i3gYgNly36s4ufHilsGrHXEz5vFpk+mRFLMJX6NGIPEUScBenfbNP9zmU5r+ZiVWi4
 N+8IBneY2KAfo/Uvf4hkSvG00VGDOpanaGKjf2IIF2r1RkBYeBb3pxeG8wk74+P526Qk
 eeNBWnNxf3rYFXT1QNBhbwnW8vkPUV2zGDr7QRQiVmXmCuICUy/oWdmtr+6Q0pZFQlbx
 G2geFHJjNlQyMzASkre0lJfNt9mw7qZTmK+rjN0iiSrkuTF2DoJlOU1Hd9oc3LJpVU03
 dpSeOdZp6nohYcvVCrsmtWhW4R89+GJU0YR7dSW3WhLt88vUhvM8NjcXfK1sMEpNLoY/
 kN2w==
X-Gm-Message-State: AOAM531xjao2Gq+iih1dhubIjVh7X8ruuX98XjKXP+RONl2HWYnh4hbr
 VKZWtGu00ELdobcMHl3gG7eaA2HZCnIxLP6L
X-Google-Smtp-Source: ABdhPJyXgxcNEYZIpIpU7EACHf3EZUdV+1eiTTVqVeavZ8epYkme8yT9VLlkDaIgK01hqHQb8tfAWQ==
X-Received: by 2002:a17:907:1c14:b0:6e8:ba5e:dbd9 with SMTP id
 nc20-20020a1709071c1400b006e8ba5edbd9mr72217ejc.480.1650554599997; 
 Thu, 21 Apr 2022 08:23:19 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 b11-20020a17090630cb00b006e83fb1e6b1sm7959072ejb.100.2022.04.21.08.23.19
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:23:19 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id b19so7151985wrh.11
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 08:23:19 -0700 (PDT)
X-Received: by 2002:adf:dbc3:0:b0:20a:88bf:6d83 with SMTP id
 e3-20020adfdbc3000000b0020a88bf6d83mr187757wrj.301.1650554598823; Thu, 21 Apr
 2022 08:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Apr 2022 08:23:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
Message-ID: <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 1/4] drm/msm/dp: Add eDP support via
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

On Thu, Apr 21, 2022 at 7:37 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1530,6 +1532,61 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
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

I think a comment was requested above that line saying something like:

/*
 * The code below assumes that the panel will finish probing
 * by the time devm_of_dp_aux_populate_ep_devices() returns.
 * This isn't a great assumption since it will fail if the
 * panel driver is probed asynchronously but is the best we
 * can do without a bigger driver reorganization.
 */


> +               of_node_put(aux_bus);
> +               if (rc)
> +                       goto edp_error;
> +       } else if (dp->is_edp) {
> +               DRM_ERROR("eDP aux_bus not found\n");
> +               rc = -ENODEV;
> +               goto error;

This goto doesn't add much. Just leave the above like it was in v7.
return -ENODEV w/ no goto.


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
> +       if (rc && dp->is_edp) {
> +               DRM_ERROR("eDP: cannot find the next bridge, rc = %d\n", rc);
> +               goto edp_error;
> +       } else if (rc && rc != -ENODEV) {
> +               DRM_ERROR("DP: cannot find the next bridge, rc = %d\n", rc);
> +               goto error;
> +       }

The above wouldn't be my favorite way of doing this. Instead, I would
have written:

  if (rc) {
    DRM_ERROR("Cannot find the next bridge, rc = %d\n", rc);
    goto err;
  }
  ...

err:
  if (dp->is_edp) {
    disable_irq(...);
    dp_display_host_phy_exit(...);
    dp_display_host_deinit(...);
  }
  return rc;

> +
> +       dp->next_bridge = dp_priv->parser->next_bridge;
> +
> +       return 0;
> +
> +edp_error:
> +       disable_irq(dp_priv->irq);
> +       dp_display_host_phy_exit(dp_priv);
> +       dp_display_host_deinit(dp_priv);
> +error:
> +       return rc;
> +}
> +
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder)
>  {

With the above fixes, I'd be happy enough for my Reviewed-by tag with
the expectation that continued work will happen to continue cleaning
this up.


-Doug
