Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C1486F03
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 01:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFB710EAE5;
	Fri,  7 Jan 2022 00:42:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE02210EAE4
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 00:42:56 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 j97-20020a9d17ea000000b0059069215e85so4917769otj.13
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 16:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=atmy/2mmGjhretVeVMp74eCFRlSY7eexCas291LMZiw=;
 b=NEiXtpzIJuq+ddFpchl0oDBsQdYqF3ZwrJ1Z9bI2KF6RhAXtf6kT/kQNI47at2IwP/
 l1m12sBm7I0PKdUb5mYnnhmwyC/yCkoFP8A4OgzXriBvskbv8Uy2OiVBEPyWKA0koY7v
 SQaIXX0x9DVrDMiBFkxxPKgqP4rLOELY+yjos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=atmy/2mmGjhretVeVMp74eCFRlSY7eexCas291LMZiw=;
 b=0wylchcT6XpKjMwOfIzuUtmMUPMx6cEkaDpeZC/M+djF1YyJPA0jBQ4jQH1pwlfrDp
 eqURrsyiQJHEtpT95BX8YHxgn28vDhEmk5IBJTgIK6UjmJApBRtHUVQd13yNaFJLV3NH
 cxZC+2uTYxrW5wDC8HdyZgomSD4Ak9yZMgt6OXC+ZLs0RpfoWZ+1N/YJZoGTl4RUEIER
 FW4dYD+JCeJp/dPq7ZiPlr6oZpVfeAWWS9+Cmj5SwLkma/duyJ/ETQBgjK2RKHfwasIY
 La2U9k5BQi7PKDOZ9iWQHnNnoCBAg6TgpTr3HwWcUkNxMoC/5EuMVok/wO6K4BlJKDRo
 w4bA==
X-Gm-Message-State: AOAM53115TRgkd54ZCjs698v5kDfC7OeNDwHQD42dBMoSRBaVeXJ1og2
 BFjpLIX+La1P6QkuZjJbNGF6Bsbyd+hojwlpKGA+Ow==
X-Google-Smtp-Source: ABdhPJwJhNLwPLZG+/uY/kFkbWi+NrpEY3Hn0S30RIpjujh1b5HQTqu0pBhZNq2rsXfzvl4xM6DSc5QrtZqfeMjP2ts=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr3893260ote.77.1641516176125;
 Thu, 06 Jan 2022 16:42:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:42:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
References: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:42:55 -0800
Message-ID: <CAE-0n50d3WFYW1eRtpOF77j9vF89Dku4WyBj1xT9OP90x4wihA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm: reduce usage of round_pixclk
 callback
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 23:06:56)
> The round_pixclk() callback returns different rate only on MDP4 in HDMI
> (DTV) case. Stop using this callback in other cases to simplify
> mode_valid callbacks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
