Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D984234FD
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 02:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400A86E492;
	Wed,  6 Oct 2021 00:29:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA296EC9A
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 00:29:46 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 o27-20020a9d411b000000b005453f95356cso127202ote.11
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 17:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rJXZL/E2rjizDw2g+xUTHgR6xfpHLrz6baH//WpupIA=;
 b=eILFxHdQkwHM2kDcZ7UcWGBVC7H2Pu2GtoXIw+Mf1tmpqUPjk0FxN9egL2wcdGHjmQ
 +TKV21OleaafcJGX/LlBIYkxSSU6MkgB7ayxOOdJpYOdNbeXmMUXrv6DIdkyfT7ip8yV
 xevbRV4FwvKdg7BuJcnjAihYLxXU3fqbBhPIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rJXZL/E2rjizDw2g+xUTHgR6xfpHLrz6baH//WpupIA=;
 b=r1Zhi9M8Q1EJSotxAPn7Rm8wUpTAtRiZ85KT89t/i3AtWrjjepowK2cDuJOpDJF0jM
 O5oqD/Kp7ErT1YpPzJeDHv2DDKffL8GMTneAMCmSDuHifpK0TuvprfZE318ZV5mT7IUb
 eSIHIvJ3IxMuMeTV8nS5/DMKpVx2gZ3aUHRsLCfkmD8LlaDEZVrjce9cmidXS5VIHvxb
 AdBbVyqtQcq9pYhPQwbfGGwcMexAMJDArIwFt8reVGHWg7t3j0WHHT2lFmDvixtEDf2J
 BAircNhgtWjJVRrSOWMgdKyHfSq11nDcaaOTDV2u0p5fK5+6W1X7rtt87VJvEUeif1fV
 Ra0Q==
X-Gm-Message-State: AOAM530FBze4x8owfs4GG9ab1f9YF2cwH4ARfulXYAYFdD9Dfmltl18V
 gY3/H2mhG7y6pNMgDKPsREBRdw0vSxFaeFtQ84I8FA==
X-Google-Smtp-Source: ABdhPJxzCxjnxno+e1ko51qFrcaIW6A2GioGxAa2xz6r8QTE5XFA3HZvXeCGDv6WRirQFECvcUk6zhmJwJvvexsKQPo=
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr16724345ote.77.1633480185918; 
 Tue, 05 Oct 2021 17:29:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:29:45 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:29:45 -0700
Message-ID: <CAE-0n53bGyVSBC9zsFu9Uacp+t=56vrttq+fWj155zA_LXJbuw@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 3/7] drm/msm/dp: Allow specifying
 connector_type per controller
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-10-05 16:13:19)
> As the following patches introduced support for multiple DP blocks in a
> platform and some of those block might be eDP it becomes useful to be
> able to specify the connector type per block.
>
> Although there's only a single block at this point, the array of descs
> and the search in dp_display_get_desc() are introduced here to simplify
> the next patch, that does introduce support for multiple DP blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - New patch
> - Extended msm_dp_config with connector_type, wrapped in inner struct
> - Refactored out of the next patch
> - Pass the connector_type to drm_connector_init(), from yet another patch
> - Dropped double newline and unnecessary {}

BTW, I see that we check for the connector type in debugfs.

$ git grep DRM_MODE_CONNECTOR_DisplayPort -- drivers/gpu/drm/msm/dp/
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)
drivers/gpu/drm/msm/dp/dp_debug.c:
DRM_MODE_CONNECTOR_DisplayPort)

So do those need to be updated to handle either connector type?
