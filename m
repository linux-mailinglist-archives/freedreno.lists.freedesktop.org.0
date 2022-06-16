Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705D54EDF5
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 01:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418B10E6D1;
	Thu, 16 Jun 2022 23:39:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1069010E6D1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 23:39:31 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id u9so3606542oiv.12
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=p6AMxpkA8TTGmEn1Bk60SJEuUpFSzeYyFwi5LwIblKY=;
 b=QoS7HSJcdZbZ6I1shW8c8Ggj/S/yYty4RWZXUUryK1d2L/wd7sLzx8TtlNWAr5tKPh
 AnyYnAmWsf3hi92uObQ0MmlBsoxc2/xtqjixO2sIOx+fxaF8R06D9WWa6K1q2kC9XnOW
 0eQNoUmCMLsWlyATgVG8WVyxWQX5zBwuwAGOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=p6AMxpkA8TTGmEn1Bk60SJEuUpFSzeYyFwi5LwIblKY=;
 b=hF8tvqLJkR+GsmQISh+5NWw6oYGx/Kw5LwJs0gp5CQZZ/xSsJJf3MiDBnXVIt9/E3o
 RmEx5TuAuu/cvEgVxhQNFzNuw5CB3FhgWBu/5DSu5dDSskcCgPQEu7fPlOYBTAnvAJrS
 favYNWHgSGFl1B4BXrkaLjyIfTssUmGcOIDh1zqSj2KAJeyXKXZN+bkgESsq+7LAui97
 ePZEXl0iKRdXIVqzkDUx6O8UGcdtUD4VUQqFG7Q73Nzh8jaA2JLXwYIYZfgTcg90+Li2
 hZl2kqb1sUffxplO0ZGCMwO0rOybUL7aV0Qwsh6uthwUPw1G+mBLOMXGuAT99c2iHviI
 IE8Q==
X-Gm-Message-State: AJIora97OBe/y4FLaqVH0tX+8FzWaQUMf4VlaoD7kI06ys2/LEtR6nl8
 LfrX5EvhceW1HZDjQXpCQPc+ehDUz/9RloZR/IKgdw==
X-Google-Smtp-Source: AGRyM1tJkP1MW9aiih9SxFvzYQIAdzAgdaP270BY5q2s7l4Xb6sprjP3JR24sFt3jyoliB8V5lZ19MPRnckBuygfQro=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3721825oil.193.1655422770319; Thu, 16
 Jun 2022 16:39:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 16:39:29 -0700
MIME-Version: 1.0
In-Reply-To: <1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 16 Jun 2022 16:39:29 -0700
Message-ID: <CAE-0n529kPSzweLuwq60b2d7Z49PZO+N_x3rxQW9iHKGgcqrjw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9] drm/msm/dp: force link training for
 display resolution change
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-16 13:26:40)
> Display resolution change is implemented through drm modeset. Older
> modeset (resolution) has to be disabled first before newer modeset
> (resolution) can be enabled. Display disable will turn off both
> pixel clock and main link clock so that main link have to be
> re-trained during display enable to have new video stream flow
> again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start
> link training if link status is not in sync state.
>
> However, there is rare case that a particular panel links status keep
> staying in sync for some period of time after main link had been shut
> down previously at display disabled. In this case, main link retraining
> will not be executed by irq_hdp_handle(). Hence video stream of newer
> display resolution will fail to be transmitted to panel due to main
> link is not in sync between host and panel.
>
> This patch will bypass irq_hpd_handle() in favor of directly call
> dp_ctrl_on_stream() to always perform link training in regardless of
> main link status. So that no unexpected exception resolution change
> failure cases will happen. Also this implementation are more efficient
> than manual kicking off irq_hpd_handle function.
>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Changes in v5:
> -- fix spelling at commit text
>
> Changes in v6:
> -- split dp_ctrl_on_stream() for phy test case
> -- revise commit text for modeset
>
> Changes in v7:
> -- drop 0 assignment at local variable (ret = 0)
>
> Changes in v8:
> -- add patch to remove pixel_rate from dp_ctrl
>
> Changes in v9:
> -- forward declare dp_ctrl_on_stream_phy_test_report()
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
