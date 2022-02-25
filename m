Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29F4C4D6B
	for <lists+freedreno@lfdr.de>; Fri, 25 Feb 2022 19:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE3510E91E;
	Fri, 25 Feb 2022 18:13:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BC610E922
 for <freedreno@lists.freedesktop.org>; Fri, 25 Feb 2022 18:13:58 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 p206-20020a4a2fd7000000b0031bfec11983so7242507oop.13
 for <freedreno@lists.freedesktop.org>; Fri, 25 Feb 2022 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Fagoys/mnguEDY3pl+5sEoAekwrN1hXZMmE77Ir6Qfs=;
 b=hxBADu8QpohF0yutsmwPqmQlJ5vH4rfHMO43pUPkQ3zD+/AxpPBOrlFKGve21EVmSn
 Pvx1oUpXteHi4Oe0mliT2aJlgWMAtBeq85PCVsob6gU3/c6aQfSkQeHJ3In7+IZd9RG4
 +j6cDftYrrsCehirVuVu0t3rhTorY76CTwgNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Fagoys/mnguEDY3pl+5sEoAekwrN1hXZMmE77Ir6Qfs=;
 b=yVE0tGlbQGQk9MmMC5NHh3YkoOZPQSD/HHDBFznTM02sjZFir0x5zfjKklCi3YCgI/
 63pH5iG2DkZVPRcoU9pbFVgj/iRusO4RfgOYgbH3joR1aVAb/eoyWasa0jRaGSE3rYhp
 57vlCuRrqIlgHX9kvVXJ0Qm64d9d5+OzDP5DgvESRKRKcFJlfsRKTR6a/DfMRVQFXBkR
 U6yGH1qTi15vWEsX1QDNDhOQicvydZc13JxHH47g88MH+nQgpoienJOFUlb5HJRH4cpC
 /AspOWRWRAZOVUAQs09edbbJBeCg+Qk7WyfmA7Cq1XPin1emo1aq7Ud81OURdgPndkBl
 oBAw==
X-Gm-Message-State: AOAM532Vyf+jtLWBn/akS8rdfUYjtmgNCyteO7GfprSR40zEQ+e7h14B
 dt23d2a2kn0r46DSanvf3DjICksWqWGjv6lPsNfJ3g==
X-Google-Smtp-Source: ABdhPJzLlkAkQdrZ22FiuMj2KKEe2l3uCK3eG6+MQ+vgJaB4N4/OV+2sjXjnVbX7YZ0UHqLBoWWYOwu4siva5+HTxms=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr1849727oao.8.1645812837029; Fri, 25 Feb
 2022 10:13:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 10:13:56 -0800
MIME-Version: 1.0
In-Reply-To: <1645576060-3046-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645576060-3046-1-git-send-email-quic_khsieh@quicinc.com>
 <1645576060-3046-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 10:13:56 -0800
Message-ID: <CAE-0n506iRCF0TjPDT2Aqe--RXEJbPe8961JiGmW6K2M5VJRUw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v10 3/4] drm/msm/dpu: revise timing engine
 programming to support widebus feature
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
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-22 16:27:39)
> Widebus feature will transmit two pixel data per pixel clock to interface.
> Timing engine provides driving force for this purpose. This patch base
> on HPG (Hardware Programming Guide) to revise timing engine register
> setting to accommodate both widebus and non widebus application. Also
> horizontal width parameters need to be reduced by half since two pixel
> data are clocked out per pixel clock when widebus feature enabled.
>
> Widebus can be enabled individually at DP. However at DSI, widebus have
> to be enabled along with DSC to achieve pixel clock rate be scaled down
> with same ratio as compression ratio when 10 bits per source component.
> Therefore this patch add no supports of DSI related widebus and compression.
>
> Changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
>
> Changes in v3:
> -- split patch into 3 patches
>
> Changes in v4:
> -- rework timing engine to not interfere with dsi/hdmi
> -- cover both widebus and compression
>
> Changes in v5:
> -- remove supports of DSI widebus and compression
>
> Changes in v7:
> -- split this patch into 3 patches
> -- add Tested-by
>
> Changes in v8:
> -- move new registers writes under DATA_HCTL_EN features check.
>
> Changes in v10:
> -- add const inside dpu_encoder_is_widebus_enabled()
> -- drop useless parenthesis please
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
