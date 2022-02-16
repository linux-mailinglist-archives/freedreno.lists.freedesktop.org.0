Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9A4B7D15
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDD510E609;
	Wed, 16 Feb 2022 02:17:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4A010E607
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:17:02 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id ay7so1013736oib.8
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=kde7/XTU2PafoBmMQBQwevj0YqOlB5phYkdEBWwVR9A=;
 b=bvqlVe6XuOA3ar+rEW2dBP1EAEFbjSwGHM1QVbj8l7WMsI/iU/k4xTYgJWnYJvLZlO
 eMnu/BfVID/vb78QwtAg6U8CX4y5yUWrd59H8cb0/7MJOFWn/JwYBS+bOLpfDV1NKx7G
 3KnxWbAq5bPPlJtKKbe4JRMaZUXK4I7zXLQQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=kde7/XTU2PafoBmMQBQwevj0YqOlB5phYkdEBWwVR9A=;
 b=dCKt01iUXiJiXKeNsDzdzcIqayjMJvnN1FiNJWXNNoLyZYDCZOtMyn1JNMOXkmGg+s
 ZVsnAo5x+tEz/YidG+o+7zQGI3rzBwZEOAQC9Z638wWXZKSv/EDePVqVni9EHI59ObWN
 tfonnw17+oqBu9wnT2mt1xVans/FtNBvlienNUioik379xIuDhTXVDRrlft1Z9whmjAd
 tLGXTnMKTQ5cX9cjFWJXcqFAGCmplqXEvfDmiTQwsPnH1NR7m/6Aaq/Hfz1OatoLjVVt
 qByki3PmgM+1HEJo0PhSDwJQD/cgjRHok2Z7GbRpIRpw3tKyyup3sKCWYAVqa+JdwmVX
 QrUw==
X-Gm-Message-State: AOAM53192lXPhiLc7ko4+m7DStDQF98Rv3MhYDPrqCWHKE4WepNjG4uJ
 hrofDPuqrcS0puueKeZn8T+Ytgkjk1XU53HIaAjkeA==
X-Google-Smtp-Source: ABdhPJz6zcCH239EpdIWwsMam/u/vKcry0Zx2rcbSzYb05td5YLCxSpA8S8OJpW9NYeWmOdrWRrJ1BdfylJkNqL5eMw=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2972963oig.40.1644977821830; Tue, 15
 Feb 2022 18:17:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:17:01 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJpqhKdYBisj9qEExKX20zPLpBnCs12FAYYSTo89hcXa48Q@mail.gmail.com>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
 <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
 <CAA8EJpqhKdYBisj9qEExKX20zPLpBnCs12FAYYSTo89hcXa48Q@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:17:01 -0800
Message-ID: <CAE-0n52whdW5XZ0LuemRkGv9nEZcV9wutUVmpNCZn3sYtJ3xsA@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 7/8] drm/msm/dpu: pull connector from
 dpu_encoder_phys to dpu_encoder_virt
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 18:13:09)
> On Wed, 16 Feb 2022 at 05:00, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> > > All physical encoders used by virtual encoder share the same connector,
> > > so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> > > structure.
> >
> > What is the benefit? Less code? Clearer association?
>
> Clearer association. Otherwise code suggests that different phys_encs
> can have different connectors.

Got it. With that info added to the commit text

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
