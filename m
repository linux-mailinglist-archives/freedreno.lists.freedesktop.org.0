Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09284CC84F
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 22:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605B310E17C;
	Thu,  3 Mar 2022 21:45:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8005F10E7AF
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 21:45:50 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso5783433oti.3
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 13:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+D9KZ+TZBc5mJAc5ZBrKXdGjjaQ+oV8E1MHR11bjfGA=;
 b=aHSIQO3gotT4d2PpILUEdU0BlfMPsE64+4FBQZTvhbuHXzA/PE8no/nyZDE5dJmeZB
 yxIm+6s7NrD70OFZ/CUSCAx+1fE4dQoUOCFJ58Uy0DvCbKBPAYG7Iq/EK5v8dz2rjWxA
 lKkxjyo5UqbV6PCtouphV8t8jfY9fnISZd2bf5icms8GL7MEZqvtSgRaseo6yqbcl2Ng
 WnmCRAR1lbHkUvSjDjWCV7EjnitYX54dATUWAz5PHBbERYfnDBWgJlVGjqvhul+TxQ6Q
 Gk8ggxAsj+T3IfL/HerbcxR4DCuKPXsbMJZjMGWGTar46vqfG/K/rwxBsKzj/ywvMwye
 jvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+D9KZ+TZBc5mJAc5ZBrKXdGjjaQ+oV8E1MHR11bjfGA=;
 b=Ot0cZzrIolstxCPAOie7CvKpmHsVApcZt9bJZ/uXoPJEmNrDNID3qrbPe+BL9pqRYW
 NC72VK5EYcV+0Gvl2zTzX/F3YI5ql9DE5pmfeLD/l2T98hzaYNJFuvBOCKiLqDwID/+O
 57UCiWulejbjlkfWrUmdb36DTfaO4kVukKsipGienR4tE/csUuPeV/05+5kc4aFNGHuR
 qXoPB6S+1/NU21h4OoF7fvdi0BG25GldPLueQDparqs8Yxm4P5+uqZlHfLN2wgH1TdQk
 s9GDfpcpoGkAiliy5JDtgdcaVVHPHtCEtbqzVM8FeJDa1WYjQwsXkpRqC+/XCpEhYq94
 bbQg==
X-Gm-Message-State: AOAM530MOnvA+aj94tTLXIS+n7BROk+dZ07FQpXVdnx93dIrrLjrAEos
 wt2K3HT7SpPJ0ixfvGKhk+EOOg==
X-Google-Smtp-Source: ABdhPJzo82QXMbB5D2MSX2V622d9vJLKLZ2JgZW9JJZBk9T6Ti9H7CWqa4bozUVh5GJ3dUMXWFTG5A==
X-Received: by 2002:a9d:6a43:0:b0:5af:6595:458c with SMTP id
 h3-20020a9d6a43000000b005af6595458cmr20511219otn.241.1646343949729; 
 Thu, 03 Mar 2022 13:45:49 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a9d5cc4000000b005af6f4ff5e2sm1526906oti.61.2022.03.03.13.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:45:49 -0800 (PST)
Date: Thu, 3 Mar 2022 13:47:38 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <YiE3eqkUCLSFMUOv@ripper>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 03 Mar 13:22 PST 2022, Stephen Boyd wrote:

> Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> > This is the second part of
> > https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
> >
> > Changes since v1:
> 
> v2?
> 
> >  - Fix warning ins dpu_trace.h related to
> >    dpu_core_irq_unregister_callback event
> 
> Any plans to migrate to hierarchical irqchip in here?

I like this idea, since it would give us some more visibility, both in
form of /proc/interrupts and the standard irq tracepoints.

Regards,
Bjorn
