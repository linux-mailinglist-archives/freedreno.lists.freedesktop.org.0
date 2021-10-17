Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C64305DA
	for <lists+freedreno@lfdr.de>; Sun, 17 Oct 2021 03:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCD66E56D;
	Sun, 17 Oct 2021 01:31:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0A56E56D
 for <freedreno@lists.freedesktop.org>; Sun, 17 Oct 2021 01:31:00 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q129so19180656oib.0
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 18:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pehrrn4CE1KsK/Wvnw1j9FzE4EFmgiJ0jUGBDx8V0oc=;
 b=jO/Re6SWrMiWh6YCN4NXmVGAQeDRrqTn0L11tV5oM5KpYFd7HL24z3FJ51WWAUeaD2
 xZwOxAT0W153OezfwQqRdclZFPto3bFdMOeZl5swnzbnVTtITUR0IgZDv15etyqMSHaR
 3YK2kbFuBJSqBb1UXMZrb698eerNLnW+WjRRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pehrrn4CE1KsK/Wvnw1j9FzE4EFmgiJ0jUGBDx8V0oc=;
 b=Fwb9eYm0RfJPvAmsivHRfHJKrn3w2SN3hO6UiqkMyhPRfbUMgDfgGrNSydf0mhaZs2
 l2rBnE+BU1UYz1HtdkbyoKAKHQnReY4DrCCQVkEjQl7gIS9tGcsiVFvasURDhhIEkhmr
 9Pzx3o9YUciOmihmS5lHI+cKVEhtZEN/ooypuG1bKsMm1t+ucoAq1b01utUwQiQ7WqWB
 wHQm6fh48zGUAGPQrp9q6LbXawWsMCt0f+xoVUNPzBkEpS2ykq7PkwKl5J0zTXL/nsDD
 3IHM3D6GOnGtGvDVvFGPYR8wUp1bGWAOyRQU9enqQEAik4Rnyzoo6HREPaolJBHAGlQW
 RygA==
X-Gm-Message-State: AOAM5322JNYKHMTP9pjkseZAGQC7sAWFqN/cXQIbJUoCm/eHzVGtusLW
 XdkfZLQ8NBQ3ItMOhJL6z3PZ1sNTVAudRFhH2IshTA==
X-Google-Smtp-Source: ABdhPJxy3t88xA6iK1Cjxtpt3um/UJTTxJMSRlcJVLLf71yXQYnhIGis19Js2+/b9dbn0rWz2Jqdc5iE1C4ar6o7380=
X-Received: by 2002:a05:6808:230f:: with SMTP id
 bn15mr14832128oib.64.1634434260154; 
 Sat, 16 Oct 2021 18:31:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:30:59 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-5-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-5-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:30:59 -0500
Message-ID: <CAE-0n538PL-JJgMCzP3yc-Y_9qbsHWhtfbcXxh081eFg3QgZ1A@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 4/7] drm/msm/dp: Allow attaching a
 drm_panel
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

Quoting Bjorn Andersson (2021-10-16 15:18:40)
> eDP panels might need some power sequencing and backlight management,
> so make it possible to associate a drm_panel with an eDP instance and
> prepare and enable the panel accordingly.
>
> Now that we know which hardware instance is DP and which is eDP,
> parser->parse() is passed the connector_type and the parser is limited
> to only search for a panel in the eDP case.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
