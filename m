Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF33996A5
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 02:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710C96EEA3;
	Thu,  3 Jun 2021 00:05:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2376EEA4
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 00:05:21 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id q10so4306347qkc.5
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 17:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/S09SjWkbFDCEaJs+p92hKplyZX7wJr8pT0fXmAavLU=;
 b=M9UiPZp7z27WpewzmJpqzUxEphr7Hh3R7nkxwCntEL95T/9SH+uqkQrAzeIl9+TXSq
 5DCP3ouiaYNxK58m3THItcbNOB1I1ZNR3mtUEfESoIQntmI9VHv5DPAsdgI4+2Xu314z
 EwQjVuhSKB1/odasvdcpz4E+a277SB3T1Vhr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/S09SjWkbFDCEaJs+p92hKplyZX7wJr8pT0fXmAavLU=;
 b=iNst7HO3+leNOxhc/tVzw7RqxiwefXD6rNSKHEmVUxq9qG/thfjKK8bTQ2pn1GaoAZ
 D4nB4eczYpWg6fqc1jFG8+lUaCs2INrJadx2JAgZ8dxDF2jvUexP/HUD66OjxjS3cMEn
 nPA61qiDHfc9iQXweTTg+SZ5xONTsyxc9v9pGx+eOSlHPceukGix0LDpoMs+ui0c6y7g
 sgqz2KVIztQxfcVtabGmd5tvuBL3KMb7JpeFX+XDCc+NvQhKV9KFAvcloIEXUYIGbrjt
 4hS8WrUETHX5T8fjJdYlDJfmXrgI4u2ffVroCFbPLVnE06PLisQigE/qqfylSy+T4/Ss
 XCEQ==
X-Gm-Message-State: AOAM530mJsDlxamWe+gRxjjOknneZhvMOddJPtQILbs2cDvJxWa0Y0NF
 O9nkUYTRAJdqZqgh0kebRNGownTwSMYkUQ==
X-Google-Smtp-Source: ABdhPJwWwZACU3fNK4k3TM7mhf/xTzD7l5lu4g5FN/D0jb++M99oNen0KPgI6JmdgSy/UdJoa2xdlg==
X-Received: by 2002:a37:b082:: with SMTP id
 z124mr30187017qke.446.1622678720606; 
 Wed, 02 Jun 2021 17:05:20 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id o10sm898034qki.72.2021.06.02.17.05.19
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 17:05:19 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id x6so6270455ybl.9
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 17:05:19 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr50138961ybm.345.1622678718994; 
 Wed, 02 Jun 2021 17:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-2-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1622390172-31368-2-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Jun 2021 17:05:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMVKP=nK+-eTpxNK-AQ66rqvfMj_Q0TZrsG-CEWtbw8Q@mail.gmail.com>
Message-ID: <CAD=FV=XMVKP=nK+-eTpxNK-AQ66rqvfMj_Q0TZrsG-CEWtbw8Q@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v5 1/5] drm/panel: add basic DP AUX backlight
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> +static int dp_aux_backlight_update_status(struct backlight_device *bd)
> +{
> +       struct dp_aux_backlight *bl = bl_get_data(bd);
> +       u16 brightness = backlight_get_brightness(bd);
> +       int ret = 0;
> +
> +       if (brightness > 0) {
> +               if (!bl->enabled) {
> +                       drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
> +                       bl->enabled = true;
> +                       return 0;
> +               }
> +               ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
> +       } else {
> +               if (bl->enabled) {
> +                       drm_edp_backlight_disable(bl->aux, &bl->info);
> +                       bl->enabled = false;
> +               }
> +       }

I was trying to figure out if there are any races / locking problems /
problems trying to tweak the backlight when the panel is off. I don't
_think_ there are. Specifically:

1. Before turning the panel off, drm_panel will call
backlight_disable(). That will set BL_CORE_FBBLANK which is not set by
any other calls. Then it will call your
dp_aux_backlight_update_status().

2. Once BL_CORE_FBBLANK is set then backlight_get_brightness() will
always return 0.

This means that a transition from 0 -> non-zero (and enable) will
always only happen when the panel is on, which is good. It also means
that we'll always transition to 0 (disable the backlight) when the
panel turns off.

In terms of other races, it looks like the AUX transfer code handles
grabbing a mutex around transfers so we should be safe there.

So I guess the above is just a long-winded way of saying that this
looks right to me. :-)

