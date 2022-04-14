Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA47501BA4
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 21:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ECB10E10C;
	Thu, 14 Apr 2022 19:16:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA1810E10C
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 19:16:18 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id r18so7294952ljp.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 12:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Bg3pIFeTzT//HbKwWCEHAIkaUbYJ3pWWpwNU7Ml5vAQ=;
 b=WPzP0fe2uMKEvL5ZZcgNNzS6qaoGWJD2VI8g2MX2HQk5rbapaoZU9F+xtpacwy8/HL
 7tbmQoi339fQYqSkQJNhJVziAGuJsadkYu6TpLEG5oWbH/Xj6f9e2/Y3Q79ZW0mbeYZN
 J+Zq3CuUE6Rqab6hXqahDM+2WU8umC4yUzsinJRtKKFDca4joKJ/e6ucn0iAgHN/MsF3
 ffBixIHyk6pikFh0SGx9rgmKd2TOp8wHTfEYelmRylu81qzX0BMolOhItO6lIHWUhnQu
 e806r3asQwOpKnX4/q+0+Nq33O3Ha4uM0hvnwGhWhi0wwOxjzV9hfyaFqLSQY3S6iaXL
 mbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bg3pIFeTzT//HbKwWCEHAIkaUbYJ3pWWpwNU7Ml5vAQ=;
 b=lKiffw5xPLpdFqTpYm3iw2J5BniUG474g9nQfbR/9v3O9CxPmFCX4RXHZSZ94HMg1J
 Pm/voV8ARyM8AjUHgkQEkhUACQkSEIDmnCK+9Tuz1yNvNrwaXyNLrVbTpG6+5vc9Fude
 Ud/36tcXS9nKeeb0LiO3Yf3eWE5UiDQWTiIb6VMqeRFJA5TY4qJdCA9jNM2KPaBt67Fb
 kN0ATQUuf1Sbr712Ud6fKS6CCAwu/avj6O8W/2gZC+6qST8SmJVlh6wAlonqLI0wz9um
 b3LgPWrJXiVGlSRfdokkV7YiEQxwcVhj61Wh3f1FUxrNUDxrE0o4doIA432T+1N3U8R3
 V13g==
X-Gm-Message-State: AOAM530rTEYr2NDVGZ6yNrnYV/piHjy9xiBnK/VRHDSEFT2C2D6Dxq9C
 phxWhKazaWb4jAjP8imIC6LF6g==
X-Google-Smtp-Source: ABdhPJwCcXj/X0oKSCh0WiYxt2A7l/CnbKesBM8o3oPwik74L0XgKrhmwWkXu0JYcSgqzRmerJwzUw==
X-Received: by 2002:a05:651c:2115:b0:24c:8e91:d14d with SMTP id
 a21-20020a05651c211500b0024c8e91d14dmr2513845ljq.165.1649963776067; 
 Thu, 14 Apr 2022 12:16:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a0565123f8500b0045cb9e46b1csm81335lfa.268.2022.04.14.12.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:16:15 -0700 (PDT)
