Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A1446AEC
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 23:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B526E84D;
	Fri,  5 Nov 2021 22:33:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B15A6ECD9
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 22:33:03 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id bk26so15522727oib.11
 for <freedreno@lists.freedesktop.org>; Fri, 05 Nov 2021 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fWPW6vOrV4yWuNKQyKDDkLamXrngpvFNOzlcY43dNqs=;
 b=iKVG85gppzXqEaEOcL5Bb84m05PjYOdlnIwqPMXq+hWd3vGImllScnpAoM8rou02x6
 zYzmGPkKPG7RowxQPg4xyPG3c/FKplaDd2p/I4ccOzLnNlzFKWulOb4CUOHAjMOZBCG/
 axL+CUfZ9a8YWytneRUIm9D4Wx2ZZB7f5YCZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fWPW6vOrV4yWuNKQyKDDkLamXrngpvFNOzlcY43dNqs=;
 b=h0+pHV5FPgbV59hdJol568UaYlFfJxXVv1uX0nNo/BAUZLvRlyYhOI9vDk+RH9vO3V
 UdpeEYewircz+b3Xi42ZlFF3khoGjnyzTFFptnR8a2vJmVGtp2qSreGSTEB+ZT8O8EZW
 2O5M7XLKql45hAtpyaAmb2S40/iu1z3QGsZRXLK6QPDSi+XlVDeBkfg3lVo3Vc4PG7t/
 5LOr8GO9K1n+LwtXYIY+9KivqM7Xe/iJGx/ruv/fjADOEnT9z6Y1ZnSU/swKAb6AX1WS
 QtZwNHVOxQoOkyBO543ff9jlVu7BZwwM897SZiZTyguqonl5HKgMSv0YIYUBocjfB8pn
 9Djw==
X-Gm-Message-State: AOAM530DoaXAlrtpw33ctOxJscW4so/Z7CDgnZYfS/Vj1gvtsHmgFwiN
 khCN5SkGde/RpwitisbG1xyKUlfgTxVpjWRsPDdS4A==
X-Google-Smtp-Source: ABdhPJz+sZay+XktcSS+5myteHfFnaSYRjh0L2fXVqz51OpDz37VcMg34X0qvr4jMDBdhRGzkOJ7h2s7RmQz9/39vB0=
X-Received: by 2002:a05:6808:a96:: with SMTP id
 q22mr16520113oij.164.1636151582339; 
 Fri, 05 Nov 2021 15:33:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Nov 2021 15:33:01 -0700
MIME-Version: 1.0
In-Reply-To: <YYVudQzp8Kxweewq@ripper>
References: <1636133291-10551-1-git-send-email-quic_khsieh@quicinc.com>
 <YYVudQzp8Kxweewq@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 5 Nov 2021 15:33:01 -0700
Message-ID: <CAE-0n526B0_ZyyPs++cVUHy9w+ruadLY7BzYuDH8acn5qq6A_g@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not initialize phy until
 plugin interrupt received
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
Cc: airlied@linux.ie, freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, agross@kernel.org,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-11-05 10:48:37)
> On Fri 05 Nov 10:28 PDT 2021, Kuogee Hsieh wrote:
>
> > From: Kuogee Hsieh <khsieh@codeaurora.org>
> >
> > Combo phy supports both USB and DP simultaneously. There may has a
> > possible conflict during phy initialization phase between USB and
> > DP driver which may cause USB phy timeout when USB tries to power
> > up its phy. This patch has the DP driver not initialize its phy
> > during DP driver initialization phase. Instead DP driver only enable
> > required regulators and clocks so that it is able to receive HPD
> > interrupts after completion of initialization phase. DP driver will
> > initialize its phy when HPD plug-in interrupt received.
>
> Is this a hardware requirement, or is this a issue with the current
> implementation of the QMP combo phy driver? We should not hack up the DP
> driver to circumvent the latter.
>
> Also, I don't suppose there's anything here that prevents the HPD to
> come before the USB PHY is powered up? Even though that seems less
> likely in practice...
>
> > This patch also provides a positive side effects which balance regulator
> > enable count since regulator only enabled at initialize phase and resume
> > and disabled at followed suspend.
> >
>
> Is this something that needs to be fixed separately, so that it can be
> backported to stable kernels?

Agreed. Please split the regulator balance problem from the DP
initialization delay.
