Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FEA3F0C67
	for <lists+freedreno@lfdr.de>; Wed, 18 Aug 2021 22:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DA26E8C2;
	Wed, 18 Aug 2021 20:07:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1016E8C8
 for <freedreno@lists.freedesktop.org>; Wed, 18 Aug 2021 20:07:38 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so5571521oth.7
 for <freedreno@lists.freedesktop.org>; Wed, 18 Aug 2021 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=cfm13iXUxECEplWQ0q6Pxak3YtFCZRWGUuhoBsOQF1o=;
 b=FiSrUv34t+HgydbQhzRo7RHOAQFm9OxrQI98LwsaMAeyJz41igKBAGF/7khk9DESSF
 2uo0zyzxy+hlRiFcu5axiGiY/bPo8RUcNImSiN3Kyq+BuI8hGe5+GFGRUA4J2mgdicgA
 OE3Al9FgiJ2bfV2UIx6fosxcF57TPy/3vdZ7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=cfm13iXUxECEplWQ0q6Pxak3YtFCZRWGUuhoBsOQF1o=;
 b=pCDtjAUrnfJByq8coTE4IJ2V+xPfWB4BDu0LpzkznxTnaLlbR1L4IY/nmcgBIca/KD
 cQ5soY+FT36KcdwySP3iFd7ZbAmuVNq8qN4CpFNYg9SjByFBnZ7wh7JV8lpmP0n8SQlN
 NFWEJFh02pnxkqiYvEXLDqGnNTpPJSbDwtWfR99E+aC6uzWKlpg/oTM8PPjfEJBH/Ux8
 g0w+p9yYms0XAKF+hSGYG2x5j0hHKjUbqRmlgB4j1rSz1hs/S40njOWI7RPzZmocBfNX
 l9RE8/XjuaAkaPFqBFXATi6MT7kpUGedfY+d+BQYyZ1fiS0WaiwtSLg5k1izvo1Cnj0V
 d3uw==
X-Gm-Message-State: AOAM533M6Xv2ujNceJlIEqEOuYyO3Jui6TLfkDKQE5gRgE1o/emXfyma
 dFDsAaV+zg+Vv9Iz/z/fTPGQdLPTztEvvqwvWTffUg==
X-Google-Smtp-Source: ABdhPJyELNhhchyiGz4aTzehMCOLQwh2D+h4c08VfwqU9GfrDc66h204pRTnxTXnauLt5QAn0FSePec2ZgVpt81vPKo=
X-Received: by 2002:a05:6830:2473:: with SMTP id
 x51mr1798273otr.34.1629317258305; 
 Wed, 18 Aug 2021 13:07:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 13:07:37 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 18 Aug 2021 13:07:37 -0700
Message-ID: <CAE-0n52r-+MjLO0o3JOWCsLHHWVOYNKnSuZYTwiarpJW-M643g@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, sbillaka@codeaurora.org, abhinavk@codeaurora.org, 
 robdclark@gmail.com, bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 1/4] dt-bindings: msm: add DT bindings
 for sc7280
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-08-18 03:27:01)
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI, EDP etc. Add required DPU
> device tree bindings for SC7280.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---

Please send a cover-letter next time.

Do you have the display port dts bits and driver code ready too? Can it
be part of this patch series?
