Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D653152A
	for <lists+freedreno@lfdr.de>; Mon, 23 May 2022 19:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861BC10E1FC;
	Mon, 23 May 2022 17:00:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECB610EBC1
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 17:00:58 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id m20so30101302ejj.10
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+yqE1pGHx1x3KKc79e6Yq8sNIx1yXpNzstv/8bzqb5s=;
 b=ZjtsMPgQV6WFMaPsFE5wXrme9HyysqJfDxmCwYeAGbvKIHUWff1Cpyv4vRAIzb2+6g
 CaBM3u9mN7ChwiUoZn0x2jmbmh8Ids9Twb+q9Mx4bev++DIoBHEX+JPi/peV3/cHXpnt
 ki/dDbMZHLrt1JuRTfIjOmj46abGOccIRmJ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yqE1pGHx1x3KKc79e6Yq8sNIx1yXpNzstv/8bzqb5s=;
 b=k5YqJgw9iLyG6whcygIOq/xISKkWcDeZeCcA2YGgWxBw/zrrTclpA2MeP1Zu2ugsUX
 7yYf9naAZp6fSG0kSlgVvsCOazPnrMDYU8RYjSXf9/58lrnm4INxTr+Fx89woA2G/4AR
 AD8gkByD++xb7FqMMLQvtTyfaBHYSmNbmXym5RTcgr0tLLM6Xg4KYnQyoIGTpSLpyWQ8
 RM2IBSVMa9R5Yam3x9G6R4k2iq84D7EXKKYGCoL8tImCJh6a+1zNQ6EESaO4SM+Q29de
 svECghdwup9hGl4fjKBNjdpstHMzbCHWYYMlaC2ZUrZC/bq9gRYm6hshfPc7jpR+obIX
 BkrQ==
X-Gm-Message-State: AOAM532h2fyDMHWEOC5STLrW8YYBl2z8vsMxEejpBm/Cc4roRlhqiVfT
 tecFqdcMk5qpUs3dCmQypG+fnPvVadzDMvUKwyA=
X-Google-Smtp-Source: ABdhPJzZvOXUdQMmbtiF4V2obnF44ciWYYG2RkgAlNJMk6UpLqsYy34/e0SPltg6eQ36+FqRY//4QA==
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id
 ne18-20020a1709077b9200b006db71f1fc20mr19858576ejc.343.1653325256691; 
 Mon, 23 May 2022 10:00:56 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 ck6-20020a170906c44600b006fecd0501b5sm1999235ejb.98.2022.05.23.10.00.53
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 10:00:54 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id f2so22311440wrc.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 10:00:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1c03:b0:20e:5cac:1eb5 with SMTP id
 ba3-20020a0560001c0300b0020e5cac1eb5mr19994642wrb.422.1653325252721; Mon, 23
 May 2022 10:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
In-Reply-To: <20220521091751.opeiqbmc5c2okdq6@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 May 2022 10:00:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
Message-ID: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > This adds a devm managed version of drm_bridge_add(). Like other
> > "devm" function listed in drm_bridge.h, this function takes an
> > explicit "dev" to use for the lifetime management. A few notes:
> > * In general we have a "struct device" for bridges that makes a good
> >   candidate for where the lifetime matches exactly what we want.
> > * The "bridge->dev->dev" device appears to be the encoder
> >   device. That's not the right device to use for lifetime management.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> If we are to introduce more managed helpers, I think it'd be wiser to
> introduce them as DRM-managed, and not device managed.
>
> Otherwise, you'll end up in a weird state when a device has been removed
> but the DRM device is still around.

I'm kinda confused. In this case there is no DRM device for the bridge
and, as per my CL description, "bridge-dev->dev" appears to be the
encoder device. I wasn't personally involved in discussions about it,
but I was under the impression that this was expected / normal. Thus
we can't make this DRM-managed.

-Doug
