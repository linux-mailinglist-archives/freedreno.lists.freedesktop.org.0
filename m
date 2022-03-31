Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EBA4EE4A5
	for <lists+freedreno@lfdr.de>; Fri,  1 Apr 2022 01:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B02910E31C;
	Thu, 31 Mar 2022 23:23:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D49E10E31C
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 23:23:03 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bi12so2416266ejb.3
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VA4OmUlBn+h032QaRrbwfz0ENP/lgrthHNuo2cDc9zs=;
 b=nYjHIf8uflbZHObYpxif9B5oD9Wtb4t5AI1eCWohJX41q9UAn/abH6xMu9omxNFwsr
 7qUSDGsPXh0wIhNznI1YcZUJupDndJZzHhIHEE8hHppvHxSa6v170I7xv/CDtTfwhCpF
 kzEWwkEZCviEfCOEDQ+sa6YJGh6+XAWttUpDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VA4OmUlBn+h032QaRrbwfz0ENP/lgrthHNuo2cDc9zs=;
 b=2O4RqAJ+CmG9WlJvGvIBZ7UhxB5QH/li2jdEI3xtLG2k4zNP6JGbXaFItRJ/1P/kap
 fgGvj3rc9JrJRaRf2oMKlEH5myLB+buGmBtJEz4u/CsGSpWavYHju2hrdzTQSLaWCk6l
 Rn4UxKpMDwzfRaSkkZ1xs9YyQg1PgSMq85Bz0m9WPfPxYq1kULGu5kxdoLg4IS7pPhrP
 nCeb1a/ZI4Na+C5zZYvCosEDdvz2yvNPX6547h0vNwWLqWTi2sgAcjzMHp5C8rG/Geo1
 0okWaeusF9Z9ObpdzQiVGHf931ePRWOP0gO3geWpshy6JM93by+fmfkoSTFhFfUn3KJ5
 dLBg==
X-Gm-Message-State: AOAM532H/c3WzWCasTx+brClXtsx0tIlxLFjPAF308hYwjlTXcTxnmh1
 CUomYThjDXIw5ZKvUcOnpw3DAcHSz6ebERuG
X-Google-Smtp-Source: ABdhPJx0XNJjJMhwqSFgvPiQ+Xtmvug7Ol4vCaxeK8WQXh9lQt44q0bLrvU58NITfJBI4abXWwFlqw==
X-Received: by 2002:a17:906:d542:b0:6e4:7f59:3a13 with SMTP id
 cr2-20020a170906d54200b006e47f593a13mr6865475ejc.563.1648768981569; 
 Thu, 31 Mar 2022 16:23:01 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 ec21-20020a170906b6d500b006d170a3444csm309911ejb.164.2022.03.31.16.22.58
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:22:59 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id u3so1831200wrg.3
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:22:58 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr5685367wrs.301.1648768978217; Thu, 31
 Mar 2022 16:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-4-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-4-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:22:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_ULva3J-Y7EF+0VPRRoFXSmtuKcXG9H=041Kmwa=W4A@mail.gmail.com>
Message-ID: <CAD=FV=X_ULva3J-Y7EF+0VPRRoFXSmtuKcXG9H=041Kmwa=W4A@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 3/8] drm/msm/dp: Support only IRQ_HPD and
 REPLUG interrupts for eDP
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
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1374,6 +1382,12 @@ static int dp_pm_resume(struct device *dev)
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
>
> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +               dp_catalog_hpd_config_intr(dp->catalog,
> +                               DP_DP_HPD_PLUG_INT_MASK |
> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> +                               true);
> +

nit: why are there two blank lines above?


> @@ -1639,6 +1653,9 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>                 return;
>         }
>
> +       if (dp->connector_type == DRM_MODE_CONNECTOR_eDP)
> +               dp_hpd_plug_handle(dp_display, 0);
> +

Should you add a "pre_enable" and do it there? That would make it more
symmetric with the fact that you have the countertpart in
"post_disable".


Overall: I'm probably not familiar enough with this code to give it a
full review. I'm hoping that Dmitry knows it well enough... ;-)


-Doug
