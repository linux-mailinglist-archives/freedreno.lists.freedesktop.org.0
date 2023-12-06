Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC7806A62
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 10:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73C110E6AA;
	Wed,  6 Dec 2023 09:10:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9204E10E6AA
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 09:10:44 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-db54ec0c7b8so605823276.0
 for <freedreno@lists.freedesktop.org>; Wed, 06 Dec 2023 01:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701853843; x=1702458643; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9n2kthQbWTkNG2GdCSNciiPlzGwjGTmUOsOXRq6uUuY=;
 b=tfu8hp8ADqh64PizEnbv1u45TO8HoNjH02LaDo/4sIKstvf4/x9c/PW4fe6uN1bc+b
 62YEPaMD+4qby3YzacmeQ02rrWMjyLYTcu4VczSOblagc/5Vt6xyNtAwvW3FVImKG1RO
 cu/WsjHuaVOqwAHPzZTZ+2gOY1hl8RCNuOC0j9a0r3LNclBnVWipemH0isUysds9P+0P
 v9pPu2xbWM9t5LGfc6kjMkMGHMhXzXARsDPA0TV6+xbwMEO++4Dj9+GTh5VBVqvb9Arm
 l7WNw1bn2G8kcT/CFNHJRaBNa3huJe0ELzKD8trTMUyQKGHkqKzKq18LHWQVVi7VsmkZ
 OeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701853843; x=1702458643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9n2kthQbWTkNG2GdCSNciiPlzGwjGTmUOsOXRq6uUuY=;
 b=THsaUeAAfjFOd+Edg5/XktFXKTeEVNJdi9x9rGhaRfTrxR3tiA1RlaoUQyqG0+yqMS
 TAhj7cOjv56e9tmarF4ZHU9mFcFVJe3FkyHwW1mKQhgqXGDf/J+o1Qv/TSus43lQIitB
 lnngF+oBzSO2kaN8BHmnnXcYu59r/M2Sc4ph39MgloBYF/Ne509AR+IJB6MteRV5X+xN
 b3EoEheJXDC1XXhHsf0Uk2/9bJLO1R5LKs2+xVb56GRAkG94so7z1NPUsu+4FLHVOrO0
 NsMuoRcBNYJMtlGpAa9rASqKwRVGYeOuoZjQvDVM3odU3hZBnnj/mtVY/kRglkmFgvKd
 uzgg==
X-Gm-Message-State: AOJu0Yy9+/KumOI4KEe/o2WANOn+i43kwdXe+eOLCRwtQXFOXmGmb3XT
 sjRavsvNXRAqMzqBCAgkQ2MsV8dt3yRF5O53RzBBtA==
X-Google-Smtp-Source: AGHT+IEXzruhFFkHB0Fa+/n84Bb6lIWEsIELJtEm0FOsD8vWSyRbbfLPr/HFQvgfnZNoovdex9inHxAp8BUvFfqaPBM=
X-Received: by 2002:a25:cf13:0:b0:db4:d68:d450 with SMTP id
 f19-20020a25cf13000000b00db40d68d450mr2003989ybg.25.1701853843738; Wed, 06
 Dec 2023 01:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-2-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:10:32 +0200
Message-ID: <CAA8EJpoguMhnO2LbQvpbSiuq6PAxqc3cT1nLKFmrA43sP9c-3g@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/adreno: Split up giant device
 table
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 00:05, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++---
>  1 file changed, 51 insertions(+), 8 deletions(-)

-- 
With best wishes
Dmitry
