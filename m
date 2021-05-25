Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C3339078C
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 19:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076E6EA8B;
	Tue, 25 May 2021 17:26:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E6F6EA8B
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 17:26:12 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so18770045oty.7
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6v3/K1Horl9SzTXgWoFkj2TvOradDTOxmu9THwCEwjc=;
 b=C1XEb01J2q5ACqxInSKk5etkR6HPE/kt5stCFZ0XupxgQtbXQn8AB/H2pOcgPxn/3E
 HS5Z548DsRJPPDFfpt3VFCFch9BYB4EtQU1i5osTAshhMc4EcKlEqRoRQ7+68wmukGVK
 UgFdUKAMBpoMvSE/nORWhzuAvj5gCz9SoKtZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6v3/K1Horl9SzTXgWoFkj2TvOradDTOxmu9THwCEwjc=;
 b=WVWPvRTJW8AiBTaga9SIegxXFGpLY22Q977tinTqXbpXMxnDCJjkILoXSpyqresMA1
 9QxuCvApNemQNvjhk2i98QGmE2JvRxv0B7/j1/ZCoi3htLtD9sW5DCU+zPzwhkddqkG2
 zrElbt303vbX5kjLMHRelkMr1ekFd0V0yVfAntq3HF3pBOY0xQUMhtGm4XkOYeg6GqaM
 g1+YfV8iA+eEt6yiYVm5vtkUQigiN6J2AE0ow44vChZs2auxTqId6Ix+PzrpLCD9HuqG
 6vcGnHjPFv9d6OMkWQ13pfCmUH3t36ixpXh3gxAzxq7zUEZZpNDJ+EzZpwQdY85MWSFz
 Jvqg==
X-Gm-Message-State: AOAM532BsOP3JfkxGOtlcFB6bPN+k0KRJl25t/xdNaV8xPmcG75YYbVj
 UiasPd1rq5pukprflcJrS5/m1Kv5Dq4mJQ==
X-Google-Smtp-Source: ABdhPJz49etEB0JeBdKqM66dPtVZPykL/Ow5vaqzckY0Dnk7gSKo3lsF+8jTJiOp8hffZsB/piyU8g==
X-Received: by 2002:a9d:dc2:: with SMTP id 60mr23312210ots.160.1621963571584; 
 Tue, 25 May 2021 10:26:11 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id n11sm3454255otf.26.2021.05.25.10.26.11
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:26:11 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id
 n3-20020a9d74030000b029035e65d0a0b8so7944654otk.9
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 10:26:11 -0700 (PDT)
X-Received: by 2002:a25:dcc:: with SMTP id 195mr15421822ybn.343.1621963108523; 
 Tue, 25 May 2021 10:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 May 2021 10:18:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzQ0Oc=e3kmNeBZUA+P1soKhBk8zt7bG1gqJ-Do-Tq_w@mail.gmail.com>
