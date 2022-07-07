Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFDD56AD5A
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B55910F563;
	Thu,  7 Jul 2022 21:21:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B514B10F577
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:21:21 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id j193so3014496oih.0
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XuQp9w2Vs1aOFFH2QgkEWHPslvL9Ld8qwnD4BupNY0w=;
 b=SXzFCD6PiakxSAJDlRX45oXMcaTKoAYue/mlyleZo0TLGj9D1x5FZiOFOc1bW5MMxm
 zMeQR1uETxWfCgYwRwvbM/aZQlHNFz3jwfNhmuBK0Tl46qx6avBJt0Vj5QJf9fSg63nT
 Laq+DqlvwhqfjZOD9GmtHldsC/NJuFdb8LnFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XuQp9w2Vs1aOFFH2QgkEWHPslvL9Ld8qwnD4BupNY0w=;
 b=x2Nsn4TxTCfgUEccOqs82QKIU/cpAJnkdwFS6qXosptrhixuZUo0TJbq30GSnget4L
 HlRfkc5qVm0nkVfQJYL5SQ0ofaboWh/hQFL+vH8VkkrjabHmI4FFH9wCc3ELHsGR2Q4X
 9UDRJISCUdAKLm9ioccwUsT2y6M2Ef39PRjUV5spGmfieEMqOdxGpCS715RkHkztaq2L
 AB2zHw4UMS7l9z/fsNHbJQaMd39sZBpfALHE17XFUst2n/8s44wo1ozGG6m6Q/zBLHY9
 ykxiWS/aKWbW+u1XReCAJdZ6HZlagEp1PJlWS3XVgWmzZWlG90iFrGzgBhsFXuKjdUYN
 xHLg==
X-Gm-Message-State: AJIora98Av8LP50j8myQTe+Omi0G5G6g5F5EyIJ554wkU2bKadjC9NLT
 hOe0i5f5Bq82LqCAmVIzYzA6L7Dwatd3HG+7y9G9+Q==
X-Google-Smtp-Source: AGRyM1u86hlfujAKJCwkQGNNNhGQ5OK4EZsg7vgXL8Rcuq1ObSFJPCM5Km3thPxlp2kWX7YX6S9fOpbX+fbPsKGN5IA=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr4885oib.63.1657228880881; Thu, 07 Jul
 2022 14:21:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 14:21:20 -0700
MIME-Version: 1.0
In-Reply-To: <40b6a28c-0237-55d7-2f5d-1c571f27e7d6@quicinc.com>
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <40b6a28c-0237-55d7-2f5d-1c571f27e7d6@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 14:21:20 -0700
Message-ID: <CAE-0n51KOMLP4XJHw2CPNikzfhY0xdjeCScYwvCZ7gAYJM+8Fw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>
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
Cc: Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-07-07 14:11:08)
>
>
> On 7/6/2022 12:14 PM, Stephen Boyd wrote:
> > Set the panel orientation in drm when the panel is directly connected,
> > i.e. we're not using an external bridge. The external bridge case is
> > already handled by the panel bridge code, so we only update the path we
> > take when the panel is directly connected/internal. This silences a
> > warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> >
> > Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >
> > This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> > to set orientation from panel") which is in drm-misc
> >
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index cb84d185d73a..9333f7095acd 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -268,6 +268,8 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
> >               return PTR_ERR(panel);
> >       }
> >
> > +     drm_connector_set_orientation_from_panel(conn, panel);
> > +
>
> This should be moved below the !panel check since you are passing panel
> as one of the params.

drm_connector_set_orientation_from_panel() checks for a NULL panel
pointer and sets to UNKNOWN. If I moved this below the !panel check then
I'd have to split that condition for !IS_BONDED_DSI() which was more
diff.

>
> I looked up the doc and it says that for unknown(default cases) this is
> a no-op so I think this change is fine otherwise.
>
> "It is allowed to call this function with a panel_orientation of
> DRM_MODE_PANEL_ORIENTATION_UNKNOWN, in which case it is a no-op."

Ok, so you're fine with this patch?

>
>
> >       if (!panel || !IS_BONDED_DSI())
> >               goto out;
> >
> >
> > base-commit: 15b9ca1641f0c3cd74885280331e9172c62a125e
