Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1185B1174
	for <lists+freedreno@lfdr.de>; Thu,  8 Sep 2022 02:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE31110E911;
	Thu,  8 Sep 2022 00:42:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E04110E911
 for <freedreno@lists.freedesktop.org>; Thu,  8 Sep 2022 00:42:01 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so25396203fac.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Sep 2022 17:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=6kh9ikwWaThXq4seCLNDajay+f1HdBOkIbkGH9umXJw=;
 b=kvBYxdrbSayvPbBqEk92BZ7Z8UmortMyc2HyEOsM/6KOEBt/U5Oo5+olLwauurChcT
 dWbN6R2iRtz19PlqNfH8x/NJxV/Rehv3/XPsPajdRvXc7+iUSk5Vx2JyIAvYcYlvMAjx
 2oc/JST9OpF8IBS4yY3vZ8SRdKgJKMVaO7KJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6kh9ikwWaThXq4seCLNDajay+f1HdBOkIbkGH9umXJw=;
 b=3ujkf1C0lfTPxZqZKBQ0tOivQpPm8HfV+QiQhM4NCLUodHzuBuPZAj+HeaE5dF4U1L
 AylfLKAQ4oPw/FgJMCYTlSngMPqsEiPWQnv6s/0zLb81xPAUeY1O5yBN+c78bPb30fRT
 2OcrdTKwLV/p0mgOge7uYtLSRPJF+bqgcg/afHmXVk0ocU2p5oWjoDsPFV+lzX1RnmuG
 v0Tgfw7lxvdbeuG+1rZnN6Vdm7GHtR+h2vNPNedxjYJISTYdk9a/oUIvtXrZkqWxljNS
 Z5g5rvGOT5ibokjTkTwktHG1TKipqofQhKUCGuJzyQqUgzZmCqkszWUDYO5Bb/gTxeYf
 Gupg==
X-Gm-Message-State: ACgBeo2UUym6pO0Y6nKZhyIePjl11dSb1rPUl4QRHT4HYSuySM6rzIbP
 ciqP0MUjTwnIJJa27tYMIJGHxVCbjLWzAwI7ErIfjg==
X-Google-Smtp-Source: AA6agR6GDd4jOsqjCzVR3yOFzs56YJqWoGpuOidx2GfpBymcQROdS9Bv7Prd4st7kf0kWSuZiyFu4xIeT7K6tYmo5N0=
X-Received: by 2002:a05:6871:6a1:b0:127:3a21:7e00 with SMTP id
 l33-20020a05687106a100b001273a217e00mr597166oao.44.1662597720814; Wed, 07 Sep
 2022 17:42:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:42:00 -0500
MIME-Version: 1.0
In-Reply-To: <20220901091527.1992208-4-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <20220901091527.1992208-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 7 Sep 2022 19:42:00 -0500
Message-ID: <CAE-0n51Wh=pT4G=QRFNu_v5hMQRvS55sGWKT=zvrJS=nSB4Tng@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 3/3] drm/msm/dp: move dp_request_irq()
 call to dp_display_probe()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-09-01 02:15:27)
> As the MDSS registers the IRQ domain before populating child devices,
> there is little point in deferring the IRQ request up to the
> msm_dp_modeset_init(). Following the 'get resources as early as
> possible' paradigm, move dp_request_irq() call to dp_display_probe().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
