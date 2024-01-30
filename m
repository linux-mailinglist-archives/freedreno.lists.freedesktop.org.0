Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F71884180D
	for <lists+freedreno@lfdr.de>; Tue, 30 Jan 2024 02:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2939410EE3E;
	Tue, 30 Jan 2024 00:16:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3771F10EE3E
 for <freedreno@lists.freedesktop.org>; Tue, 30 Jan 2024 00:16:35 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-603e370790cso12595817b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 16:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706573733; x=1707178533; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=10mGlGfE71kcUxZt+FhNspjVUeTHZj5MOphZVIYQcjY=;
 b=VGcIzp6qoEwlE51uhmGllvvt3MluTRB/Z6wfGpvpr6PZaHVbZgL5AAa1MD6pYHWwJp
 7vy3nb9BRxUyXmOtorVo8jqIBfAXT3nlPkbMujaLWIKuapMONoVcIAQocyZUCcyBT5RS
 PjhwRCOp6ELUA+pBa5Jac3jsyu3zrulbBC8UMwAiuEorAvDHzeRE6MO27BFOlJ44FXH6
 iBkEti9bGMKc97Q6P+o7lOksvGl/FzVJRe4phtJmizyiIsnDr5Q2b4VR5YI8WM0pg2Id
 yg1l5UkA3dR9hwTx/e8BJ3d7tKf/g5bVV2NSqqP5/aXgzNaF4Z6hu6VO+MGpdsWeUvP8
 vL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706573733; x=1707178533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10mGlGfE71kcUxZt+FhNspjVUeTHZj5MOphZVIYQcjY=;
 b=V0UV4BUG2KaEC7WI44P0Y/yUi2jo3VcyfnhhjFcEvfi7sGwvmguQ2PpY25oOyM6/Li
 WGXaykbxk5RVj5NAL+0bVsuTI6EhQDQZPqt5lNb2JJNH8KlR7QBLSQ/sf3OwkfKtDRRA
 3U72lNrnPdpTRGLrvKhgowEnpfkVhHoenbK3r6YHh1KEgg5hKIGOpfqxyS9oJNFjqapw
 kEpo1pNzq7rXBlwh0n/RDaW+pG90pAVJUJfnNHJI4x4Py6BPzDfrPr4S8NaOA7/ZzG+T
 FXOOXk18JeV7qnmxaA32K59hDfDvP3po4q49nmO6rO1NdjocHhCC5N9RJjnnTd6OmOXH
 9w1g==
X-Gm-Message-State: AOJu0YxdABoAzekZmZlf77uvCwAjMf1ordBBfbACGcicrijl2qLnxlb7
 c+Sjbohrdv989hP6YSbVXOtRDMS0LWnGLZZYVTNz0ITlOaVMhDhD+m6pvT3/8ll+FGSsG6YfwOB
 3ZdqMQgbpp1LMg7dg3dcrlyGQNAhbgPJRfwhunTS/3Qew+J/m
X-Google-Smtp-Source: AGHT+IERWnWLJY81Yqz3Od8hw2QW6v4/H/M3UO4fhrq7GoPFBmVKV+8nMOjO7BBK1jYPCBJNapeh567NDuEe+GxoF68=
X-Received: by 2002:a25:8a8d:0:b0:dbd:b8fa:a0e9 with SMTP id
 h13-20020a258a8d000000b00dbdb8faa0e9mr3904706ybl.66.1706573042025; Mon, 29
 Jan 2024 16:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
 <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
 <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com>
In-Reply-To: <31630fe2-045d-c5f1-4019-e8a8b89928c3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 02:03:50 +0200
Message-ID: <CAA8EJpr+tqWgj78LuPeDztQb+Tt_Zs0OKPaRsV1E-jqpRQJO6Q@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, Paloma Arellano <quic_parellan@quicinc.com>,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 30 Jan 2024 at 01:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/27/2024 9:33 PM, Dmitry Baryshkov wrote:
> > On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >>
> >> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> >>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >>>> YUV420. Therefore, program the INTF to send 1 ppc.
> >>>
> >>> I think this is handled in the DP driver, where we disallow wide bus
> >>> for YUV 4:2:0 modes.
> >> Yes we do disallow wide bus for YUV420 modes, but we still need to
> >> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> >> this check.
> >
> > As I wrote in my second email, I'd prefer to have one if which guards
> > HCTL_EN and another one for WIDEN
> >
> Its hard to separate out the conditions just for HCTL_EN . Its more
> about handling the various pixel per clock combinations.
>
> But, here is how I can best summarize it.
>
> Lets consider DSI and DP separately:
>
> 1) For DSI, for anything > DSI version 2.5 ( DPU version 7 ).
>
> This is same the same condition as widebus today in
> msm_dsi_host_is_wide_bus_enabled().
>
> Hence no changes needed for DSI.

Not quite. msm_dsi_host_is_wide_bus_enabled() checks for the DSC being
enabled, while you have written that HCTL_EN should be set in all
cases on a corresponding platform.

>
> 2) For DP, whenever widebus is enabled AND YUV420 uncompressed case
> as they are independent cases. We dont support YUV420 + DSC case.
>
> There are other cases which fall outside of this bucket but they are
> optional ones. We only follow the "required" ones.
>
> With this summary in mind, I am fine with what we have except perhaps
> better documentation above this block.
>
> When DSC over DP gets added, I am expecting no changes to this block as
> it will fall under the widebus_en case.
>
> With this information, how else would you like the check?

What does this bit really change?

>
> >>>
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>>>    1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >>>> @@ -168,7 +168,9 @@ static void
> >>>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>>>         * video timing. It is recommended to enable it for all cases,
> >>>> except
> >>>>         * if compression is enabled in 1 pixel per clock mode
> >>>>         */
> >>>> -    if (p->wide_bus_en)
> >>>> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >>>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >>>> +    else if (p->wide_bus_en)
> >>>>            intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>>>          data_width = p->width;
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
