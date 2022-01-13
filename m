Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1914248DE57
	for <lists+freedreno@lfdr.de>; Thu, 13 Jan 2022 20:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B83810E2C3;
	Thu, 13 Jan 2022 19:47:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390A210E2B3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jan 2022 19:47:53 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 i7-20020a9d68c7000000b0059396529af8so853368oto.4
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jan 2022 11:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=LveOCAOmqB/h+YVzSFKmHbwc26AOHfpIvWRnUMitU1c=;
 b=kVEP29epgvvIK6dun2PAdR68NYQ3/uzqBwFqt5+xXQE56p7Idpymv7GY5NGJ3pttS8
 C1bw9YyQ0g+LShcqDw9WRWWa5rf1pmLBdIFJ14M9Rs36rgalrhCmzJZLu+IY14hcAsV/
 Ea1na8Sg5YF8BWGQLrpgTqpbmHKSavW2aG3q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=LveOCAOmqB/h+YVzSFKmHbwc26AOHfpIvWRnUMitU1c=;
 b=kcdCbKXnrdrPIRun9CK5NaambqOvzcX2fclX0yKBxP1/Yhme9CjOkkvzBulFm8Excy
 d6ptRNEtzRSbkfQddAbYtYk8mJgBY5xNNNcArzWpXKOhbcoZk50lybfz81Kv8QxXXtCs
 t7Sy7hB7mi4LpPldyZs2uFX9PVaYa/uH/6NbDDX9yypdnlARJCD/WacKHmBj/C3anFhA
 OwJ1EFfw6G6MaaNbIC+sMHjGP5WvgNAkvMiuuDLecrfLnIcrPsINMIsKWxT/D0tJqxxA
 e59DpXfIezulcNGljCdcFVISwgOWOKY1p/ehGNbSykGxQBCJ4ZvkET/V5R8cQIHAB7Sh
 xRLA==
X-Gm-Message-State: AOAM53302emJpbcJk9qpAAORDAxE7I4eRd2aLmxP+3xpBoIzI8IjcVtu
 qcGy+9dH+x2g5UczBVyLR/KZxIH5CPWRtQGZLaYR7A==
X-Google-Smtp-Source: ABdhPJxRQB/uv0ujnf5NZkqZ46QWuW2o3HqwoQ+L6pFQvnd2vuIjHOpP+nH1s1VZt5t3QaBJW5HC+uJuKc9fC2MlXQg=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr4148931otk.159.1642103272468; 
 Thu, 13 Jan 2022 11:47:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Jan 2022 11:47:52 -0800
MIME-Version: 1.0
In-Reply-To: <338ae657-e8ed-e620-0aa7-4ad05df18ad1@quicinc.com>
References: <1641926606-1012-1-git-send-email-quic_khsieh@quicinc.com>
 <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53hrPYR3ThwxM_+fzyRSB+6W1drFymW5n_RKmg_gf8z-w@mail.gmail.com>
 <84ee17f9-2597-86b6-1517-2358d443f65b@quicinc.com>
 <CAE-0n5134H0puMicozjdfTY+zXVUZyrebjv7Hto3EWcQAELO4A@mail.gmail.com>
 <338ae657-e8ed-e620-0aa7-4ad05df18ad1@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 13 Jan 2022 11:47:51 -0800
Message-ID: <CAE-0n51QbJHnOses5sF6xECR0gRZB1Fbi1KqoLG+61ZWH9BtOA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v11 1/4] drm/msm/dp: do not initialize phy
 until plugin interrupt received
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-13 09:51:42)
>
> On 1/12/2022 8:13 PM, Stephen Boyd wrote:
> >>>> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> >>>> -               flip = true;
> >>>> +       dp_power_init(dp->power, false);
> >>>> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> >>>> +
> >>>> +       /*
> >>>> +        * eDP is the embedded primary display and has its own phy
> >>>> +        * initialize phy immediately
> >>> Question still stands why we can't wait for hpd high from the eDP panel.
> >>> Also, I think "has its own phy" means that it's not part of a combo
> >>> USB+DP phy? Can you please clarify?
> >>>
> >>>> +        */
> >>>> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
> >>>> +               dp_display_host_phy_init(dp);
> >>>>
> >>>> -       dp_power_init(dp->power, flip);
> >>>> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
> >>>>           dp_aux_init(dp->aux);
> >>>>           dp->core_initialized = true;
> >>>>    }
> >>>> @@ -1306,20 +1330,23 @@ static int dp_pm_resume(struct device *dev)
> >>>>           dp->hpd_state = ST_DISCONNECTED;
> >>>>
> >>>>           /* turn on dp ctrl/phy */
> >>>> -       dp_display_host_init(dp, true);
> >>>> +       dp_display_host_init(dp);
> >>>>
> >>>>           dp_catalog_ctrl_hpd_config(dp->catalog);
> >>>>
> >>>> -       /*
> >>>> -        * set sink to normal operation mode -- D0
> >>>> -        * before dpcd read
> >>>> -        */
> >>>> -       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >>>>
> >>>>           if (dp_catalog_link_is_connected(dp->catalog)) {
> >>>> +               /*
> >>>> +                * set sink to normal operation mode -- D0
> >>>> +                * before dpcd read
> >>>> +                */
> >>>> +               dp_display_host_phy_init(dp);
> >>>> +               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >>>>                   sink_count = drm_dp_read_sink_count(dp->aux);
> >>>>                   if (sink_count < 0)
> >>>>                           sink_count = 0;
> >>>> +
> >>>> +               dp_display_host_phy_exit(dp);
> >>> Why is the phy exited on resume when the link is still connected? Is
> >>> this supposed to be done only when the sink_count is 0? And how does
> >>> this interact with eDP where the phy is initialized by the call to
> >>> dp_display_host_init() earlier in this function.
> >>>
> >>>>           }
> >>>>
> >>>>           dp->link->sink_count = sink_count;
> > Any response to the above two comments?

??
