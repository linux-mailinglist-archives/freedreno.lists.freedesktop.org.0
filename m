Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012CD696820
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 16:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AC710E1D2;
	Tue, 14 Feb 2023 15:32:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1FC10E1D2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 15:32:06 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id f10so17866109qtv.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iT7OrS0tLMyMBH4C21ZIMhCJMcTe4803pwrO0JMxYJA=;
 b=jVBIudOsjKVvsYLCyJNmT8yPOv8ahQqjzAD6Ny6RSEe+ICGvxskFxhMNLtdFzvAX25
 qTH+f30CscyTaVsysLcWkkyBt6SV2n8AWPtClFioKjp9+5f6EvFKhEklDIawYtSgRmo/
 C1/u1GGo22UIWz7fPKEO6A2aD/huFqtAw+G7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iT7OrS0tLMyMBH4C21ZIMhCJMcTe4803pwrO0JMxYJA=;
 b=Q1NhpXClTGoDBdPjO8BArc0Ricpckg/Qocd8+yMZnbrQbzD+FRWE2KZ9nvQqKqLwQD
 AGRUz4QRPn8LPSpVSmyj1FSPIFAF6zmAjvk5oO6JzRrKvdpGHMx02Q4rQr/lcgCVkpjU
 ZaWpZ0W7jaE5rn1995zsCdc8UZfUo6jOHnoCpjF27dl0SwF1zpXYRPYXHGx/DoTbWTuj
 1rrqPXSJcfwYOakvVdwHX+5yKisvW/a9M7qLdNOE/bBFdsrfAbWuOTcvWIIex7uQdR30
 sjaCBEamNZlBEy/66UeI6wJkyT/CKFt0IZ1ozQU9HaZKljdRa1iVTdBAJrHPMctjwV+4
 +3dg==
X-Gm-Message-State: AO0yUKWG0C1rOVIwfNq/A78IMQraw/W4FJzDS3ZUgjQ4AwCT52rRiygV
 DxHHWt4CtBs48iWvvgy1tjeD/RvgmJq3idUy
X-Google-Smtp-Source: AK7set/Nc7vC/y6/Z3RMrJAaobnlWyXiRAhntNPyqN0dJtvfMzetHsveA7zPowr0qkL0qWAQvHHglw==
X-Received: by 2002:ac8:5710:0:b0:3b8:6d50:461a with SMTP id
 16-20020ac85710000000b003b86d50461amr4855577qtw.1.1676388724871; 
 Tue, 14 Feb 2023 07:32:04 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com.
 [209.85.219.45]) by smtp.gmail.com with ESMTPSA id
 e65-20020a378244000000b0072ed644bb0dsm11866227qkd.97.2023.02.14.07.32.04
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 07:32:04 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id mg2so3483671qvb.9
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 07:32:04 -0800 (PST)
X-Received: by 2002:a05:6102:3712:b0:412:626b:1655 with SMTP id
 s18-20020a056102371200b00412626b1655mr259256vst.68.1676388311514; Tue, 14 Feb
 2023 07:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.3.I3c87b53c4ab61a7d5e05f601a4eb44c7e3809a01@changeid>
 <0419b0c8-fb30-f8df-1b9a-19e106680948@quicinc.com>
 <CAD=FV=Xk6qFokozxEa+MaCgii3zpSWZRDe52FoP17E-DOFXoyg@mail.gmail.com>
 <1f204585-88e2-abae-1216-92f739ac9e91@quicinc.com>
