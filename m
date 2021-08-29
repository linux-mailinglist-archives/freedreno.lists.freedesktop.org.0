Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7793FA98B
	for <lists+freedreno@lfdr.de>; Sun, 29 Aug 2021 08:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F11A89F3B;
	Sun, 29 Aug 2021 06:50:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E6D89F3B
 for <freedreno@lists.freedesktop.org>; Sun, 29 Aug 2021 06:50:30 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso13933741ota.8
 for <freedreno@lists.freedesktop.org>; Sat, 28 Aug 2021 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UcZsfTL7lo6QG03jH0zcLyA1nl3b2l6q7cLqiJ7RM6w=;
 b=C3yZviTdjca8Y6g3vvGkt67eBiVQkzTNyQJZ3Hymfg7j6b8YftJ/j/4/JhVjbttF+A
 Dc5OXJ/rbmHT1kJVqGDi/xWwlbLezhdODZyt5xaSP66IkqgULSKpdks+hB8VQ0i4H7lF
 ktUn5uKtG2eTCU7ZiZyyFbiOC4l/K3nw2Sjrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UcZsfTL7lo6QG03jH0zcLyA1nl3b2l6q7cLqiJ7RM6w=;
 b=uoKCLD6t25o+4chDfQyhUnHdFKBG+D0E+9pA4UBOrv59e2KwiUXAU8Da6vAGEVSGkQ
 mRh7kG+OGbIE2PucQscXb3OKibOkYpJPmO5BVX6Br74gvkjwC44dLKnJlfQ3wKQoGbcA
 lDHHmLQIzAnoaMHDUpzATqP1wc7inyruxvd1sf8sz1QfbuQUub9VJTua6ICdzpAygmM4
 ZH7huV7ZOSjPH92rGoaArC2k/GPUpdZpK0AFEWLN0IJmNIqpkzbcxG8aOp83gWmhHE1E
 noxGO/zUGqoLqeePtzO1BobTQmoIN9S6Jsqa/rOEBHLZo/wrQySVlSqkFCc23rAcfjSn
 ihDA==
X-Gm-Message-State: AOAM533sITRs0R4geUkfPMAG7hL2uXw67AQfOoKlUov07ixQnMFGGenW
 nLLA6B9qOAdj69RwT+deaoniFa/YGIHqVQyyrbGlMw==
X-Google-Smtp-Source: ABdhPJwt0axpFUQul8bw0k3jGfLZe7Fjddj2YcPWzVIguNKXiCod9lEN608fOnSzy15l8/WSbOgeRxJUsyLHYpXYzJQ=
X-Received: by 2002:a9d:5f85:: with SMTP id g5mr8562392oti.139.1630219829726; 
 Sat, 28 Aug 2021 23:50:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 29 Aug 2021 06:50:29 +0000
MIME-Version: 1.0
In-Reply-To: <1630083934-9361-1-git-send-email-khsieh@codeaurora.org>
References: <1630083934-9361-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sun, 29 Aug 2021 06:50:29 +0000
Message-ID: <CAE-0n51tzL8T2Zoqhu7CqEWRpaCBpRmy=+PZ-N8tCmFj85nbww@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, mkrishn@codeaurora.org, 
 kalyan_t@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sc7280: enable IDP
 display port
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

Quoting Kuogee Hsieh (2021-08-27 10:05:34)
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

But this must depend on the patch that introduces the phandle to begin
with.
