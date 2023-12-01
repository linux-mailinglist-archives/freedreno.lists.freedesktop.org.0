Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BB8004D2
	for <lists+freedreno@lfdr.de>; Fri,  1 Dec 2023 08:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E6110E801;
	Fri,  1 Dec 2023 07:39:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEDD10E802
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 07:39:55 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-59b5484fbe6so20046337b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Nov 2023 23:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701416394; x=1702021194; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r4ZRsjdL9I2iUGO1VnJG1tezBUm0g0FIW6dRQVzc5r8=;
 b=AQ1YjS90He88D8KQfn+GhUZaYFwAO/7FEfKMp46MKFpodILL/kYP335OAAhcMetdcP
 zcHQewvS/0I7BV/UxqaO7Ly2R/wqK/HCXiixmtNzxJXt+yhX4ujHPR51bD1kdTJnuEI/
 nJw4sttf+cqcj/9e6CdKCi9ZHJa4+JyrFQ2TFW7zseDhUx5LGo96ijx3rAqsISDMapFg
 1LrCT0Pu4+y6CzyjpKeLe8YDEiyPJPCTiFYjJbJq18dRCvg6/VjCCAtRLSzHr0NYyMpS
 LLUGPkVZ0dSVk368xjWTMb0NJSqINRzmCvNypcnD2nYrQhTM+kiXzeaVjfyVoa1BkW7D
 1uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416394; x=1702021194;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r4ZRsjdL9I2iUGO1VnJG1tezBUm0g0FIW6dRQVzc5r8=;
 b=efWlea+X2hK65HhSjg35DqMpjhGB4WEev7rUdIIESqIWjpxFFzfhK7YF035bMV4/rL
 zLlYkZjDVv8OzWF/LYG6dEiKksAC28v6xeUnYXn7Kov6PCapIhFPD16RuA+QZq6WUKLQ
 aI4yCYLxNy2/xla+S7RJyzvO2TMu7uKM6SBItX6tt5evJp7+rS7m7JaXb7fj9EiKcq5d
 d0RXfv3++s5x3fr5oCCwmlluYfwDkxLWLq22NYXS2P/oC43T5XTsbck5k65w6lZis8EM
 7SAJbWd6tuABqfE2e/568ugs+w/MWWGaiwLAfC721MkYNdeHCUfm0ydhWUC2BZtDz9w8
 ZMQA==
X-Gm-Message-State: AOJu0Yx+QvJnkjQ1awPk6VZffl8bL9oM4AID4X/KhgMxhP8xoMFZa/LH
 dpCMzbP1A2e/lAc4OtIflRgsi/9mL4LzYx7yu6oFcQiPBDJ3d4zm
X-Google-Smtp-Source: AGHT+IG6YJFYpxxDEGA5/9WsFpWY9Xkeap+TYkek9J98RCloSx+NNN/prVWH9iqo7eEB0Fko9lDJ0o8Q44uv8RIxQR8=
X-Received: by 2002:a5b:ec7:0:b0:d9a:4cc2:1961 with SMTP id
 a7-20020a5b0ec7000000b00d9a4cc21961mr21395804ybs.26.1701416394767; Thu, 30
 Nov 2023 23:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:39:43 +0200
Message-ID: <CAA8EJpof5LO7pyXaqgtbL=sL2a2Te2tzLF-NrTFT7n58pB3iww@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 0/2] drm/msm/dpu: INTF CRC configuration
 cleanups and fix
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

On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> This series drops the frame_count and enable parameters (as they're always
> set to the same value). It also sets input_sel=0x1 for INTF.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Jessica Zhang (2):
>       drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
>       drm/msm/dpu: Set input_sel bit for INTF

Please change the order of the commits: fix (input_sel) comes first,
then comes the improvement.
Otherwise if one needs to backport this fix, they either need to pick
up the irrelevant patch, or they have to rework the fix.

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 18 +++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 11 +++++------
>  8 files changed, 26 insertions(+), 30 deletions(-)
> ---
> base-commit: 4047f50eb64d980fcd581a19bbe6164dab25ebc7
> change-id: 20231122-encoder-fixup-61c190b16085
>
> Best regards,
> --
> Jessica Zhang <quic_jesszhan@quicinc.com>
>


-- 
With best wishes
Dmitry