In-Reply-To: <1f204585-88e2-abae-1216-92f739ac9e91@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Feb 2023 07:24:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UKnhdRgxMJNctaHuH3o9ZLACaX16U7b=PonUhL1+FXpQ@mail.gmail.com>
Message-ID: <CAD=FV=UKnhdRgxMJNctaHuH3o9ZLACaX16U7b=PonUhL1+FXpQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFT PATCH v2 3/3] drm/msm/dsi: More properly
 handle errors in regards to dsi_mgr_bridge_power_on()
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
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 13, 2023 at 6:02 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> Sorry for the delayed response.
>
> On 2/2/2023 2:46 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Feb 2, 2023 at 2:37 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Hi Doug
> >>
> >> On 1/31/2023 2:18 PM, Douglas Anderson wrote:
> >>> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> >>> time") the error handling with regards to dsi_mgr_bridge_power_on()
> >>> got a bit worse. Specifically if we failed to power the bridge on then
> >>> nothing would really notice. The modeset function couldn't return an
> >>> error and thus we'd blindly go forward and try to do the pre-enable.
> >>>
> >>> In commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time
> >>> for parade-ps8640") we added a special case to move the powerup back
> >>> to pre-enable time for ps8640. When we did that, we didn't try to
> >>> recover the old/better error handling just for ps8640.
> >>>
> >>> In the patch ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
> >>> at modeset") we've now moved the powering up back to exclusively being
> >>> during pre-enable. That means we can add the better error handling
> >>> back in, so let's do it. To do so we'll add a new function
> >>> dsi_mgr_bridge_power_off() that's matches how errors were handled
> >>> prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to
> >>> modeset time").
> >>>
> >>> NOTE: Now that we have dsi_mgr_bridge_power_off(), it feels as if we
> >>> should be calling it in dsi_mgr_bridge_post_disable(). That would make
> >>> some sense, but doing so would change the current behavior and thus
> >>> should be a separate patch. Specifically:
> >>> * dsi_mgr_bridge_post_disable() always calls dsi_mgr_phy_disable()
> >>>     even in the slave-DSI case of bonded DSI. We'd need to add special
> >>>     handling for this if it's truly needed.
> >>> * dsi_mgr_bridge_post_disable() calls msm_dsi_phy_pll_save_state()
> >>>     midway through the poweroff.
> >>> * dsi_mgr_bridge_post_disable() has a different order of some of the
> >>>     poweroffs / IRQ disables.
> >>> For now we'll leave dsi_mgr_bridge_post_disable() alone.
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>>
> >>> Changes in v2:
> >>> - ("More properly handle errors...") new for v2.
> >>>
> >>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 32 ++++++++++++++++++++++-----
> >>>    1 file changed, 26 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> >>> index 2197a54b9b96..28b8012a21f2 100644
> >>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> >>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> >>> @@ -228,7 +228,7 @@ static void msm_dsi_manager_set_split_display(u8 id)
> >>>        }
> >>>    }
> >>>
> >>> -static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >>> +static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >>>    {
> >>>        int id = dsi_mgr_bridge_get_id(bridge);
> >>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> >>> @@ -268,14 +268,31 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> >>>        if (is_bonded_dsi && msm_dsi1)
> >>>                msm_dsi_host_enable_irq(msm_dsi1->host);
> >>>
> >>> -     return;
> >>> +     return 0;
> >>>
> >>>    host1_on_fail:
> >>>        msm_dsi_host_power_off(host);
> >>>    host_on_fail:
> >>>        dsi_mgr_phy_disable(id);
> >>>    phy_en_fail:
> >>> -     return;
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static void dsi_mgr_bridge_power_off(struct drm_bridge *bridge)
> >>> +{
> >>> +     int id = dsi_mgr_bridge_get_id(bridge);
> >>> +     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> >>> +     struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
> >>> +     struct mipi_dsi_host *host = msm_dsi->host;
> >>> +     bool is_bonded_dsi = IS_BONDED_DSI();
> >>> +
> >>> +     msm_dsi_host_disable_irq(host);
> >>> +     if (is_bonded_dsi && msm_dsi1) {
> >>> +             msm_dsi_host_disable_irq(msm_dsi1->host);
> >>> +             msm_dsi_host_power_off(msm_dsi1->host);
> >>> +     }
> >>
> >> The order of disabling the IRQs should be opposite of how they were enabled.
> >>
> >> So while enabling it was DSI0 and then DSI1.
> >>
> >> Hence while disabling it should be DSI1 and then DSI0.
> >>
> >> So the order here should be
> >>
> >> DSI1 irq disable
> >> DSI0 irq disable
> >> DSI1 host power off
> >> DSI0 host power off
> >
> > Right. Normally you want to go opposite. I guess a few points, though:
> >
> > 1. As talked about in the commit message, the order I have matches the
> > order we had prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host
> > powerup to modeset time").
> >
> > 2. I'd be curious if it matters. The order you request means we need
> > to check for `(is_bonded_dsi && msm_dsi1)` twice. While that's not a
> > big deal if it's important, it's nice not to have to do so.
> >
> > 3. As talked about in the commit message, eventually we should
> > probably resolve this order with the order of things in
> > dsi_mgr_bridge_post_disable(), which is yet a different ordering.
> > Ideally this resolution would be done by someone who actually has
> > proper documentation of the hardware and how it's supposed to work
> > (AKA not me).
> >
> > So my preference would be to either land or drop ${SUBJECT} patch
> > (either is fine with me) and then someone at Qualcomm could then take
> > over further cleanup.
> >
>
> I do think the ordering matters but you are right, this change brings
> back the ordering we had before so lets handle the re-ordering of all
> places in a separate change. I am okay with this change to go-in, hence
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> What is the plan to land the patches?
>
> 2 & 3 go in msm-next but 1 goes in drm-misc?

We can do that and I'm happy to land patch #1 in drm-misc. Then I
assume we'd want to wait until the change makes its way into mainline
before landing patch #2/#3?

Given how tiny patch #1 is, though, it sure seems like it would be
nice / easier if they all went through the msm tree. I guess we'd want
one of the drm-misc maintainers (not just a committer like me) to Ack
this? Maybe it's not worth it and we should just go the slow route?

-Doug
