Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AC84FC74
	for <lists+freedreno@lfdr.de>; Fri,  9 Feb 2024 19:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144B510E6A6;
	Fri,  9 Feb 2024 18:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W1HtYhT1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8610FA76
 for <freedreno@lists.freedesktop.org>; Fri,  9 Feb 2024 18:58:21 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc745927098so1140257276.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 Feb 2024 10:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707505100; x=1708109900; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=awo/BCeLbFkRz9Dlg6VrbH43FXLlqcjUWJcmSLZJJiM=;
 b=W1HtYhT1erdZx+WpD2jXkDJHkFccimZZV2ZU3PuH08MKz9zbNLVulsApWZD+QZg1lV
 kZeWLXvRfFQ/DYlvUVbE3zRIBK8fsIvKCUbIkJxL0430XbSL7JqbgNKLx1BgTZbMOGFn
 qNGZ/d3RGzO7me/lWeu5kMaOKRG7nQRX5CUYJao4g/Yqz5It2m1GLMwG4xUUl75vJucG
 RFxUFzESJXw+hLRQ0++sgTJwaXxbs7pGRAGgyEmmcQ334axyfLPNH1XxZbLWa8zbxWH+
 qggDJD0YdpXHVeu87yF7YYJiFEH+qPBkIWCfX3+GyzJJSVn3BGQviMA9czg1DBVPNQMi
 e70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707505100; x=1708109900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=awo/BCeLbFkRz9Dlg6VrbH43FXLlqcjUWJcmSLZJJiM=;
 b=Slq4q6erR2swUi5jaKZl/2jkslln1PCapKWUpLObkh8ayJ4yLob8AcbRVoGqoDl0mO
 e1fR2C+Bxs6Mayir8oefWLevUMkDIdxcMwUzhp54EkLi3TUC7qFOHyob44xWNEbQEWJz
 T3/+dC4EuQrQkqVOuJHcX2nebJn0jB7ZyYVsZ148c5NN5ikmgJ4qylnhxUkM52iSOHLs
 Ywfu4yrthvNckKLZqwyARZi+MX1UaJiFQmFAJt2q0gi2qbhOCjPtVDPM3c24r/u7TTAZ
 8MrB+8cFWE5/LZsmJDn20WfHJop4Px7udfJ3ihzugrRhb9fzSabSg+0haLYjGY36ALZZ
 +ufQ==
X-Gm-Message-State: AOJu0Yx/dPci2D+s3+APBmF4NBhkRf9uFqoZBF6XAf3Z9mmUHrIclTQw
 EmpNZ/MHqLodY/+WapHnvK6iISZY6qBzz/FP9IxtnN4kpiIdK31CMfSrhcW2WzjBvjTVo7M7YnO
 J6jv8Anne89WOYg9mkjh8HDcBxmJPgEnmZz4s9Q==
X-Google-Smtp-Source: AGHT+IEb9542YJRhGlr5tTb655Bco/sIqzumPYkKYYv3shLKDvBLR/Rw+lw7ROAYYvzXuW7vbjo071txTmkH+A3fY7k=
X-Received: by 2002:a25:6645:0:b0:dc7:492b:aad with SMTP id
 z5-20020a256645000000b00dc7492b0aadmr49982ybm.2.1707505099966; Fri, 09 Feb
 2024 10:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
 <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org>
 <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
In-Reply-To: <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Feb 2024 20:58:08 +0200
Message-ID: <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
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

On Fri, 9 Feb 2024 at 20:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/8/2024 7:01 AM, Dmitry Baryshkov wrote:
> > Existing MDP5 devices have slightly different bindings. The main
> > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > register regions are a part of the parent, MDSS device. Add support for
> > handling this binding differences.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> >   3 files changed, 93 insertions(+), 21 deletions(-)
> >
>
> I thought we had agreed on a quite version of msm_ioremap_mdss for
> vbif_nrt_phys?
>
> Anyway, its not something to block this change. Hence,

Excuse me, I'll fix it when applying, if I don't forget.

>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
