Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF317A5E7C
	for <lists+freedreno@lfdr.de>; Tue, 19 Sep 2023 11:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9832F10E261;
	Tue, 19 Sep 2023 09:46:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEF510E261
 for <freedreno@lists.freedesktop.org>; Tue, 19 Sep 2023 09:46:07 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-59c0d002081so38788957b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Sep 2023 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695116766; x=1695721566; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5QwnMEr9g+UV2zSClp4LdEyAkoPr5XRWwAzh3mE4dxo=;
 b=AoC86rS2hEtyw5P38Q0X0W1zvh49nLO4WJY/3gZQ7pIzYt17nOoOhEsi6BqHkhPwbs
 vXm73fR4bxlE3b+DdadGPeJrpz8XU9o7F/4O1XUDUf3EuqcfX8Bq9P+kK3y8mGCfL9/M
 7tBD1OD7hMewk+hQRqs6uoKbuXbqlIBlyWCRLLviVEg5HXFF+xRjUs7zlcQmulFMbCPZ
 Ml3nYp5rwdaMK19p9qqG6HQZsV0NDW6YslwjIticWdkazX1GO09lc71YsGYoHikMMBPL
 22nHFiBJID2jcpluY5wH52PPJ2ktrjcyg7N86m/4KYCutXt/NAHw1cQtSGMwAGbGNuAB
 kE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695116766; x=1695721566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5QwnMEr9g+UV2zSClp4LdEyAkoPr5XRWwAzh3mE4dxo=;
 b=R8Ck9dtib/BXJfzaskFTcr58N9cqCJxu8qxvlBI5yBUXavUXlUTuRT1+kmxXyDgeA0
 pUy9tIl7y2NnTB0o4ZkaxzH5qL2a1bWG8n5eMOq9t6Zf7dCJIuu6LAKlYdA01auPRtLd
 m4mL/X8Nj4HdY1Ue++pSvCTloh82y9yMq3zUq56wbJR9rH+7gFNOy1gyz/05AZwBd+zN
 JZmnPG59eepdMGwt0k5i1yR0fcuw+TtlUxypVob5CoG9eYfcu6tvvfYma8AasIFBb3S8
 vEfdqB5A/8s+dbT8LajfxrotqrK/ZzSJccZTUmWi4jv2LbzZFHidyXqT4/2t5Uu9Y30c
 d5zQ==
X-Gm-Message-State: AOJu0Yx9PPPUlvTTpGJ0392/Ttjstotvs34eRUgRYpi8kMQBvCLTU6Br
 jFxw2XuFXbfXpKu6IgJX/dtQ5+rkVc4EKohKAG5/isd5HeHRcF33BLFO/w==
X-Google-Smtp-Source: AGHT+IEPLhKcEQ8VnPqTGkwZWPQeCGEa8pbJIGsJUn9x4bl87n6z2UlZ8WodvmGmXYRjZe6EBVmQQgOm6zqwAoRaqB8=
X-Received: by 2002:a81:a208:0:b0:583:d722:9ae9 with SMTP id
 w8-20020a81a208000000b00583d7229ae9mr12169719ywg.41.1695116766554; Tue, 19
 Sep 2023 02:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-4-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprG8HuhDHV9k5_4+vkejnYmwmg61isZXT7EsBCbGP0pJA@mail.gmail.com>
 <f855b3db-2754-5f66-9fc2-061a517814ef@quicinc.com>
In-Reply-To: <f855b3db-2754-5f66-9fc2-061a517814ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Sep 2023 12:45:55 +0300
Message-ID: <CAA8EJpof+dp_d_5-oADuA7RNU7ut=TKLY5Fw12EjxaSa2S+=rg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/7] drm/msm/dp: use
 drm_bridge_hpd_notify() to report HPD status changes
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

On Mon, 18 Sept 2023 at 23:16, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 9/15/2023 5:41 PM, Dmitry Baryshkov wrote:
> > On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Currently DP driver use drm_helper_hpd_irq_event(), bypassing drm bridge
> >> framework, to report HPD status changes to user space frame work.
> >> Replace it with drm_bridge_hpd_notify() since DP driver is part of drm
> >> bridge.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Also see the comment below.
> >
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++------------------
> >>   1 file changed, 2 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 18d16c7..59f9d85 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -356,26 +356,10 @@ static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
> >>                  (dp->link->sink_count == 0);
> >>   }
> >>
> >> -static void dp_display_send_hpd_event(struct msm_dp *dp_display)
> >> -{
> >> -       struct dp_display_private *dp;
> >> -       struct drm_connector *connector;
> >> -
> >> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> -
> >> -       connector = dp->dp_display.connector;
> >> -       drm_helper_hpd_irq_event(connector->dev);
> >> -}
> >> -
> >>   static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>                                              bool hpd)
> >>   {
> >> -       if ((hpd && dp->dp_display.link_ready) ||
> >> -                       (!hpd && !dp->dp_display.link_ready)) {
> >> -               drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
> >> -                               (hpd ? "on" : "off"));
> >> -               return 0;
> >> -       }
> >> +       struct drm_bridge *bridge = dp->dp_display.bridge;
> >>
> >>          /* reset video pattern flag on disconnect */
> >>          if (!hpd)
> > Note, this part (resetting the video_test and setting of is_connected)
> > should be moved to the dp_bridge_hpd_notify() too. Please ignore this
> > comment if this is handled later in the series.
>
> I think keep them here is better since eDP does not populate hpd_enable,
> hpd_disable and hpd_notify at edp_bridge_ops at drm_bridge_attach().
>
> Keep them here will work for both eDP and DP.

Having them here doesn't work for DP-with-external-bridges, which will
not use dp_display_send_hpd_notification.

>
>
> >
> >
> >> @@ -385,7 +369,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> >>
> >>          drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
> >>                          dp->dp_display.connector_type, hpd);
> >> -       dp_display_send_hpd_event(&dp->dp_display);
> >> +       drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> >>
> >>          return 0;
> >>   }
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
