Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C22493020
	for <lists+freedreno@lfdr.de>; Tue, 18 Jan 2022 22:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5087D10E148;
	Tue, 18 Jan 2022 21:48:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39A310E124
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jan 2022 21:48:43 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id s9so970702oib.11
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jan 2022 13:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XbypTSvua+Bn+tStGdHHerix/3+IgEDg0+FneAuZ170=;
 b=QpAAwHF2qWinW2uvaofhoAUY39nlZwvyaMiOxxeRdyuHYzNLDAAZIRF5kasuOU3+eC
 IVeupmELfxU1+XxjoKk/GtmN5MfLrFr5jLMaIofFTdVigAu5RgI74s+6US1TagKA9EYG
 5LWW55GQurbt9XXRFW9hic2ErARQMedsS3goQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XbypTSvua+Bn+tStGdHHerix/3+IgEDg0+FneAuZ170=;
 b=ceoEX9+uyAVttj5cFs9FGg+0+vUzC0QFDs3u50nUaWEbYfk/327+JvooZk39EKag8Q
 vv8W8sc91dokSgaMWEOdit1gwVxEffjuLdMML70UbNel0LUQSAKO5Vbr605am38CkrWN
 IeWV0RWG0I6MlwuvwK/lv1Yo8IbX2NZpp7r96FTSxC53ecA/gOPFeZHnf6A+aT5T0+id
 PeEz+stpS+3KI8m/lZm5IU5DIaNR0/AvkMbHMS6rCPKDkcDHuX+SKwBgCX+9OewiuH0n
 Y6zWYzy4wTRhG3RQbk+8BXnLPFtJpJuznfKDeuKoA8jvHHMzFIDdbK2njtrPC/sa2EPn
 uX/A==
X-Gm-Message-State: AOAM530wsC2GmH01QBGQavpb+V0C2P46gxmNheVP7MMIc0iG/4qt4gnp
 oM3g/Lyemvk1fp6D+b0AtBDPjaaZ/wUT76gpkCAhCw==
X-Google-Smtp-Source: ABdhPJy9GaLVs4C+CRAAbCb6jqWMfK6XSY2DOuVH79+SDS+8SWhgAnJT9e4zefrFMl48i8wIYbvNmfwKg8rjy27WavQ=
X-Received: by 2002:aca:f241:: with SMTP id q62mr475173oih.64.1642542523126;
 Tue, 18 Jan 2022 13:48:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Jan 2022 15:48:42 -0600
MIME-Version: 1.0
In-Reply-To: <1642531648-8448-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642531648-8448-1-git-send-email-quic_khsieh@quicinc.com>
 <1642531648-8448-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 18 Jan 2022 15:48:42 -0600
Message-ID: <CAE-0n513EnHjFLNaRPecXZJMp0Cg7UHZyqq9q3NZS50CvJtn6w@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v18 1/4] drm/msm/dp: do not initialize phy
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

Quoting Kuogee Hsieh (2022-01-18 10:47:25)
> Current DP drivers have regulators, clocks, irq and phy are grouped
> together within a function and executed not in a symmetric manner.
> This increase difficulty of code maintenance and limited code scalability.
> This patch divides the driver life cycle of operation into four states,
> resume (including booting up), dongle plugin, dongle unplugged and suspend.
> Regulators, core clocks and irq are grouped together and enabled at resume
> (or booting up) so that the DP controller is armed and ready to receive HPD
> plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
> into DUT (device under test). Once HPD plugin interrupt is received, DP
> controller will initialize phy so that dpcd read/write will function and
> following link training can be proceeded successfully. DP phy will be
> disabled after main link is teared down at end of unplugged HPD interrupt
> handle triggered by dongle unplugged out of DUT. Finally regulators, code
> clocks and irq are disabled at corresponding suspension.
>
> Changes in V2:
> -- removed unnecessary dp_ctrl NULL check
> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
> -- remove flip parameter out of dp_ctrl_irq_enable()
> -- add fixes tag
>
> Changes in V3:
> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
>         dp_display_host_init() for eDP
>
> Changes in V4:
> -- rewording commit text to match this commit changes
>
> Changes in V5:
> -- rebase on top of msm-next branch
>
> Changes in V6:
> -- delete flip variable
>
> Changes in V7:
> -- dp_ctrl_irq_enable/disabe() merged into dp_ctrl_reset_irq_ctrl()
>
> Changes in V8:
> -- add more detail comment regrading dp phy at dp_display_host_init()
>
> Changes in V9:
> -- remove set phy_initialized to false when -ECONNRESET detected
>
> Changes in v10:
> --  group into one series
>
> Changes in v11:
> -- drop drm/msm/dp: dp_link_parse_sink_count() return immediately
>         if aux read
>
> Changes in v12:
> -- move dp_display_host_phy_exit() after dp_display_host_deinit()
>
> Changes in v13:
> -- do not execute phy_init until plugged_in interrupt for edp, same as DP.
>
> Changes in v14:
> -- remove redundant dp->core_initialized = false form dp_pm_suspend.
>
> Changes in v15:
> -- remove core_initialized flag check at both host_init and host_deinit
>
> Changes in v16:
> -- remove dp_display_host_phy_exit core_initialized=false at dp_pm_suspend
>
> Changes in v17:
> -- remove core_initialized checking before execute attention_cb()
>
> Changes in v18:
> -- remove core_initialized checking at dp_pm_suspend
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
