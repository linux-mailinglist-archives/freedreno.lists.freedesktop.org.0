Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF03F8FB2
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 22:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E49B6E8B8;
	Thu, 26 Aug 2021 20:35:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C18B6E8B8
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 20:35:02 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id g9so5395581ioq.11
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 13:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KS5bnFn8Y6gpkFwk4lSN+qMk+pSitVKJiQuPfookyLw=;
 b=T54Mvt1OkOwZKZVC8yB84osFcFFszP3nEEnPGks9V+7ttcd8WE2PBRj6Ot7p1qMdsW
 VSv9mCMx7aofBcB6mNmnGZjZWadQh+ektzlJapxEgZg2Dng9mfsIUQW/K8eCyu+Z58Nf
 zby4pVnJ8OIKewOqb1HUFgKHhglU2C+pPtqcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KS5bnFn8Y6gpkFwk4lSN+qMk+pSitVKJiQuPfookyLw=;
 b=rKPNKLIp1MX9npz42q/ypr49deiJwOtOGfwUL2CEtOUsd1yobbGVE851PcZebRL5qy
 Gl7gAPJZYjpUY0CHVe6kc0kSsd1G8IRGZAchl/O6rXOUC7D4XfeMdJSnPU25bfjunLOu
 e18NwGBVGZgFlyPaROVEGORg+cG9ZVQ+nmiMTM6jq6qPcDMcRKHrpB5KhLqmKttaV3YD
 Crgm9yTC8i9/d9sh0rR4rhXm4NZld6bA+Mh9Ah0Dj5UfuSGbjNxRQD8mK8SRP7DSStYV
 eUEStrbeo4PNbkcdS9fDOWaLQ2xVx98OIr6YPnEJr/8shDrmR4AEQeuKO3CKQiHmM85k
 l/tg==
X-Gm-Message-State: AOAM533ouFMzixADq8W3RPt8NyXKWn2kKYzaXSNjZ/kfC7baFzpaI3Uc
 tu+OD0fEade8VbP4+kLePnZO7rFXCJ+fZQ==
X-Google-Smtp-Source: ABdhPJw3c3h8HbCGSBk4nJWck+dJNvVKmb7amvUj9DfjT4fUA3UoMMca/zqRoXTrD5jFMVe0fKwWAg==
X-Received: by 2002:a05:6638:d85:: with SMTP id l5mr5013675jaj.2.1630010101305; 
 Thu, 26 Aug 2021 13:35:01 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id g13sm2315811ile.68.2021.08.26.13.35.01
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 13:35:01 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id n24so5397305ion.10
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 13:35:01 -0700 (PDT)
X-Received: by 2002:a92:cf4a:: with SMTP id c10mr4099123ilr.269.1630009785168; 
 Thu, 26 Aug 2021 13:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Aug 2021 13:29:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUeV+G30b=YOMrdNbvT8rVkA-iibeB3S36NFwOrxcfiw@mail.gmail.com>
Message-ID: <CAD=FV=VUeV+G30b=YOMrdNbvT8rVkA-iibeB3S36NFwOrxcfiw@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Vara Reddy <varar@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC] drm/msm/dp: Allow attaching a drm_panel
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

Hi,

On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +       struct device_node *np = parser->pdev->dev.of_node;
> +       int rc;
> +
> +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> +       if (rc == -ENODEV)
> +               rc = 0;
> +       else if (rc)
> +               DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
> +
> +       return rc;

So rather than storing the drm_panel, I suggest that you actually wrap
it with a "panel_bridge". Follow the ideas from commit 4e5763f03e10
("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge") and the fix
in commit c7782443a889 ("drm/bridge: ti-sn65dsi86: Avoid creating
multiple connectors").

If you do that then actually a bunch of your patch becomes
unnecessary. You basically just have to attach the "next" bridge in
the right place and you're good, right?

-Doug
