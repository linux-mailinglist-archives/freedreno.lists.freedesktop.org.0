Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D4778E360
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 01:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD9610E634;
	Wed, 30 Aug 2023 23:40:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86A10E634
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 23:40:29 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d7bb34576b9so77376276.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693438829; x=1694043629; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RW03Buigd8vZt6eYvyecwZ1KL1Q5FSJSIf3Tv8B2o+o=;
 b=wUPJgaKpGU5pNTXZYnJ574/Y60tZkH4sXp0X3Ld9EXsXQg0hjCGyK4TiA1zZ1OkCL3
 XrETiamLm1bKeHg0FSHcF83CNZDMMatA/Rk2NtqfiHmb41XUVAmEcUcWwRmZxnM4Rce5
 HutwknS12mcJ+20dbf4cOXXDFZJDzlGTNfNvPpsKRAsO11T9/XvphtBKrPY//i3pI1xb
 w7IXE3PGuH0A0NHK4lE6pz2T01EPXgPC5rh8THvNZD1y6LwyTtL6CgTPdFhgjnn5lplh
 xsNcBv+XVNoBkg3Q0fM/VNlVhLYadkbTg6O8xbNVD6agoiR+WPIH3bXuhIbfuMVnb7/T
 dOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693438829; x=1694043629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RW03Buigd8vZt6eYvyecwZ1KL1Q5FSJSIf3Tv8B2o+o=;
 b=UUe4nCrnpUPM63AghNzzfYtgxaJBeghhC0Cu6bM1gzhbZ68p8On1xGxLKEHNjosvDO
 CVPBXjXx6WH3arF4oiyzukpgdZcfjn94qsEIGOpVH5v15uleYAjEbPnuOjUKyjgSTnxC
 pAwRWELhMaEBE65Wjg3VFPynzoDetvcmErZ/sbhNoYEhocqu7AgAd+W0XQnKPSOo/w1y
 IOOw9ejzCPKiT8zruXEc+hNyp1+kLPn9GaaYM+rGR20tRNc8CwDKfH3hvKcALDz1GWdm
 6VZBlkUamfkyJDkY60uZgnc/IoNRddY0kCt9rDAOUnOlyKD66wOlD/cc5QAM5zcgEOZ3
 4tMw==
X-Gm-Message-State: AOJu0YzpYQ8/EJy53CshQ3b2ilpu2WuVekg7bP5ACRyP4y6e6k6LGcHL
 9Ox5P1KDJ7/DKDfClb7DMaCoNOQ+n5uSfOX8a8WsEA==
X-Google-Smtp-Source: AGHT+IHRpuHMQeos/PbcvuIgXam01EiMFEv4kIeP7FrRqJXSgDs5wXyQUctlx8YiF/YdlbVx3rmwns4oiK1/Ze3DUKQ=
X-Received: by 2002:a25:dbd2:0:b0:d7b:a834:3b2c with SMTP id
 g201-20020a25dbd2000000b00d7ba8343b2cmr3295137ybf.1.1693438828881; Wed, 30
 Aug 2023 16:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-4-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-4-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 02:40:18 +0300
Message-ID: <CAA8EJppfO8G+6sFf6MUOJDG8swAtT3J6sAa_20xUJfPCcNq24w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 03/16] drm/msm/dpu: rename
 dpu_encoder_phys_wb_setup_cdp to match its functionality
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_encoder_phys_wb_setup_cdp() is not programming the chroma down
> prefetch block. Its setting up the display ctl path for writeback.
>
> Hence rename it to dpu_encoder_phys_wb_setup_ctl() to match what its
> actually doing.
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry
