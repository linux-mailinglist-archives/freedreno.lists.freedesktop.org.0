Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CE546F07
	for <lists+freedreno@lfdr.de>; Fri, 10 Jun 2022 23:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46365113F30;
	Fri, 10 Jun 2022 21:12:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76A4113F36
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 21:12:32 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-fe4ac3b87fso760405fac.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eUw90MQM5SVuieh3UI6r6+Ffszit+OiITVtSMahiOlI=;
 b=PxZoMFPohd1GKquX3Z0yebjsbyodzL6Sc1YYSADroQz8Hm2TevBoKncjyGg2shlJqe
 Kt2jvBqIz83qvGPjgsU19YaG+D6Qom/vhBlROqhNcOjp5nqnRXCUN8z8ysEHYUNHZvP4
 ZY+0oNzWQLIQsNhMs6YyFQqnji2XBG4+NKb/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eUw90MQM5SVuieh3UI6r6+Ffszit+OiITVtSMahiOlI=;
 b=pxyYVmFUsOr61eDCBZnn9qCENGT8n9kI2NPRUwDXU6RidnmYv7GIgsDiJ4kzPjOw10
 d7umZRwtJCREak04uCtJKUCLdlra09O4NWLTFGeKRYxIsnHtefxblLuf6Ipx58hy+VBi
 nNX6w6c1V7/836c1NCFW3aYYokNAHTjzxtPDRmXNNzuNp9IB3SekEv18Bxh+x6SfEWBC
 A+D1AtjutgKUDwcG4jRzkBSOlTlD2SKDHYdsxY3kX74G0jJWfXlsYz+sB6JgFNjt8Xzh
 kgEud7XCLz5nmPzFidhUtIaJtt24H9vBkfXOkugHXpaEJbzvGe2ksscWBYejfArj5Px7
 eI8A==
X-Gm-Message-State: AOAM533EHerl57UwjKHWrse7GwoBE3T+8qj91gCmKDFaMNCXf2Kke6fp
 dFObF9S+I2P/BpyWCVxVTwV7qEY4KUvfewasBP9ycw==
X-Google-Smtp-Source: ABdhPJxFZZJBT4zmQa9rbL6oi07IG1L075UxWAqyTprFlgGRMHH3fCtuJiv9mMe6loLyhtjcJqcBOdO2wSQrhVr5se8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr895829oap.193.1654895551998; Fri, 10
 Jun 2022 14:12:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 14:12:31 -0700
MIME-Version: 1.0
In-Reply-To: <1654538139-7450-1-git-send-email-quic_khsieh@quicinc.com>
References: <1654538139-7450-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 14:12:31 -0700
Message-ID: <CAE-0n51hjNTcy5xpPknrtP3897qZkVqf9ksObxRF4v0Ej0=qag@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: check core_initialized
 before disable interrupts at dp_display_unbind()
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

Quoting Kuogee Hsieh (2022-06-06 10:55:39)
> During msm initialize phase, dp_display_unbind() will be called to undo
> initializations had been done by dp_display_bind() previously if there is
> error happen at msm_drm_bind. In this case, core_initialized flag had to
> be check to make sure clocks is on before update DP controller register
> to disable HPD interrupts. Otherwise system will crash due to below NOC
> fatal error.
>
> QTISECLIB [01f01a7ad]CNOC2 ERROR: ERRLOG0_LOW = 0x00061007
> QTISECLIB [01f01a7ad]GEM_NOC ERROR: ERRLOG0_LOW = 0x00001007
> QTISECLIB [01f0371a0]CNOC2 ERROR: ERRLOG0_HIGH = 0x00000003
> QTISECLIB [01f055297]GEM_NOC ERROR: ERRLOG0_HIGH = 0x00000003
> QTISECLIB [01f072beb]CNOC2 ERROR: ERRLOG1_LOW = 0x00000024
> QTISECLIB [01f0914b8]GEM_NOC ERROR: ERRLOG1_LOW = 0x00000042
> QTISECLIB [01f0ae639]CNOC2 ERROR: ERRLOG1_HIGH = 0x00004002
> QTISECLIB [01f0cc73f]GEM_NOC ERROR: ERRLOG1_HIGH = 0x00004002
> QTISECLIB [01f0ea092]CNOC2 ERROR: ERRLOG2_LOW = 0x0009020c
> QTISECLIB [01f10895f]GEM_NOC ERROR: ERRLOG2_LOW = 0x0ae9020c
> QTISECLIB [01f125ae1]CNOC2 ERROR: ERRLOG2_HIGH = 0x00000000
> QTISECLIB [01f143be7]GEM_NOC ERROR: ERRLOG2_HIGH = 0x00000000
> QTISECLIB [01f16153a]CNOC2 ERROR: ERRLOG3_LOW = 0x00000000
> QTISECLIB [01f17fe07]GEM_NOC ERROR: ERRLOG3_LOW = 0x00000000
> QTISECLIB [01f19cf89]CNOC2 ERROR: ERRLOG3_HIGH = 0x00000000
> QTISECLIB [01f1bb08e]GEM_NOC ERROR: ERRLOG3_HIGH = 0x00000000
> QTISECLIB [01f1d8a31]CNOC2 ERROR: SBM1 FAULTINSTATUS0_LOW = 0x00000002
> QTISECLIB [01f1f72a4]GEM_NOC ERROR: SBM0 FAULTINSTATUS0_LOW = 0x00000001
> QTISECLIB [01f21a217]CNOC3 ERROR: ERRLOG0_LOW = 0x00000006
> QTISECLIB [01f23dfd3]NOC error fatal

Don't think this pile of lines really helps anyone, but OK.

>
> changes in v2:
> -- drop the first patch (drm/msm: enable msm irq after all initializations are done successfully at msm_drm_init()) since the problem had been fixed by other patch
>
> Fixes: a65c95ff88f2 ("drm/msm/dp: stop event kernel thread when DP unbind")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
