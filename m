Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD517B704C
	for <lists+freedreno@lfdr.de>; Tue,  3 Oct 2023 19:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7CD10E03B;
	Tue,  3 Oct 2023 17:53:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B14710E03B
 for <freedreno@lists.freedesktop.org>; Tue,  3 Oct 2023 17:53:13 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-59f4f80d084so13990467b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696355592; x=1696960392; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SAUepoFu9L8vltI42kIH0cOCmyvQnjbpVelI6+9prD4=;
 b=P/1bxALfH5/Wl2r6+wLTwSZfbaEjYSeNMN72t60W/bvfakSfduPTkj0Dh5V/iU4h2Q
 6+MYOHbKoPcsvYLoQPZhHUFVSSoQ6x7sVspA9/35ZWPLsv+ialC2ABFbudeExux3qXvz
 yvXRlUUXykbkhrIGktL7M+gqv3qszbcrLO6jpX+Qh1RdjRxcSNyYV7zMo4/6oZbohh6e
 3nAUOMwijzTcYsfOWlLqwyZsl5uJskYxZ5wo/BYrtgnk2kfCC8TA+4SEyzEGX8Xek3gL
 1hchtB1CCTOaDx+a4ov0UyJCjF/brngBqKzb0NVoJI6ayTasFtZUVfec1f3cEl4X+2hE
 uaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696355592; x=1696960392;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SAUepoFu9L8vltI42kIH0cOCmyvQnjbpVelI6+9prD4=;
 b=NLN/c/vEfq0CcTmxrJwTNDR98j0YTED1o/bafKX5S4ROCBTWxW1vgxT/0FZAP11Nt+
 28YdbykbfRuliT+NaAyomp31h2Ix8r1diYxxB/rPahCERW5lvR6JllLh/LeuiUC4tma6
 UfpjNTjmebnhlo9Nb82PuFyb1tLR+ZgatH5TsHUaL9o/2QmRuzXWPdwqyO6MuobV5U4+
 H84r6y7M8zbBRAFRoGcIIOoQHroWzBIVXV1sTiNgpTj0+ievnOgiub7XiUOseC4IercM
 BlKBqS7itPX1ZhqDfKoh8pXOf0WgHzDZ4ZjsO0KaW5DYhYYGOWnmuqmn9Pjz7del+PTS
 wt2g==
X-Gm-Message-State: AOJu0Yx4LDGwWAod06wxqDhzUDvd8O0YFIZzPjuQPc6reRV4irpwvSk8
 hX5wYFyx/5+NSlDB/rrOEeFNFDTNaX/bbqf2CGAVyw==
X-Google-Smtp-Source: AGHT+IGvS6JEqP4m2KjowsM6eXcroZ/1Zh2LzpceIoObs2BtiYUXKZiyIvTcKOvrAnFrqPY4upJvZAJqkzGRsKhBn/4=
X-Received: by 2002:a81:6c0a:0:b0:5a0:e86e:fd5c with SMTP id
 h10-20020a816c0a000000b005a0e86efd5cmr374878ywc.0.1696355592457; Tue, 03 Oct
 2023 10:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-8-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpor3WEYmN=hQJQPFyjZGdr4j8F-XAB=2BDVRFCTNioEiA@mail.gmail.com>
 <e72ae247-459d-9f23-0583-ce6da1a30336@quicinc.com>
