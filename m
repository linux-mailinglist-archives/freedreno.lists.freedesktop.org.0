Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D553C5B6
	for <lists+freedreno@lfdr.de>; Fri,  3 Jun 2022 09:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514F8113D88;
	Fri,  3 Jun 2022 07:07:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C52113D8C
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jun 2022 07:07:17 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id a67so1561780qkc.3
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jun 2022 00:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrmNcC6TdsKWj8VD7ouk/7eVvekqEu+n6Bwr3mVZDuc=;
 b=meILQzbHo5Zjx2M6ou0FXyt6wfgfvCSh9r50SoVG9VWHAnu5j4yLG/P8CLq/Oxczmr
 knyU69vgJhAw13DI6QTqxAK06oAyuQmwLWckqto53KtY5XZf7GamK7Jfj9pi2AL/4Sk6
 +RNEzQv3cP00lgYel88zHkXAcRI9uFEqx2I18Y0S0LMB5WqzZBFVEH0BKJXwPIEiTez1
 Cs4FXpAEOYWJB5d7Tk4WFnHzvrdXTXigwdB4g7piD7CqZT3lyu1yKcIVjEL5aAjKP8yZ
 R0I2QUGLBQVRTNhqyzlWPCmttEssjVJPvG11OhsiKUsuc/yKIq+VZ8hKYkpuBnGlNN/z
 vtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrmNcC6TdsKWj8VD7ouk/7eVvekqEu+n6Bwr3mVZDuc=;
 b=YTXqFi1REDVaJwctrdvZ2OOsfS9kRKaKpyacgRZzFX98g4gJq5NRzPAzRvN86TFFdm
 o6NlWJdto37cea2Ehr5GPlIYFmWTU6cd/4VWYxgA3AINkoewBrXlX1pnDmdYTzxgtjyw
 YEYOZLH/ZUu4JiTzegBr+VMlDSVaaIQ2ZDxG3BehOm8Zehn5CGs7FW6LIpWBoCxMpGjP
 0Zbk2v0V2aETY86ZmFtHC05qwUW5CgCOmMly1t1s1h7K8SV+xK5kE3GGj+045nd0k2ln
 lQuC6+YUIjFS0DPouTPjIzx8F4BCW4OfrC753XM+mRzPYybUaUGqc2ojTrcgqZ/sxY/0
 hnEQ==
X-Gm-Message-State: AOAM5311PqoHI2LZq4mS5vEna5wmcJbLjD5m2cvsqDkp645zmoB5fQsU
 OM/pPOzUZghGbzY9pQWzEaA5sJCQgsEY0J0U1HQ4hw==
X-Google-Smtp-Source: ABdhPJxCe87GA6H+JGxp4OoxczzDOkMNkfFVLMeUZn+7JIgj1ieQKP9XsBceqGwZGqUyaIVcYBErtACWJ9FeyNipHjI=
X-Received: by 2002:a37:b081:0:b0:6a6:7ae4:aa0c with SMTP id
 z123-20020a37b081000000b006a67ae4aa0cmr4245087qke.203.1654240036197; Fri, 03
 Jun 2022 00:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-3-quic_jesszhan@quicinc.com>
 <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
 <f81a64fc-c80c-2bc9-a9e3-8eb4a1eccf03@quicinc.com>
 <0b3574a3-1dfb-842f-e147-c6522fa30f11@linaro.org>
 <d1026de5-ada8-a33d-3ff7-9804dcf4b6ee@quicinc.com>
