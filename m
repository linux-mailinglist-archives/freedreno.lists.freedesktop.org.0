Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43881212E
	for <lists+freedreno@lfdr.de>; Wed, 13 Dec 2023 23:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696E10E84A;
	Wed, 13 Dec 2023 22:07:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A9F10E27C
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 22:06:59 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5c85e8fdd2dso72978067b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702505218; x=1703110018; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IiZLeydFv0dQoVsgTLSTJeU50o5YR4HggKIDBADvvDw=;
 b=nmON99cla1nwX5shTlEunKd+MPg9f+dhJwjka9HAVqEF2r1AAhjCgThO+dLZjM97Nj
 ZhztXTqmxIDaPpQRrMU1hjTDZni3xI4qAOwkNQGcmNT70IAwloCvWqiw+PxYaomH8okA
 hka0T1JClXP6BQOBDWg1PapyeN+bDgL+chSVoT09/Gntgf+OFBqd3WYfUvXiuA+1ubiP
 mBRXyQT+6eAmP8T0BE2ZxRptRHQd6kzbkcmh7GxNViN8u/SeQw36ce6ibNzlxvbK+HA6
 WziQXLVy0UX6NFqd6a3AwzwtyHtQyf5D5dAp3t8UZV9dYUD/MWs5433O2C+MfTM7QrKT
 ZjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702505218; x=1703110018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IiZLeydFv0dQoVsgTLSTJeU50o5YR4HggKIDBADvvDw=;
 b=h41Po8SDC14P2u+ogEXPEQ2xeah7vEy17xjpVMg4oVdBt0UMS9zk7oHaKNaMwpS10R
 9NVp3hz+SgIpQvNSz1WWuQMGuxWFZnvt3eePyTqniw+9owW976/w1PTMHBoCedwdfBd1
 hxQFozsKGrG0NOTD5QdjA/G95loYkYXaL2BMgDyYqfDI97GhEEQaUeJXPkMJMtCyE7qg
 7IgvhB183dl7dvYmCqw4+30R2/S65BTyQtLOl1bO7FJI7tmAoWjhD4/BHKMTH93ZAxCG
 QcZ5alziQooNTQrf4Yb6rMntO6pDoCccLgnxHspzIo8C634SWwJ3nnPKfTaZ8foEZFlL
 J5SA==
X-Gm-Message-State: AOJu0YwSSM80NSo7dFYjhHBO7iu34Dn7ItNmTYertfVUmXhi3X35MDrr
 Olo4X/SgjFdrXsGmLSn9c8ZQncZZamOExCLtHuIwVQ==
X-Google-Smtp-Source: AGHT+IEr68TyT/QvLeseprICEqjDcN/rRoj0lk5BxuC5payzc9s1YVNN9YYwQvjCujY3WsP7jPO/aXoRaDtxmbQXGKo=
X-Received: by 2002:a81:5ec2:0:b0:5d3:977b:d632 with SMTP id
 s185-20020a815ec2000000b005d3977bd632mr8471435ywb.6.1702505218315; Wed, 13
 Dec 2023 14:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
 <20231213-encoder-fixup-v4-2-6da6cd1bf118@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v4-2-6da6cd1bf118@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 00:06:47 +0200
Message-ID: <CAA8EJprcH22ouehetL4uNwUuroRUc9q6swGZo1GjuGuCRZDv=A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/msm/dpu: Drop enable and frame_count
 parameters from dpu_hw_setup_misr()
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 at 23:30, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop the enable and frame_count parameters from dpu_hw_setup_misr() as they
> are always set to the same values.
>
> In addition, replace MISR_FRAME_COUNT_MASK with MISR_FRAME_COUNT as
> frame_count is always set to the same value.
>
> Fixes: 7b37523fb1d1 ("drm/msm/dpu: Move MISR methods to dpu_hw_util")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 19 +++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  9 +++------
>  8 files changed, 22 insertions(+), 33 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