Message-ID: <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
Date: Thu, 14 Apr 2022 22:16:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/04/2022 19:39, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 14, 2022 at 5:20 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
>>
>> @@ -1530,6 +1532,60 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>>          }
>>   }
>>
>> +static int dp_display_get_next_bridge(struct msm_dp *dp)
>> +{
>> +       int rc;
>> +       struct dp_display_private *dp_priv;
>> +       struct device_node *aux_bus;
>> +       struct device *dev;
>> +
>> +       dp_priv = container_of(dp, struct dp_display_private, dp_display);
>> +       dev = &dp_priv->pdev->dev;
>> +       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>> +
>> +       if (aux_bus && dp->is_edp) {
>> +               dp_display_host_init(dp_priv);
>> +               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
>> +               dp_display_host_phy_init(dp_priv);
>> +               enable_irq(dp_priv->irq);
>> +
>> +               rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
>> +               of_node_put(aux_bus);
>> +               if (rc) {
>> +                       disable_irq(dp_priv->irq);
>> +                       dp_display_host_phy_exit(dp_priv);
>> +                       dp_display_host_deinit(dp_priv);
>> +                       return rc;
>> +               }
>> +       } else if (dp->is_edp) {
>> +               DRM_ERROR("eDP aux_bus not found\n");
>> +               return -ENODEV;
>> +       }
>> +
>> +       /*
>> +        * External bridges are mandatory for eDP interfaces: one has to
>> +        * provide at least an eDP panel (which gets wrapped into panel-bridge).
>> +        *
>> +        * For DisplayPort interfaces external bridges are optional, so
>> +        * silently ignore an error if one is not present (-ENODEV).
>> +        */
>> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> 
> This gets into the same problem that Dmitry pointed out that ps8640
> has that's addressed by my recent series [1].  Namely it's not
> guaranteed that the panel will have finished probing by the time
> devm_of_dp_aux_populate_ep_devices() finishes probing. I don't think
> it's going to be really solvable without the bigger rewrite that we've
> been discussing, though. ...it's probably OK to land something like
> what you have here, but it might at least deserve a comment in the
> code?
> 
> [1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org

We agreed that rework would follow up in a timely manner if these 
patches are applied. However a comment would be still a good thing.

> 
> 
>> +       if (rc == -ENODEV) {
>> +               if (dp->is_edp) {
>> +                       DRM_ERROR("eDP: next bridge is not present\n");
>> +                       return rc;
>> +               }
>> +       } else if (rc) {
>> +               if (rc != -EPROBE_DEFER)
>> +                       DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
>> +               return rc;
> 
> In both of your two error returns here isn't it a problem that you don't do:
> 
>    disable_irq(dp_priv->irq);
>    dp_display_host_phy_exit(dp_priv);
>    dp_display_host_deinit(dp_priv);
> 
> Should probably at least fix that clear error before landing, unless
> I'm misunderstanding and there's some reason not to do that?
> 
> 
> As discussed previously, I'm not convinced that we've covered every
> corner case for properly doing and undoing the above things. I'm
> hoping that once we do the cleanup and move to pm_runtime() management
> that it will be cleaned up?
> 
> 
>> @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>>          bridge->funcs = &dp_bridge_ops;
>>          bridge->type = dp_display->connector_type;
>>
>> -       bridge->ops =
>> -               DRM_BRIDGE_OP_DETECT |
>> -               DRM_BRIDGE_OP_HPD |
>> -               DRM_BRIDGE_OP_MODES;
>> +       if (!dp_display->is_edp) {
>> +               bridge->ops =
>> +                       DRM_BRIDGE_OP_DETECT |
>> +                       DRM_BRIDGE_OP_HPD |
>> +                       DRM_BRIDGE_OP_MODES;
> 
> Given that Dmitry had questions about why eDP has different ops in his
> previous review of this code, the above probably deserves an inline
> code comment. If you want to use my wording, you could paste this into
> your code:
> 
>    /*
>     * Many ops only make sense for DP. Why?
>     * - Detect/HPD are used by DRM to know if a display is _physically_
>     *   there, not whether the display is powered on / finished initting.
>     *   On eDP we assume the display is always there because you can't
>     *   know until power is applied. If we don't implement the ops DRM will
>     *   assume our display is always there.
>     * - Currently eDP mode reading is driven by the panel driver. This
>     *   allows the panel driver to properly power itself on to read the
>     *   modes.
>     */

I think it's too verbose and a bit incorrect.
This is a bit saner:
/*
  * These ops do not make sense for eDP, since they are provided
  * by the panel-bridge corresponding to the attached eDP panel.
  */

My question was whether we really need to disable them for eDP since for 
eDP the detect and and get_modes will be overridden anyway.

> Overall: as discussed, I think that the current implementation is a
> bit fragile and might have some wrong corner cases since it's hard for
> me to reason about exactly when we init/de-init things. Even if it
> works great, the fact that it's hard to reason about isn't wonderful.
> That being said, I honestly believe that would benefit upstream to get
> this landed and iterate on it. I don't think this should be causing
> any existing behavior to be _worse_ and getting it landed upstream
> will keep more people focused on the same codebase.
> 
> 
> -Doug


-- 
With best wishes
Dmitry
