Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1134CC7EF
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 22:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8E10EDFF;
	Thu,  3 Mar 2022 21:23:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DE210EDF5
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 21:23:09 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id y44so2724604uac.11
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 13:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7SgYE66lSNBfbXKtYfPMd2eJnZt2Qn9IBmBY69OkvEA=;
 b=c52FFpOC3IxjlPN+Nc7NzY/iyzvsZNDOgW787F/Z/O1kbfR1FINg/yN3D3g9pSTbn1
 Z1WmCOZw0/B0jL501VnE78SO4m/3NAkK5Sf7tfJwh+fUBxvsu6k4sDzrzklX/73lba+A
 5O7cTjy06XwKfomgibRsaCoG8vXusZ+PyNcuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7SgYE66lSNBfbXKtYfPMd2eJnZt2Qn9IBmBY69OkvEA=;
 b=Z7eY1HosmIDBR+cRh7CkaQHYs+I09WMv/i/XsDFs7h+CR4nsPkA7dV9f5eQrDdMh7K
 G6dgF2Lrt8FVvh0cewyMUjRruszg9EkDn4YpXNO4Y+35AhluvozHfo2+bZ1gPwIdmLjc
 6nwqzkKfyg1WRCMq8XCNvvv+Z1TB0va58DTbDDxRyGuGhC2Pzyio6/uX6hIzCRiBA1GD
 3awciqqwifQQRJE/j6NVLPOoBpBKo+pX3A4Btn7kkAz0StF/vh0wkpPYpUI7Dn2Nih0G
 TA4zMRyZy44Co+Cm1YdfvsIMzWOPgkINTiEZXdH4farwl8myiGfUGubHzE8xguhjUpqo
 MEKg==
X-Gm-Message-State: AOAM532lGq40y5HEgiQI5Knakmm5xn8hDEutpEY/EfFibf+WVaSleOGr
 6RanHJMJtV2Ki+kAb2lhAA9ToVBMHxV5Q8WYIJmr9JMTgyM=
X-Google-Smtp-Source: ABdhPJzKDqUE8CMsgi/yYVdb41bUuclCz1cIqjPcyZGDL4j77+L3k0NvYP8fE3Y23DScOxA2sEpMU/dHPZTeU3/V3IE=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr19679471oon.25.1646342577179; Thu, 03
 Mar 2022 13:22:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:22:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:22:56 -0800
Message-ID: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
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

Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> This is the second part of
> https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
>
> Changes since v1:

v2?

>  - Fix warning ins dpu_trace.h related to
>    dpu_core_irq_unregister_callback event

Any plans to migrate to hierarchical irqchip in here?
