Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F14CC7DF
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 22:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBADA10E2D9;
	Thu,  3 Mar 2022 21:21:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B65D10E2D9
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 21:20:59 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso5778431otp.0
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 13:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Hwl7I4m0IAvH1IB5uiBYfdzL/5feDwEgsR7JKnlSjLc=;
 b=EAD636OXNSgrT0qYQwzcqOKBCCy5FKrDC+5Mqd/5OU2KBWeJSLDS8cpBaQq+Ah6bdP
 AdNMyTuBY30ce0lGFZbNQuEaQkG1qxqmLXUUsz2TWfRbuv7dFi1jsu8zhp/Kx3zAZTjZ
 xwPVNzDymKn5yvoqPzCnyC2DOIZl0LZ/wk3eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Hwl7I4m0IAvH1IB5uiBYfdzL/5feDwEgsR7JKnlSjLc=;
 b=pXM1i/nC/jIgL7LVZegd+RbFkR+03SLLy9kRJRHcAfA8IZHeV/31JjVTPkx+hEpD3y
 5HQFRDYlAbZa4QLj0zDP0RDEmsLfKJsMAvU931020SlN/mqBUqGDbvdwgVEMWX/ASotq
 lN7Mz7W6uq47zxkvcIUz/pzLHe/a+31UmuFrjYk8fG0x8oNb5mUWarlbjRiDw101oXvh
 wrBIF3FE503xLntIDldNVfwfhD8N3J/1odN9p+zEBCaCB0VFf8iTIuFP87nmyKR8Ak4h
 18WNuPCWPHKKm/ifsyQrRw/SvcQXNqT4pVeCf6FhAvhry7ARpbKV9g2t4NCa9kLB678H
 MpeQ==
X-Gm-Message-State: AOAM531UotmbfosZoBhMlTbIq9tDy2cYhkDRIbrD5QGrxHX6k1x1vy1/
 aesGyR9zascCXSTtDxaRO7cOx8g04Oy1VW3oyL5+dw==
X-Google-Smtp-Source: ABdhPJw56B13uigu/hY5MG0oWkkMDqQ9qp7zzpqRCMOe29550tcjSwDProBE8u06q7bGyfbwjnolaU+cUTWXk6a4eOM=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20539994otl.77.1646342458677; Thu, 03
 Mar 2022 13:20:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:20:58 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-4-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
 <20220217043148.480898-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:20:58 -0800
Message-ID: <CAE-0n53q2BKcZPUwsesPxx6KktTsakpbjnJQzUceE+fFzWfe8g@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/6] drm/msm/dpu: allow just single IRQ
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 20:31:45)
> DPU interrupts code allows multiple callbacks per interrut. In reality
> none of the interrupts is shared between blocks (and will probably never
> be). Drop support for registering multiple callbacks per interrupt to
> simplify interrupt handling code.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