Message-ID: <CAD=FV=WzQ0Oc=e3kmNeBZUA+P1soKhBk8zt7bG1gqJ-Do-Tq_w@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v4 1/4] drm/panel-simple: Add basic DPCD backlight
 support
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
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 mkrishn@codeaurora.org, Lyude Paul <lyude@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> @@ -171,6 +172,19 @@ struct panel_desc {
>
>         /** @connector_type: LVDS, eDP, DSI, DPI, etc. */
>         int connector_type;
> +
> +       /**
> +        * @uses_dpcd_backlight: Panel supports eDP dpcd backlight control.
> +        *
> +        * Set true, if the panel supports backlight control over eDP AUX channel
> +        * using DPCD registers as per VESA's standard.
> +        */
> +       bool uses_dpcd_backlight;
> +};
> +
> +struct edp_backlight {
> +       struct backlight_device *dev;

Can you pick a name other than "dev". In my mind "dev" means you've
got a "struct device" or a "struct device *".


> +       struct drm_edp_backlight_info info;
>  };
>
>  struct panel_simple {
> @@ -194,6 +208,8 @@ struct panel_simple {
>
>         struct edid *edid;
>
> +       struct edp_backlight *edp_bl;
> +

I don't think you need to add this pointer. See below for details, but
basically the backlight device should be in base.backlight. Any code
that needs the containing structure can use the standard
"container_of" syntax.


>         struct drm_display_mode override_mode;
>
>         enum drm_panel_orientation orientation;
> @@ -330,10 +346,14 @@ static void panel_simple_wait(ktime_t start_ktime, unsigned int min_ms)
>  static int panel_simple_disable(struct drm_panel *panel)
>  {
>         struct panel_simple *p = to_panel_simple(panel);
> +       struct edp_backlight *bl = p->edp_bl;
>
>         if (!p->enabled)
>                 return 0;
>
> +       if (p->desc->uses_dpcd_backlight && bl)
> +               drm_edp_backlight_disable(p->aux, &bl->info);
> +

It feels like this shouldn't be needed. I would have expected that
your backlight should be in 'panel->backlight'. Then
drm_panel_enable() will call backlight_enable() on your backlight
automatically after calling the panel's enable function.


>         if (p->desc->delay.disable)
>                 msleep(p->desc->delay.disable);
>
> @@ -496,6 +516,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  static int panel_simple_enable(struct drm_panel *panel)
>  {
>         struct panel_simple *p = to_panel_simple(panel);
> +       struct edp_backlight *bl = p->edp_bl;
>
>         if (p->enabled)
>                 return 0;
> @@ -505,6 +526,10 @@ static int panel_simple_enable(struct drm_panel *panel)
>
>         panel_simple_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
>
> +       if (p->desc->uses_dpcd_backlight && bl)
> +               drm_edp_backlight_enable(p->aux, &bl->info,
> +                                        bl->dev->props.brightness);
> +

Similar to disable, this shouldn't be needed.


>         p->enabled = true;
>
>         return 0;
> @@ -565,6 +590,59 @@ static const struct drm_panel_funcs panel_simple_funcs = {
>         .get_timings = panel_simple_get_timings,
>  };
>
> +static int edp_backlight_update_status(struct backlight_device *bd)
> +{
> +       struct panel_simple *p = bl_get_data(bd);
> +       struct edp_backlight *bl = p->edp_bl;
> +
> +       if (!p->enabled)
> +               return 0;
> +
> +       return drm_edp_backlight_set_level(p->aux, &bl->info, bd->props.brightness);

I notice that the "nouveau" driver grabs a whole pile of locks around
this. Do we need some of those? I guess perhaps checking "p->enabled"
isn't so valid without holding some of those locks.

Actually, I guess you probably can't look at "p->enabled" anyway if
this gets moved out of panel-simple as I'm suggesting.

...but do you even need something like this check? Shouldn't it be
handled by the fact that drm_panel will handle enabling/disabling the
backlight at the right times?


> +}
> +
> +static const struct backlight_ops edp_backlight_ops = {
> +       .update_status = edp_backlight_update_status,
> +};
> +
> +static int edp_backlight_register(struct device *dev, struct panel_simple *panel)
> +{
> +       struct edp_backlight *bl;
> +       struct backlight_properties props = { 0 };
> +       u16 current_level;
> +       u8 current_mode;
> +       u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +       int ret;
> +
> +       bl = devm_kzalloc(dev, sizeof(*bl), GFP_KERNEL);
> +       if (!bl)
> +               return -ENOMEM;
> +
> +       ret = drm_dp_dpcd_read(panel->aux, DP_EDP_DPCD_REV, edp_dpcd,
> +                              EDP_DISPLAY_CTL_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = drm_edp_backlight_init(panel->aux, &bl->info, 0, edp_dpcd,
> +                                    &current_level, &current_mode);
> +       if (ret < 0)
> +               return ret;
> +
> +       props.type = BACKLIGHT_RAW;
> +       props.brightness = current_level;
> +       props.max_brightness = bl->info.max;
> +
> +       bl->dev = devm_backlight_device_register(dev, "edp_backlight",
> +                                               dev, panel,
> +                                               &edp_backlight_ops, &props);
> +       if (IS_ERR(bl->dev))
> +               return PTR_ERR(bl->dev);
> +
> +       panel->edp_bl = bl;
> +
> +       return 0;
> +}
> +

I expect there to be quite a bit of pushback to putting this directly
into panel-simple. How about if you move edp_backlight_register() into
drm_panel.c, parallel to drm_panel_of_backlight(). Maybe you'd call it
drm_panel_dp_aux_backlight() to make it look symmetric?

If you do that then the amount of code / complexity being added to
"simple" panel is quite small. I think it would just come down to
adding the boolean flag and the patch to probe that you have below.

Actually, now that I think about it, you could maybe even get by
_without_ the boolean flag? I think you could use these rules
(untested!):

1. Call drm_panel_of_backlight() always, just like we do today. If a
backlight was specified in the device tree then we should use it.

2. If no backlight was specified in the device tree then, I believe,
drm_panel_of_backlight() will return with no errors but will have
panel->backlight set to NULL.

3. If there was no backlight specified in the device tree and you have
the DP AUX channel and drm_edp_backlight_supported() then create a DP
AUX backlight.

The one feature that wouldn't be supported by the above would be
"DP_EDP_BACKLIGHT_AUX_PWM_PRODUCT_CAP". Presumably that's fine. If
someone later wants to figure out how to solve that then they can.


>  static struct panel_desc panel_dpi;
>
>  static int panel_dpi_probe(struct device *dev,
> @@ -796,9 +874,24 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>
>         drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
>
> -       err = drm_panel_of_backlight(&panel->base);
> -       if (err)
> -               goto disable_pm_runtime;
> +       if (panel->desc->uses_dpcd_backlight) {
> +               if (!panel->aux) {
> +                       dev_err(dev, "edp backlight needs DP aux\n");
> +                       err = -EINVAL;
> +                       goto disable_pm_runtime;
> +               }
> +
> +               err = edp_backlight_register(dev, panel);
> +               if (err) {
> +                       dev_err(dev, "failed to register edp backlight %d\n", err);
> +                       goto disable_pm_runtime;
> +               }
> +
> +       } else {

nit: get rid of the blank line above the "} else {"


> +               err = drm_panel_of_backlight(&panel->base);
> +               if (err)
> +                       goto disable_pm_runtime;
> +       }

See above where I'm suggesting some different logic. Specifically:
always try the drm_panel_of_backlight() call and then fallback to the
AUX backlight if "panel->base.backlight" is NULL and "panel->aux" is
not NULL.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
