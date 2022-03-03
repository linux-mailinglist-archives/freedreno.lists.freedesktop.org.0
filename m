Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B694CC865
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 22:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7610E20F;
	Thu,  3 Mar 2022 21:52:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9FB10E20F
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 21:52:12 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id g24so5068755qkl.3
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7H8W+iRhHgP+pCnSQOjF4hQNmgpqnsMBxwOtw5ONNI0=;
 b=D8Lunl+P1XayMvWFGPMHQYu097oqvfILbigErXwqOgwLBbKtZycF9/9n+LUfKjiqCG
 psC0r6hbO7EOWq8kiPCUK6tGeckGqfUZVvcYldpC4NGnHFD1J+n2OctfkOOsC7xEiVQ9
 xjqri+didOFMYxx6FXIXiCvds9aDw3dhoWuB0GfT8nasQAluVBwE+KOpKQ1rI5T8GBK9
 tvmiZHbdjZRRhYvFa+Rp1iNNrFmG//Do4tZLx/tCIQZwFxEKlHX86GZyoIGkPFWbVD9J
 tge97PbNMDG9G5skmhv3PD6Gw6rK06l3C6rIdfae411dKfo/FYqv1JHFZm9got+3M563
 EkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7H8W+iRhHgP+pCnSQOjF4hQNmgpqnsMBxwOtw5ONNI0=;
 b=gwfX62lVNF9nDBhjzi7IQcmNFn97dq8KsoAcJCWZuy5M3qx1DBsbjnVrveblvzF/e7
 a2BfpcoX/8wt8zoQP+BmQ5N/7R3NXZlmzm12K7BixbW78bYNOC88V/ezNUlKH36ldfNK
 oQq5pOHS4EYf4q8jcn5RhOFBwKv9PcLI5a00a0+kXcWQHrs8rsRFP19ZRJapBEM4vkie
 qwp+q6zQkZSjdweVny9ZLfx+4/7l/EnoERcfQ+d5N/+DIxcpPGqtzpWmVkxu4wCcYqFD
 1xUTSSp1k/VlIJ1pZJc6dv4nKeJEdfk7epTHbHqQGDXpjxUOXDSDPHfDJzDy78JDKB7R
 oJYg==
X-Gm-Message-State: AOAM533sDcvIkc93c7JNa9LeKQ/0YjTVZNVcToBBeT+RMAscgu60GKFJ
 P5trN/wN7RsEap2qm9F3aUDzSeppM+vI01FD9yjDuQ==
X-Google-Smtp-Source: ABdhPJxOwj+3tNXzMiaHU4qnZoihRIXcuB3LLrxVK9tzS/R5Y4vbwr2p+GBm/Qq+c8tRTIsvJT8y+j4N85Uo+hCDgnI=
X-Received: by 2002:a05:620a:1673:b0:62c:da57:aa32 with SMTP id
 d19-20020a05620a167300b0062cda57aa32mr821322qko.203.1646344331420; Thu, 03
 Mar 2022 13:52:11 -0800 (PST)
MIME-Version: 1.0
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
In-Reply-To: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 00:52:00 +0300
Message-ID: <CAA8EJppziFTb-L=aSkr7nU8EwS=nv5rbX+aKwq8YZDCCvu2TJQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 00:23, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> > This is the second part of
> > https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
> >
> > Changes since v1:
>
> v2?

And the series should have been v3. Thanks for pointing it out!

>
> >  - Fix warning ins dpu_trace.h related to
> >    dpu_core_irq_unregister_callback event
>
> Any plans to migrate to hierarchical irqchip in here?

I haven't thought about it. I think that using Linux irq framework for
the DPU driver internals might be an overkill.
I'd say that it's not at the top of my todo list. However the point is noted.


-- 
With best wishes
Dmitry