In-Reply-To: <d1026de5-ada8-a33d-3ff7-9804dcf4b6ee@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 Jun 2022 10:07:05 +0300
Message-ID: <CAA8EJppkhG+p2bGN0HzOWT=TNoU7z-gTuSFrog1t+W3ZpHvOSA@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: Add MISR register support
 for interface
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 3 Jun 2022 at 04:00, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 6/2/2022 3:31 PM, Dmitry Baryshkov wrote:
> > On 27/05/2022 23:11, Jessica Zhang wrote:
> >>
> >>
> >> On 5/27/2022 12:38 PM, Dmitry Baryshkov wrote:
> >>> On 27/05/2022 21:54, Jessica Zhang wrote:
> >>>> Add support for setting MISR registers within the interface
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>> ---
> >>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 55
> >>>> ++++++++++++++++++++-
> >>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 ++-
> >>>>   2 files changed, 61 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> index 3f4d2c6e1b45..29aaeff9eacd 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> @@ -1,5 +1,7 @@
> >>>>   // SPDX-License-Identifier: GPL-2.0-only
> >>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >>>> +/*
> >>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights
> >>>> reserved.
> >>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >>>>    */
> >>>>   #include "dpu_hwio.h"
> >>>> @@ -67,6 +69,14 @@
> >>>>   #define INTF_CFG2_DATABUS_WIDEN    BIT(0)
> >>>>   #define INTF_CFG2_DATA_HCTL_EN    BIT(4)
> >>>> +#define INTF_MISR_CTRL            0x180
> >>>> +#define INTF_MISR_SIGNATURE        0x184
> >>>> +#define INTF_MISR_FRAME_COUNT_MASK    0xFF
> >>>> +#define INTF_MISR_CTRL_ENABLE        BIT(8)
> >>>> +#define INTF_MISR_CTRL_STATUS        BIT(9)
> >>>> +#define INTF_MISR_CTRL_STATUS_CLEAR    BIT(10)
> >>>> +#define INTF_MISR_CTRL_FREE_RUN_MASK    BIT(31)
> >>>
> >>> I'm tempted to ask to move these bits to some common header. Is there
> >>> any other hardware block which uses the same bitfields to control MISR?
> >>
> >> dpu_hw_lm.c has similar macros here [1] for _ENABLE, _STATUS,
> >> _STATUS_CLEAR, and _FREE_RUN_MASK
> >>
> >> [1]
> >> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c#L31
> >
> >
> > Please move bit definitions to dpu_hw_util.h. According to what I
> > observe, this might be useful.
>
> Noted.
>
> >
> >>>> +
> >>>>   static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
> >>>>           const struct dpu_mdss_cfg *m,
> >>>>           void __iomem *addr,
> >>>> @@ -319,6 +329,47 @@ static u32 dpu_hw_intf_get_line_count(struct
> >>>> dpu_hw_intf *intf)
> >>>>       return DPU_REG_READ(c, INTF_LINE_COUNT);
> >>>>   }
> >>>> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool
> >>>> enable, u32 frame_count)
> >>>> +{
> >>>> +    struct dpu_hw_blk_reg_map *c = &intf->hw;
> >>>> +    u32 config = 0;
> >>>> +
> >>>> +    DPU_REG_WRITE(c, INTF_MISR_CTRL, INTF_MISR_CTRL_STATUS_CLEAR);
> >>>> +
> >>>> +    /* Clear old MISR value (in case it's read before a new value
> >>>> is calculated)*/
> >>>> +    wmb();
> >>>> +
> >>>> +    if (enable) {
> >>>> +        config = (frame_count & INTF_MISR_FRAME_COUNT_MASK) |
> >>>> +                INTF_MISR_CTRL_ENABLE | INTF_MISR_CTRL_FREE_RUN_MASK;
> >>>> +
> >>>> +        DPU_REG_WRITE(c, INTF_MISR_CTRL, config);
> >>>> +    } else {
> >>>> +        DPU_REG_WRITE(c, INTF_MISR_CTRL, 0);
> >>>> +    }
> >
> > This should also be abstracted. Please merge these functions with LM's
> > and add corresponding helpers to dpu_hw_util.c
>
> Good idea.
>
> >
> >>>> +}
> >>>> +
> >>>> +static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32
> >>>> *misr_value)
> >>>> +{
> >>>> +    struct dpu_hw_blk_reg_map *c = &intf->hw;
> >>>> +    u32 ctrl = 0;
> >>>> +
> >>>> +    if (!misr_value)
> >>>> +        return -EINVAL;
> >>>> +
> >>>> +    ctrl = DPU_REG_READ(c, INTF_MISR_CTRL);
> >>>> +
> >>>> +    if (!(ctrl & INTF_MISR_CTRL_ENABLE))
> >>>> +        return -ENODATA;
> >
> > As the users of collect_misr() are going to ignore the -ENODATA, I think
> > it would be worth changing this to set *misr_value to 0 and return 0
> > here. It would reduce the amount of boilerplate code.
>
> 0 might be a valid misr_value so it might be better to not write it to
> the debugfs. IMO we should also avoid writing to the debugfs if the misr
> is disabled -- that way we won't be spamming the debugfs with
> meaningless entries.

Ack, true. Then I'd ask to change encoder code to skip crcs entries
corresponding to the phys_encs with no hw_intf bound.


-- 
With best wishes
Dmitry
