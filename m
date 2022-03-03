Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541064CC7E5
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 22:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEC010EDF2;
	Thu,  3 Mar 2022 21:21:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9271E10E2D9
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 21:21:56 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y7so6023974oih.5
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 13:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=u8F7qO2DIewFITLJ93GigBGQGuhxjcSS8uNlVM/WrZs=;
 b=FUNxvrjnrB/d5xJL+6gNtstATnjL7b0e2NggjjbefEJ2uWZiCg+QS3pnOOPOMhkuAt
 u4ZbCA6xXBRekcwZnyDYzBM+OFvnC4Mcwpokhm99mZvSb1/tUVuZ/DOU5o+Uu5nz7wte
 Hwq+wW6v8LTK8i0F3URgjHOH+2T3Fh47ZKLX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=u8F7qO2DIewFITLJ93GigBGQGuhxjcSS8uNlVM/WrZs=;
 b=KF/wVJzXyRuCf4+IesbP5L3/kVjY9ImVy1ProHcJvAX6KE4rxrBcQ3zOPzxa1NaxMN
 YtM92sj4Gs6IkHlBDD10d1RC+l4XaUlmfAKrQybQi4H5QXLwZfpenqTb4uGbI/RKOwtL
 sqnOrqFYvqnptugmGzqeB3WXn0qOu2lo/u9NaCjaYZZU83wbOGlS5iph9WN7fMCj8ojG
 UF5GEzCEihpTZ+wJK4vEDFhcPecvvnXR2dPqgIsQiVtyQmoGhDVR0XZSoshE/x3Peahk
 3h54aUbggfE9bbrCcuxYVhVNFu1hRuPHIYEqX6abzaK+KiciHmYYpOmTh2WtiQpm6f1V
 U5wA==
X-Gm-Message-State: AOAM531QbttDl9B+9q52wPkuttzFLBQI+tRfVNCdf5SCMuVPFMxRi+1O
 VsjXtImq+IBjp2AOFFeUNsHY4O39aObX/dnN8JaP/A==
X-Google-Smtp-Source: ABdhPJwQh/TsFdMQ8Nq+spfvb0hS7u3P5GakHbvhwCHrbUQ5jdokEhzF89sm7Ev5fs56EJT352zNf0RJeA6y30qu2AY=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr649700oiz.32.1646342515877; Thu, 03 Mar
 2022 13:21:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:21:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-6-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
 <20220217043148.480898-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:21:55 -0800
Message-ID: <CAE-0n50CABTnqjTw_SdHOrLK3C8-YtQAeicYU844cJAMHWa4iQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/6] drm/msm/dpu: remove struct
 dpu_encoder_irq
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

Quoting Dmitry Baryshkov (2022-02-16 20:31:47)
> Remove additional indirection: specify IRQ callbacks and IRQ indices
> directly rather than through the pointer in the irq structure. For each
> IRQ we have a constant IRQ callback. This change simplifies code review
> as the reader no longer needs to remember which function is called.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
