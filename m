Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C9451AB6
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 00:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A8A6EABE;
	Mon, 15 Nov 2021 23:39:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540466EABE
 for <freedreno@lists.freedesktop.org>; Mon, 15 Nov 2021 23:39:28 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso30287375otj.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Nov 2021 15:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=0r6JTcdejGzU6nsZn/1Xqgl+XNT+bHSUSIJqwEF6P5I=;
 b=HWhPucp0iue/5BCvKtcMziH/SE9slJFIAE5tlwez/Q8+1HJGha6SJ8GlkG1CmG6s2+
 2R8+3Sl6It+RGVDcidgJqLZWNNfZsyBtflsD+zEJGUXer2TuehVftpnXkA8dIPYwAinn
 N29XMNSd/DijdWsqj5XEMxPosQuePaHFfYE5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=0r6JTcdejGzU6nsZn/1Xqgl+XNT+bHSUSIJqwEF6P5I=;
 b=wABd3PQulsXJWo4xBc8Zg8XzRNlnMowTvBVoj5BD3bVSkGFkPLiFim9SPlkgpKic/X
 NMYsYcrlvIKGZHn4rhDsOKJ2ISVJmrHiGSVOQMAcrJEOPyqeLm2MUA6OeIBm650JwGaa
 xcNWpWcMDiLmMroVKAf8fEFF2b85klRq6uEq88AwCks+XKUbvuPI9xzd53rCs+yxrkA2
 ga2yBP2i0b/QyJ0cmFxLp1a4HNfctCcB6aFRvzZCccdKNdLf6e5wqBDSAq78R4eh6cE9
 aaLukYXS0+wAwW+vTEvx547t6KV7U7jKS+DWc4ddFh/fPKjKvDOyiSmpl4D2LRFjvljD
 fb3g==
X-Gm-Message-State: AOAM5324EV1V84KXOiPKmZRwTpK/30pzjc2xLAd48bVt4ahC+SGCWCJk
 gt59QNR11v8hO0/w0ZmEmkbQiGG7B25kfqjON8axLg==
X-Google-Smtp-Source: ABdhPJzC1gjX/8UQ6va8Dux2WwnKx59xgq+wgXAUVpZ1ewPHwjoYDMuhWR0XxIu9/V2evROn1oFvLn8lYWyyy69HTTs=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr2383170otl.126.1637019567581; 
 Mon, 15 Nov 2021 15:39:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:39:27 -0800
MIME-Version: 1.0
In-Reply-To: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
References: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 15 Nov 2021 15:39:27 -0800
Message-ID: <CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] arm64: dts: qcom: sc7280: Add Display
 Port node
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
 Kuogee Hsieh <khsieh@codeaurora.org>, quic_mkrishn@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 quic_kalyant@quicinc.coml
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-11-02 16:44:33)
> From: Kuogee Hsieh <khsieh@codeaurora.org>
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

What tree is this based on? I don't see edp_phy upstream for sc7280

Otherwise, looks good to me.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