BTW: we should probably make sure that the full set of people
identified by `./scripts/get_maintainer.pl -f
./drivers/video/backlight` are CCed on your series. I see Daniel
already and I've added the rest.


> +/**
> + * drm_panel_dp_aux_backlight - create and use DP AUX backlight
> + * @panel: DRM panel
> + * @aux: The DP AUX channel to use
> + *
> + * Use this function to create and handle backlight if your panel
> + * supports backlight control over DP AUX channel using DPCD
> + * registers as per VESA's standard backlight control interface.
> + *
> + * When the panel is enabled backlight will be enabled after a
> + * successful call to &drm_panel_funcs.enable()
> + *
> + * When the panel is disabled backlight will be disabled before the
> + * call to &drm_panel_funcs.disable().
> + *
> + * A typical implementation for a panel driver supporting backlight
> + * control over DP AUX will call this function at probe time.
> + * Backlight will then be handled transparently without requiring
> + * any intervention from the driver.
> + *
> + * drm_panel_dp_aux_backlight() must be called after the call to drm_panel_init().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
> +{
> +       struct dp_aux_backlight *bl;
> +       struct backlight_properties props = { 0 };
> +       u16 current_level;
> +       u8 current_mode;
> +       u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +       int ret;
> +
> +       if (!panel || !panel->dev || !aux)
> +               return -EINVAL;
> +
> +       bl = devm_kzalloc(panel->dev, sizeof(*bl), GFP_KERNEL);
> +       if (!bl)
> +               return -ENOMEM;
> +
> +       bl->aux = aux;
> +
> +       ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> +                              EDP_DISPLAY_CTL_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!drm_edp_backlight_supported(edp_dpcd)) {
> +               DRM_DEV_INFO(panel->dev, "DP AUX backlight is not supported\n");
> +               return 0;
> +       }

nit: move this part up above the memory allocation. There's no reason
to allocate memory for "bl" if the backlight isn't supported.


> @@ -64,8 +65,8 @@ enum drm_panel_orientation;
>   * the panel. This is the job of the .unprepare() function.
>   *
>   * Backlight can be handled automatically if configured using
> - * drm_panel_of_backlight(). Then the driver does not need to implement the
> - * functionality to enable/disable backlight.
> + * drm_panel_of_backlight() or drm_panel_dp_aux_backlight(). Then the driver
> + * does not need to implement the functionality to enable/disable backlight.
>   */
>  struct drm_panel_funcs {
>         /**
> @@ -144,8 +145,8 @@ struct drm_panel {
>          * Backlight device, used to turn on backlight after the call
>          * to enable(), and to turn off backlight before the call to
>          * disable().
> -        * backlight is set by drm_panel_of_backlight() and drivers
> -        * shall not assign it.
> +        * backlight is set by drm_panel_of_backlight()/drm_panel_dp_aux_backlight()
> +        * and drivers shall not assign it.

Slight nit that I would have wrapped the drm_panel_dp_aux_backlight()
to the next line just to avoid one really long line followed by a
short one.

Other than the two nits (ordering of memory allocation and word
wrapping in a comment), this looks good to me. Feel free to add my
Reviewed-by tag when you fix the nits.

NOTE: Even though I have commit access to drm-misc now, I wouldn't
feel comfortable merging this to drm-misc myself without review
feedback from someone more senior. Obviously we're still blocked on my
and Lyude's series landing first, but even assuming those just land
as-is we'll need some more adult supervision before this can land. ;-)
That being said, I personally think this looks pretty nice now.


-Doug



>          */
>         struct backlight_device *backlight;
>
> @@ -208,11 +209,17 @@ static inline int of_drm_get_panel_orientation(const struct device_node *np,
>  #if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
>         (IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
>  int drm_panel_of_backlight(struct drm_panel *panel);
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux);
>  #else
>  static inline int drm_panel_of_backlight(struct drm_panel *panel)
>  {
>         return 0;
>  }
> +static inline int drm_panel_dp_aux_backlight(struct drm_panel *panel,
> +                                            struct drm_dp_aux *aux)
> +{
> +       return 0;
> +}
>  #endif
>
>  #endif
> --
> 2.7.4
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
