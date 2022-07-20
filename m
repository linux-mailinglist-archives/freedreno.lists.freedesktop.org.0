Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB23957C02F
	for <lists+freedreno@lfdr.de>; Thu, 21 Jul 2022 00:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960FE14BB96;
	Wed, 20 Jul 2022 22:42:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4878914A694
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jul 2022 22:42:38 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id mf4so111889ejc.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jul 2022 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KuBSeD48AXgXk0Y7RnBVCdR0V4hjzjRzCq3VFtUSmXU=;
 b=hM1UrZ2kalbQlptKuH3fj5NcVp93Bz/8tn9oJq5IQEFtIepQAjgmF2oYEksVjL31KB
 e9LMOlkKA3bfMgkiuGzd1pbAGoeWM1l3rCYMAEyTFiFQbIUVXsUfBgcDxyeIpATWToPj
 DsMiLq1btPhMB8rNiehlMRFMF/tlaDAlKu2qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KuBSeD48AXgXk0Y7RnBVCdR0V4hjzjRzCq3VFtUSmXU=;
 b=Crb3MBNMIBXdnQEBZbRh4kzX8Mts0YvIexpKRiytZ/QtGjGQ6W/WPjAAmbFolxflrz
 XsrdEkx3SZNUhjOns4v01FzZjAogDELUaIZ6LtA9naHHl8HLvifkPzjlJc8quj9Hpr7M
 FrCcazdphCoCMZFqt2ghaRgB5y2yMPmfRhiEgn3tKa21z8wlek79IaxkoH4kU5zjEz14
 1XQ7mAQX78lioZGoALqyGGdZLfyAvtX5I7okzDmdhyLncsHKhYYEruiHlC/QkfaoLiYu
 r/thWkOctyNDDZL9bhRd6rvQkSGmDfRxB6MfcbFZkyWZOumyGxCAsrtaPaJt1zmASKMy
 PKOA==
X-Gm-Message-State: AJIora/kN/YuEdBzPAYxUrrmhpbQ6U1FWO/bIL6mouXc+CmXVXRe7N+g
 qHP8F4NoZytLeXZuf8ewcDgG9XeU2cRkgPVy
X-Google-Smtp-Source: AGRyM1tCZOx0/HcsK46B1cR5OdhAzN9zfJNS0rHmzI9LuCk/w6PXku7EZKJ+UUzSY83VJHc6my2CVQ==
X-Received: by 2002:a17:906:8477:b0:72b:3e65:55c5 with SMTP id
 hx23-20020a170906847700b0072b3e6555c5mr36462244ejc.255.1658356956540; 
 Wed, 20 Jul 2022 15:42:36 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 we10-20020a170907234a00b006fec4ee28d0sm115004ejb.189.2022.07.20.15.42.34
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 15:42:34 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id h8so5338545wrw.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Jul 2022 15:42:34 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr32970096wrn.138.1658356953852; Wed, 20
 Jul 2022 15:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
 <CAF6AEGt_J6f1T+-6KtyCrUJrY2fh7Sz10L1AV1FSe8hueGREtQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt_J6f1T+-6KtyCrUJrY2fh7Sz10L1AV1FSe8hueGREtQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Jul 2022 15:42:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+VWtpTKAoyQpYMFteZy8iYB7-o=ACqkjr7YX7uCxZvg@mail.gmail.com>
Message-ID: <CAD=FV=W+VWtpTKAoyQpYMFteZy8iYB7-o=ACqkjr7YX7uCxZvg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Set panel orientation when
 directly connected
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patches@lists.linux.dev,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 20, 2022 at 1:46 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jul 8, 2022 at 8:25 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Set the panel orientation in drm when the panel is directly connected,
> > > i.e. we're not using an external bridge. The external bridge case is
> > > already handled by the panel bridge code, so we only update the path we
> > > take when the panel is directly connected/internal. This silences a
> > > warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> > >
> > > Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >
> > > This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> > > to set orientation from panel") which is in drm-misc
> > >
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > I don't personally have objections to this, but (to my understanding)
> > "the future" is that everyone should use panel_bridge. If we made the
> > move to panel_bridge today then we wouldn't need to do this. In
> > general I think panel_bridge would end up letting us delete a bunch of
> > code...
> >
> > See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
> > panel-bridge") for when this was done by ti-sn65dsi86.
> >
> > Then again, I spent a small amount of time looking into this and it's
> > definitely non-trivial. Still likely worthwhile, but not worth
> > blocking a tiny fix like this. It also should be fairly obvious that
> > we should delete this when we switch to panel_bridge.
> >
> > Thus:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll assume that we'll just snooze this commit until drm-misc-next
> > merges into a tree that msm-next is based on, which will probably be
> > the next -rc1. If desired and Acked I could land this in
> > drm-misc-next, but it's probably not worth it?
>
> if you want to land this patch via drm-misc, which might be the
> easier/faster route, then:
>
> Acked-by: Rob Clark <robdclark@gmail.com>

As per discussion on IRC, I'm not going to apply this to drm-misc-next.

Given where we are in the cycle landing in drm-misc-next means it
won't be in mainline for a couple versions and I suspect that'll cause
merge conflicts with Dmitry's series [1]. ...and, of course, if
Dmitry's series lands then we don't even need ${SUBJECT} patch...

So I think the plan is:

1. Snooze waiting for the next -rc1 since
drm_connector_set_orientation_from_panel() won't be in mainline until
then.

2. If Dmitry's series looks like a long way off, we could land
${SUBJECT} patch in msm-next as a stopgap fix.


[1] https://lore.kernel.org/r/20220711094320.368062-5-dmitry.baryshkov@linaro.org/

-Doug