In-Reply-To: <e72ae247-459d-9f23-0583-ce6da1a30336@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Oct 2023 20:53:01 +0300
Message-ID: <CAA8EJppGg4+Rrf+1HBYYgvFtGWU2xRTGK6tP6xMefFsv-vyEiQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 7/8] drm/msm/dp: add
 pm_runtime_force_suspend()/resume()
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 3 Oct 2023 at 19:44, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 9/27/2023 3:00 PM, Dmitry Baryshkov wrote:
> > On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> After incorporated pm_runtime framework into eDP/DP driver, the
> > incorporating
> >
> >
> >> original dp_pm_suspend() to handle power off both DP phy and
> >> controller during suspend and dp_pm_resume() to handle power on
> >> both DP phy and controller during resume are not necessary since
> >> those function are replaced by dp_pm_runtime_suspend() and
> >> dp_pm_runtime_resume() through pm runtime framework.
> >> Therefore add pm framework provides functions,
> >> pm_runtime_force_suspend()/resume() to complete incorporating pm
> >> runtime framework into DP driver.
> >>
> >> Changes in v4:
> >> -- drop both dp_pm_prepare() and dp_pm_compete() from this change
> >> -- delete ST_SUSPENDED state
> >> -- rewording commit text to add more details regrading the purpose
> >>     of this change
> >>
> >> Changes in v3:
> >> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
> >> -- replace dp_pm_resume() with pm_runtime_force_resume()
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 113 ++----------------------------------
> >>   1 file changed, 5 insertions(+), 108 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 9158a2c..711d262 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -49,7 +49,6 @@ enum {
> >>          ST_CONNECTED,
> >>          ST_DISCONNECT_PENDING,
> >>          ST_DISPLAY_OFF,
> >> -       ST_SUSPENDED,
> >>   };
> >>
> >>   enum {
> >> @@ -560,7 +559,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
> >>          drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
> >>                          dp->dp_display.connector_type, state);
> >>
> >> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> >> +       if (state == ST_DISPLAY_OFF) {
> >>                  mutex_unlock(&dp->event_mutex);
> >>                  return 0;
> >>          }
> >> @@ -674,7 +673,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
> >>          drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
> >>                          dp->dp_display.connector_type, state);
> >>
> >> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> >> +       if (state == ST_DISPLAY_OFF) {
> >>                  mutex_unlock(&dp->event_mutex);
> >>                  return 0;
> >>          }
> >> @@ -1321,110 +1320,10 @@ static int dp_pm_runtime_resume(struct device *dev)
> >>          return 0;
> >>   }
> >>
> >> -static int dp_pm_resume(struct device *dev)
> >> -{
> >> -       struct platform_device *pdev = to_platform_device(dev);
> >> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
> >> -       struct dp_display_private *dp;
> >> -       int sink_count = 0;
> >> -
> >> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> -
> >> -       mutex_lock(&dp->event_mutex);
> >> -
> >> -       drm_dbg_dp(dp->drm_dev,
> >> -               "Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> >> -               dp->dp_display.connector_type, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> -
> >> -       /* start from disconnected state */
> >> -       dp->hpd_state = ST_DISCONNECTED;
> >> -
> >> -       /* turn on dp ctrl/phy */
> >> -       dp_display_host_init(dp);
> >> -
> >> -       if (dp_display->is_edp)
> >> -               dp_catalog_ctrl_hpd_enable(dp->catalog);
> >> -
> >> -       if (dp_catalog_link_is_connected(dp->catalog)) {
> >> -               /*
> >> -                * set sink to normal operation mode -- D0
> >> -                * before dpcd read
> >> -                */
> >> -               dp_display_host_phy_init(dp);
> >> -               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >> -               sink_count = drm_dp_read_sink_count(dp->aux);
> >> -               if (sink_count < 0)
> >> -                       sink_count = 0;
> >> -
> >> -               dp_display_host_phy_exit(dp);
> >> -       }
> >> -
> >> -       dp->link->sink_count = sink_count;
> >> -       /*
> >> -        * can not declared display is connected unless
> >> -        * HDMI cable is plugged in and sink_count of
> >> -        * dongle become 1
> >> -        * also only signal audio when disconnected
> >> -        */
> >> -       if (dp->link->sink_count) {
> >> -               dp->dp_display.link_ready = true;
> >> -       } else {
> >> -               dp->dp_display.link_ready = false;
> >> -               dp_display_handle_plugged_change(dp_display, false);
> >> -       }
> >> -
> >> -       drm_dbg_dp(dp->drm_dev,
> >> -               "After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
> >> -               dp->dp_display.connector_type, dp->link->sink_count,
> >> -               dp->dp_display.link_ready, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> -
> >> -       mutex_unlock(&dp->event_mutex);
> >> -
> >> -       return 0;
> >> -}
> >> -
> >> -static int dp_pm_suspend(struct device *dev)
> >> -{
> >> -       struct platform_device *pdev = to_platform_device(dev);
> >> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
> >> -       struct dp_display_private *dp;
> >> -
> >> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> -
> >> -       mutex_lock(&dp->event_mutex);
> >> -
> >> -       drm_dbg_dp(dp->drm_dev,
> >> -               "Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
> >> -               dp->dp_display.connector_type, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> -
> >> -       /* mainlink enabled */
> >> -       if (dp_power_clk_status(dp->power, DP_CTRL_PM))
> >> -               dp_ctrl_off_link_stream(dp->ctrl);
> >> -
> >> -       dp_display_host_phy_exit(dp);
> > I was under the impression that dp_pm_runtime_suspend / _resume
> > functions perform phy init/exit only in eDP cases. Can we really drop
> > the main suspend/resume functions?
>
> yes on eDP case since it is embedded.

Let me ask the same question in a different way:

dp_pm_suspend() / dp_pm_resume() functions contain several calls to DP
functions. Why can we drop them now? Maybe they had to be dropped in
one of the previous patches, when you have added proper runtime PM
support?

Could you please confirm that after each patch the DP driver is
working, that there are no hidden dependencies between patches?

> for external DP case, there are two steps
>
> step 1: enable DP controller's  hpd block and start waiting for hpd
> interrupts at dp_display_hpd_enable()

Step 1 should be optional. DP should be functional even if the
.hpd_enable was not called. Have you tested this usecase?

>
> step 2:  at plugin interrupts,  dp_display_host_phy_init()
>
> step 3: at unplug interrupt: dp_bridge_atomic_post_disable()
> dp_display_host_phy_exi()
>
> at runtime, there is loop between step 2 and step 3
>
> step  4: disable DP controller's  hpd block
>
> >
> >> -
> >> -       /* host_init will be called at pm_resume */
> >> -       dp_display_host_deinit(dp);
> >> -
> >> -       dp->hpd_state = ST_SUSPENDED;
> >> -
> >> -       drm_dbg_dp(dp->drm_dev,
> >> -               "After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> >> -               dp->dp_display.connector_type, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> -
> >> -       mutex_unlock(&dp->event_mutex);
> >> -
> >> -       return 0;
> >> -}
> >> -
> >>   static const struct dev_pm_ops dp_pm_ops = {
> >>          SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
> >> -       .suspend = dp_pm_suspend,
> >> -       .resume =  dp_pm_resume,
> >> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >> +                                pm_runtime_force_resume)
> >>   };
> >>
> >>   static struct platform_driver dp_display_driver = {
> >> @@ -1658,9 +1557,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> >>
> >>          dp_display = container_of(dp, struct dp_display_private, dp_display);
> >>
> >> -       if (dp->is_edp)
> >> -               dp_hpd_unplug_handle(dp_display, 0);
> > Why?
>
> dp_hpd_unplug_handle() does not tear down phy.
>
> Therefore eDP does not need to call unplug handle.

I don't fully understand your argument here. Could you please
describe, why this function call was necessary beforehand and what is
being changed now, so that it becomes unnecessary?

>
>
>
> >> -
> >>          mutex_lock(&dp_display->event_mutex);
> >>
> >>          state = dp_display->hpd_state;
> >> @@ -1748,6 +1644,7 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
> >>          dp_catalog_ctrl_hpd_disable(dp->catalog);
> >>
> >>          dp_display->internal_hpd = false;
> >> +       dp->hpd_state = ST_DISCONNECTED;
> > Why? We have only disabled sending of the HPD events. The dongle might
> > still be connected.
>
> dp_bridge_hpd_disable() disable dp controller hpd block (no more hpd
> interrupt will be received).
>
> dp_bridge_hpd_disable() should happen after DP main link had been teared
> down already.

No, this assumption is incorrect. hpd_disable can happen at any point
during runtime.
It merely disables HPD interrupt generation, it has nothing to do with
the DP block being enabled or not.

> Therefore hpd_state need to be in default state so that next plugin
> handle will be start with correct state.
>
>
> >
> >>          pm_runtime_mark_last_busy(&dp->pdev->dev);
> >>          pm_runtime_put_autosuspend(&dp->pdev->dev);
> >> --
> >> 2.7.4
> >>
> >
> > --
> > With best wishes
> >
> > Dmitry



-- 
With best wishes
Dmitry
