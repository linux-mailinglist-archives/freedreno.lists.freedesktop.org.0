Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E4703BF0
	for <lists+freedreno@lfdr.de>; Mon, 15 May 2023 20:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF73D10E1AA;
	Mon, 15 May 2023 18:08:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5A10E1AA
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 18:08:32 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-55a8019379fso121121837b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684174111; x=1686766111;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ro8tmlMGAw+gcvacmTcSTaJjQF8eWJk6fA6Unv/Jk28=;
 b=ZiF16qVzHpH1+nrMbvksLWNYUu/EwpDqaweGBrTdItutk6MJ5koNhu/n4KBpJirsY7
 rr0nYXeQ8KqGCeAraXCDpI4H93jRoRFQpUbBsT8ksrSR1DsM/YfA4OVtZFgdHHnOMIad
 53STU/PWwGPnCyeRBcCTiFltMl66f3ZLZ+6PTBYeEKm+cYrApG4APn60WgzDta0YH18r
 ZsOPXMNazF/kFRifnVHszo3CqDy3V7XRyFP9LYAO0DWznx1qTon9/9DC+i/r/VDh2XSF
 yg/gKWEB6oDusL/SNmU5T+wqJYQHau//BzlYUXr3xFyxoMF+MclXrfNqQNUgTTvEK10x
 KcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684174111; x=1686766111;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ro8tmlMGAw+gcvacmTcSTaJjQF8eWJk6fA6Unv/Jk28=;
 b=T2DA9QmjXWWk+7e9VRAVemxcXsmyLPrCWDhMXL4+pnFdZhHQRnytcTb3y/5LPoTLU3
 PwnTAOeSh7sWL7eLt/arcIzQtB8sAVHBuTzVNPNweE+5Z4FzmhbcRm/4HUuGNCyaM4PF
 428GttR1hvPgGz7A9bkYuC2jfvJgB+ZGtliQUdne2hIoV4DVsR+nnjZusfUgnTnArxqt
 D3Hx0dj/61sbnO7LKFF5Wcndz/LRYmanY+VY+/uLkAbaY4MlUEtUs7D/Jg1567cFvoun
 f0Ovuc/ehg+99hihaEw2xyItk76ZE2BC0qtF46V0HdXf/2nfWf633BmjOZffx/jakLxu
 Nmiw==
X-Gm-Message-State: AC+VfDyxqwdnk0LV9YqTs1YE1Fmj0O5fuvcSby3qbvTZrBUBOnPbZQPw
 91TSAqfBcBrIZsPZMg4lS7FheYCKkEAAAB6cgwxweQ==
X-Google-Smtp-Source: ACHHUZ6Z4HjdtsvLUTBfEEJpcucb/2KcKAXw85OfHM0Szwvs5toBGa3MOzyeUX7rMhZxYpj5F9J4fR4ysvAAMC1yXxQ=
X-Received: by 2002:a81:8a05:0:b0:55a:30f3:119 with SMTP id
 a5-20020a818a05000000b0055a30f30119mr32369437ywg.35.1684174111398; Mon, 15
 May 2023 11:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
 <41243dc6-eb9d-dea6-f945-cb1f6594a2a4@linaro.org>
 <w6uswjuf7fiorrplqzhrpg3vrjbbdd3bgaxej5l6ez3pebn3d5@ytuxhim25j6q>
 <1fd8fd48-9a0a-774c-1366-ea4c893f3b25@quicinc.com>
In-Reply-To: <1fd8fd48-9a0a-774c-1366-ea4c893f3b25@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 May 2023 21:08:20 +0300
Message-ID: <CAA8EJpqKRJ0nqQMDXdcSYEZapsKfxAsevcKnWPcsEVv+9P05fg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 5/8] drm/msm/dpu: add support for DSC
 encoder v1.2 engine
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, airlied@gmail.com, andersson@kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 15 May 2023 at 20:47, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 5/14/2023 2:46 PM, Marijn Suijten wrote:
> > On 2023-05-12 21:19:19, Dmitry Baryshkov wrote:
> > <snip.
> >>> +static inline void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
> >>> +                                               const enum dpu_pingpong pp)
> >>> +{
> >>> +   struct dpu_hw_blk_reg_map *hw;
> >>> +   const struct dpu_dsc_sub_blks *sblk;
> >>> +   int mux_cfg = 0xf; /* Disabled */
> >>> +
> >>> +   hw = &hw_dsc->hw;
> >>> +
> >>> +   sblk = hw_dsc->caps->sblk;
> >>> +
> >>> +   if (pp)
> >>> +           mux_cfg = (pp - PINGPONG_0) & 0x7;
> >> Do we need an unbind support here like we do for the DSC 1.1?
> >>
> >>> +
> >>> +   DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
> >>> +}
> > <snip>
> >
> > Friendly request to strip/snip unneeded context (as done in this reply)
> > to make it easier to spot the conversation, and replies to it.
> >
> > - Marijn
>
> Thanks for suggestion.
>
> How can I do that?
>
> just manually delete unneeded context?
>
> Or are they other way (tricks) to do it automatically?

No automation can deduce what is irrelevant to the mail. So we do this manually.

-- 
With best wishes
Dmitry
