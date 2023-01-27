Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08167F123
	for <lists+freedreno@lfdr.de>; Fri, 27 Jan 2023 23:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B826410E1CA;
	Fri, 27 Jan 2023 22:33:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13D610E1CA
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jan 2023 22:33:41 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hw16so17374329ejc.10
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jan 2023 14:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k39JeK/tscCaD3C4RfVccw1Sb99iqo7z63JWfOxSkO8=;
 b=Hn51vOoNAYMxN20PcAOTJvAHrRl6aErdpjByOew2DwRFzAQelDC21fDB6fc2el0ipV
 j4LoW6+1f7TRiaSO9uCPteScT1J0C6AxA/ubE5Tg/ChVzrIywP+20qvQQz7zPNXRK7WR
 0s7qd/QSYN5cVxgartOkILpfQJXW3KjorF0jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k39JeK/tscCaD3C4RfVccw1Sb99iqo7z63JWfOxSkO8=;
 b=UTwfWf+47rKVlogZyRBq36Zq5Xv2kmmsOQRmUpTaR/S8xCiEWD9UayyWwmMD7SyIpg
 0sUEcMesSOkO+11DHdoQMwxVUg7vsPF5ejb2IkO2aLq/Fv3+qWXfeazxc+6AplKJ5R7T
 hmVObQgLdx0aqiD5655+IM17wlxgastzaDJO/lcLwprhnQrcJOZT9Z/O8xkmspzMgDee
 MnHEEwR/+IVyh2uUk5nhSlGhfWX+7kJCTu1Ezokd1DQwyFwIPuioGxUIM1su9eJAIP7F
 d9GynM0lHrowNNPiyLk0fbni2wRaICKugQGXAvZey5IBSHgfwPR+pkvyndO9OMQCovYH
 LT9Q==
X-Gm-Message-State: AFqh2krDgffTfkxpm4VvEkI4aS34pmYWlwqzMJ9Gxucpk45CaNzXYI/g
 qi6TnnOAPgbJ+tP9Rrj54ov0EaOgUbKN7kPoAv4=
X-Google-Smtp-Source: AMrXdXuylTatAQYk95tdT2Xcd73FnRtlEg1PcjNto09+niyTCaBxz9sugtJVRvAtkNJN2bs4EzMG/g==
X-Received: by 2002:a17:907:9118:b0:7c1:22a6:818f with SMTP id
 p24-20020a170907911800b007c122a6818fmr33785103ejq.25.1674858820424; 
 Fri, 27 Jan 2023 14:33:40 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 w10-20020a170906d20a00b008448d273670sm2886793ejz.49.2023.01.27.14.33.37
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:33:38 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so6389583wmb.0
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jan 2023 14:33:37 -0800 (PST)
X-Received: by 2002:a05:600c:c19:b0:3db:1212:beec with SMTP id
 fm25-20020a05600c0c1900b003db1212beecmr2925999wmb.57.1674858817437; Fri, 27
 Jan 2023 14:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
 <31a0b303-64a4-8ac4-383d-6656f05a541b@quicinc.com>
In-Reply-To: <31a0b303-64a4-8ac4-383d-6656f05a541b@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Jan 2023 14:33:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XCq8urY2vEjLwJ_nYkntaz=dZhxLTnZGvY+xcQrJo9OQ@mail.gmail.com>
Message-ID: <CAD=FV=XCq8urY2vEjLwJ_nYkntaz=dZhxLTnZGvY+xcQrJo9OQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally
 powering up DSI hosts at modeset
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, ye xingchen <ye.xingchen@zte.com.cn>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 27, 2023 at 10:54 AM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> On 1/13/2023 3:56 PM, Douglas Anderson wrote:
> > In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > time"), we moved powering up DSI hosts to modeset time. This wasn't
> > because it was an elegant design, but there were no better options.
> >
> > That commit actually ended up breaking ps8640, and thus was born
> > commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> > parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> > the old way of doing things. It turns out that ps8640 _really_ doesn't
> > like its pre_enable() function to be called after
> > dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> > because I have any inside knowledge), it looks like the assertion of
> > "RST#" in the ps8640 runtime resume handler seems like it's not
> > allowed to happen after dsi_mgr_bridge_power_on()
> >
> > Recently, Dave Stevenson's series landed allowing bridges some control
> > over pre_enable ordering. The meaty commit for our purposes is commit
> > 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> > bridge init order"). As documented by that series, if a bridge doesn't
> > set "pre_enable_prev_first" then we should use the old ordering.
> >
> > Now that we have the commit ("drm/bridge: tc358762: Set
> > pre_enable_prev_first") we can go back to the old ordering, which also
> > allows us to remove the ps8640 special case.
> >
> > One last note is that even without reverting commit 7d8e9a90509f
> > ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> > revert the ps8640 special case and try it out then it doesn't seem to
> > fail anymore. I spent time bisecting / debugging this and it turns out
> > to be mostly luck, so we still want this patch to make sure it's
> > solid. Specifically the reason it sorta works these days is because
> > we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> > "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> > implemented means that we actually power the bridge chip up just a wee
> > bit earlier and then the bridge happens to stay on because of
> > autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
> >
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Why is the patch title showing 2/2? I am not seeing any 1/2 here.

Is it a problem with your mail filters? You can see it at:

https://lore.kernel.org/r/20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid/

You are listed on the "To:" line. ;-)


> > @@ -349,7 +297,16 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> >   host1_en_fail:
> >       msm_dsi_host_disable(host);
> >   host_en_fail:
> > -
> > +     msm_dsi_host_disable_irq(host);
> > +     if (is_bonded_dsi && msm_dsi1) {
> > +             msm_dsi_host_disable_irq(msm_dsi1->host);
> > +             msm_dsi_host_power_off(msm_dsi1->host);
> > +     }
>
> In addition to Dmitry's comment of keeping the bridge_power_on() name,
>
> this part of the change seems independent of the patch. This was missing
> cleanup for DSI1 (esp the disable_irq part).
>
> So can we break it up into two parts.
>
> 1) Add missing cleanup for DSI1
> 2) Just get rid of dsi_mgr_power_on_early() and keep the call
> dsi_mgr_bridge_power_on() in dsi_mgr_bridge_pre_enable() unconditionally.

I didn't intentionally fix any bug in my patch--I just reverted it all
back to how it was before. ;-)

So looking more closely, it looks like overall the current code (AKA
what's landed today and without ${SUBJECT} patch) doesn't really
handle errors with dsi_mgr_bridge_power_on() very well. The normal
case of calling dsi_mgr_bridge_power_on() from modeset is totally
ignored because modeset returns no error. Then the special workaround
for ps8640 just followed the same pattern and assumed that
dsi_mgr_bridge_power_on() succeeded. It also assumed that if the rest
of dsi_mgr_bridge_pre_enable() failed that it didn't need to undo
dsi_mgr_bridge_power_on() because it wouldn't have undone it in the
modeset case.

While the current code isn't the best, it's not like the pre_enable()
call could have returned errors anyway. It probably wasn't truly the
end of the world to behave the way it did.

With all that, I guess my plan would be to do as Dmitry says and just
always call dsi_mgr_bridge_power_on() from
dsi_mgr_bridge_pre_enable(). In the first patch I'll just do that and
remove the ps8640 workaround. Then I can add a 2nd patch that improves
the error handling by having dsi_mgr_bridge_power_on() return an error
code and then adding a matching dsi_mgr_bridge_power_off() that will
undo it and include the extra cleanup.

-Doug
