Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224174B9491
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 00:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B32D10E628;
	Wed, 16 Feb 2022 23:37:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B740C10E4D3
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 23:37:16 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so2746297oos.10
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 15:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Oe5Kgz/mXiBfGR7RpzB+SRCxWVkPZLeMHIEspnpgrqo=;
 b=Ku5w335Kto9e9IZrmFimPGs+b/iIGrUX73Vo6Z44mjCV8U6rWgGs8tj8L6T6QDmt5n
 MprJn7WT/14efmyzWpO5DXo4o5hV8D+l/dhhfsUHVDUXDdZaqxOzjE7eGlGM9qpB2EPW
 gMe2WRax+kFwYAj9K1eEVMnJcJ20mhrqTHsIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Oe5Kgz/mXiBfGR7RpzB+SRCxWVkPZLeMHIEspnpgrqo=;
 b=MJmL4eyHNzLjtoyk10XE7+up75lUNiGQeEusduHj9aSEfZzG3qad+6r51jsP7yHzH+
 j9500GvL1sKx9dDdLg+i1RyofILiJxtWzaj7ZhnfysGRWKzYHvXgjeBHsaYp8tMKanmE
 SPBNP0u9oLpgFiqTYAi2w+zBpxsCqdfipfao/xgpusvu1GufsSnZYfCHaFdDme5Z/it7
 FITruDkX4kAtWWd445gHyDA8LTubFFpdtqKtItjumAMCwjP6nz5nBPWQ+q2wSThwzFmt
 ZXyaImjAKpqm+aIF9TJK2LCsy82nSY49YAsT1Z2NBBpa0hWJpLgEXwaV7qp4Avp6iiIQ
 lm7A==
X-Gm-Message-State: AOAM532YNYnPHRctNmohMEUxjiQVcpGFuUFE21XtV5mQ1ECa4Tol/BUH
 wihYPr2t/De9nh6LlsFQMHA4pd1qmhxzJfbCE3TVqA==
X-Google-Smtp-Source: ABdhPJylun9DD0LZkQln6PAhGLyEfeA9WcQSNQlo+FLp376qtCoDluJNpTqVTuJhn94pxdcsN6ndH0jUX9bW7NquZh0=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr108306oao.8.1645054635886; Wed, 16 Feb
 2022 15:37:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 15:37:15 -0800
MIME-Version: 1.0
In-Reply-To: <1643828199-8564-2-git-send-email-quic_khsieh@quicinc.com>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 16 Feb 2022 15:37:15 -0800
Message-ID: <CAE-0n52LS5Np72MQeoX6L2=1LWzn=NDrmJJGZj629miMxrp9TA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/3] drm/msm/dp: add connector type to
 enhance debug messages
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

Quoting Kuogee Hsieh (2022-02-02 10:56:37)
> DP driver is a generic driver which supports both eDP and DP.
> For debugging purpose it is required to have capabilities to
> differentiate message are generated from eDP or DP. This patch
> add connector type into debug messages for this purpose.
>
> Changes in v3:
> -- replace original patch into 3 patches
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
