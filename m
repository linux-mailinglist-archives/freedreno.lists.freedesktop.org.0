Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A22963319
	for <lists+freedreno@lfdr.de>; Wed, 28 Aug 2024 22:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F7D10E5E6;
	Wed, 28 Aug 2024 20:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bkekw5Jc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8256510E5E7
 for <freedreno@lists.freedesktop.org>; Wed, 28 Aug 2024 20:56:11 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7cd830e0711so791532a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 28 Aug 2024 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724878571; x=1725483371; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HTBxWJ9wyPByAunmw2nMzBk9ACw5+Pc6tm8AO9OHjfY=;
 b=Bkekw5JcdprazHjQ83crOgcCDdoroJgKoUnawog2xZvIdFP+JEsr+BQ4pR2UGq3/Mn
 7OZKcVwzIPX5BCiDfPciYvGk3G0KQTI+tgg9+sjNUO1GObU6mFIJoMr4Jco6s/i7W8uy
 f0AGighvQT+wsMywowuhSkoGDxAn/NpMVBFFy0HrMvz21mrSh0y8CWVhYaufp39YlYj/
 11mpcP/RVNm0MS5aVCCtO2qPPRbH2qC9EOKbGRyTcdJxWFu9Ri65ke3YURCDAoyq4CuF
 X+okBULXU7rNqfSud9TxM9jVXEfKwjAz+CufYapiLtbshBLQ4jqxwH+hlKhgdYozuXSG
 Njuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724878571; x=1725483371;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTBxWJ9wyPByAunmw2nMzBk9ACw5+Pc6tm8AO9OHjfY=;
 b=NGRnYJY6nOgIw7d04Lhofwia9bxzoaITgtsGxGJ8T6ltymt3Ns8oS4zy47HZ7cM6Iw
 C+XrXNEIR2ZLokgPzJhu15TruAVOqAFhcaEjV6UNYl+P81hUdsK6DtGPV7Js13II1QFQ
 LXl8Y567HmTAxtczY/0kFKVuUmBs+dnYJ1FglmiKY5Dym+Mqf2xs8hP9GwAuzCWLu6wf
 fWnQJrOgF89y/RC9Ym7UV/ZgjYDNeASsjAtSwLXRyjm7G7KrRqvXqNcCBIVGkrTz/uSS
 2BwTi4c8MVhS3OdZ9nan2fSW9L0lWcWaGLKw9OV2UHeT75iSpZnjyNXR3MHIVyhenGD/
 ga/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNJDYrJP6QzLkanXJiV7hijhZ6/b6Q8iXMp89ThwjjQZXpRmLK5+ZSCY8fCN364YRDHOznMzkUaU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7gUJ+lCJtE2/gBRHcQa7nmgK/oTo+jfs7Sg6hR6XsZKLM0Wh7
 D0AeX77gTmozCJATcf8mL5tGY0g6l2FHRZYdxJo5Foutb3fBFyh7UE/gp7yw2n2Bb3nOPl4Jk/T
 OZDiBIi4OSqRFGh5xBVdTtxnnVXyAav+Mh3G0kg==
X-Google-Smtp-Source: AGHT+IEz2rPhLvv7n23E6bzDV4iFmPIxFnrezQOlNwUK6zlcWpRR3csAoLfs4O3Xg+lVb6jAr5o5pCLeaKqNmgyCv14=
X-Received: by 2002:a05:6a20:2594:b0:1c4:8694:6be8 with SMTP id
 adf61e73a8af0-1cce15f7ea3mr602404637.3.1724878570814; Wed, 28 Aug 2024
 13:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-9-5efb90cbb8be@linaro.org>
 <1bb90821-bc6f-4828-b947-d3123a035c60@quicinc.com>
In-Reply-To: <1bb90821-bc6f-4828-b947-d3123a035c60@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Aug 2024 23:55:58 +0300
Message-ID: <CAA8EJpocScDmfSpSctOYiMiOLKpcWOP8x4qjGkdx0sieUsnvzA@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] drm/msm/dpu: move rot90 checking to
 dpu_plane_atomic_check_pipe()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 28 Aug 2024 at 22:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> > Move a call to dpu_plane_check_inline_rotation() to the
> > dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
> > are checked for both pipes. Also move rotation field from struct
> > dpu_plane_state to struct dpu_sw_pipe_cfg.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++++++--------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 --
> >   3 files changed, 31 insertions(+), 28 deletions(-)
> >
>
> Change LGTM and addresses one of the questions I had in the prev patch.
>
> One question though, till patch 11 which adds support for 2 different
> SSPPs for the plane this change is not necessary right? Because till
> that change we assign the same SSPP OR two rectangles of the same SSPP
> so we dont need a per pipe_cfg check till then because both the
> pipe_cfgs point to the same SSPP.
>
> What is your thought on squashing this with patch 11 because from a
> logical split PoV, this change is meaningful only after that.

I'd say patch 11 is complicated enough. I'll check if I can change the
order of patches 09 and 10 to make it more obvious.


-- 
With best wishes
Dmitry
