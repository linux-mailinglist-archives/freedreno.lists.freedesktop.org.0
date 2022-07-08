Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003256BCDF
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 17:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFE910E087;
	Fri,  8 Jul 2022 15:26:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA6010E3F9
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 15:26:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id va17so1856173ejb.0
 for <freedreno@lists.freedesktop.org>; Fri, 08 Jul 2022 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jgYORBt3h5oNBznarFeGPU7nreEFffTVmMqBLDJdiu4=;
 b=DtmFdPpzZsHOuwOoYohjvI7a3T6485xiQKNorp7om5YF58QOgdZIm+69XDuFDPu6eT
 G0VKI4aJemTOakYgNYfi5goKPkr/OciMNayYQVZC/wYVDtjj4SxaE/DpjQ7w7Sglpy6j
 S9t6UDJqFztUm1k/IXK8WjVFIKnnN4cdaWiLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jgYORBt3h5oNBznarFeGPU7nreEFffTVmMqBLDJdiu4=;
 b=rzhh7mUucsmymmvwfTcTwAwUS7dyVF7IGggSL73rEyjHZQVjMXbqSIx3shmP2EU/xg
 1DwLUKD0jDuAFji5F7tuYTZoCuGxvH2oZ3eZpl0w0X3xCPQhzOeLc1bX2YvOTZMdkLIN
 ifAOKh4G9G/P9HFcoSSoJ9Z6PfSTXdqK1LBN2FAatIYrJW4GbeVwq7M/Nyxusg9+vHxt
 oa1W46EzDQjmNMXvKPlZzEBp7QBXyL6T0P29k59EkCFOo2b1LwP/pJNZJyOkWhDT327+
 e2MK23lKlu/gM5lMgL7C88mMsIHSj++am/QaqJiyI91yYZB7YFi3hGa7TFiCYaw0q0aR
 IcMg==
X-Gm-Message-State: AJIora+UY1xVXAYWI8qBEhXGGxSMQNMTY1alOEXJtVCO8J8Pk0ZolS5d
 yhM4PG9rM3a8pGArm0jDZCewH/AQtWOnzg==
X-Google-Smtp-Source: AGRyM1sYL8g6zMg7eIUIyfE8NnIUQnpGnpdCt/aX9goGSnjq4HC7yCIvo722JSxC8EGXhZBDeoD+5A==
X-Received: by 2002:a17:907:3d92:b0:726:39f9:4a33 with SMTP id
 he18-20020a1709073d9200b0072639f94a33mr4052338ejc.766.1657293959873; 
 Fri, 08 Jul 2022 08:25:59 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0043a422801f8sm12220515edb.87.2022.07.08.08.25.58
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 08:25:58 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id s1so31019311wra.9
 for <freedreno@lists.freedesktop.org>; Fri, 08 Jul 2022 08:25:58 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr3937186wrr.617.1657293957904; Fri, 08
 Jul 2022 08:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220706191442.1150634-1-swboyd@chromium.org>
In-Reply-To: <20220706191442.1150634-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Jul 2022 08:25:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
Message-ID: <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Set the panel orientation in drm when the panel is directly connected,
> i.e. we're not using an external bridge. The external bridge case is
> already handled by the panel bridge code, so we only update the path we
> take when the panel is directly connected/internal. This silences a
> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> to set orientation from panel") which is in drm-misc
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
>  1 file changed, 2 insertions(+)

I don't personally have objections to this, but (to my understanding)
"the future" is that everyone should use panel_bridge. If we made the
move to panel_bridge today then we wouldn't need to do this. In
general I think panel_bridge would end up letting us delete a bunch of
code...

See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
panel-bridge") for when this was done by ti-sn65dsi86.

Then again, I spent a small amount of time looking into this and it's
definitely non-trivial. Still likely worthwhile, but not worth
blocking a tiny fix like this. It also should be fairly obvious that
we should delete this when we switch to panel_bridge.

Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll assume that we'll just snooze this commit until drm-misc-next
merges into a tree that msm-next is based on, which will probably be
the next -rc1. If desired and Acked I could land this in
drm-misc-next, but it's probably not worth it?
