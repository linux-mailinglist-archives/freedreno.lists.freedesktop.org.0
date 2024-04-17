Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E28A829D
	for <lists+freedreno@lfdr.de>; Wed, 17 Apr 2024 13:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBD610EF0E;
	Wed, 17 Apr 2024 11:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vRRpcf1F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119F010E9BD
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 11:58:37 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-ddaad2aeab1so4778155276.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355116; x=1713959916; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ox5LPkHgtGr2/XHUCfFXXYvppG+HqbU+7l8WZ9khYtU=;
 b=vRRpcf1FhG3B+fGLt7XoI6Zkc3ZCUa3Y24yPxm/wWbIeaxlsCRlFUzMdQeTqq+2BTq
 LNZcsHHIWhCZaQ3U2uikMiUWBVn2XlBteL95LdX/l3okdMN8WF8QZhZdB8f78YF5lY5V
 2QSFy8AYR7DXxdkd4jU8AV2wJ+aR34z3gh9GKCMLsiOw5DDmWnBq7qgJJRfvpbfq5T3G
 6V/CkEunIXeO6Wc/pK/CeuJ76UDeHyD9w4OLmUHZRCfnl4e7jRZhyJcpxGKBUXBUJqXF
 SlEoWKzciN8+fvF1SWfsOvjZ9WraStG4H1F8gwpFWtLemxK5I33sbofBUnaWHphwj7by
 oQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355116; x=1713959916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ox5LPkHgtGr2/XHUCfFXXYvppG+HqbU+7l8WZ9khYtU=;
 b=cgWrNMFwWqHdB2Fze8lG6RvRQp0BHxd1doM1AUBSIGrECP+vXHw50KJWAE1joqOlWb
 cAm/kk2bSyoYbjzDduKb2OPTfN/DbzfQkmsxDvr/nzJGetYzAfe16o7w0oyFVYPjNrmQ
 OECLlPP8HWqyQ7jl3KythEXBUB6t75oh50Cr5Glmi/+JbzBts670aa9E1SKTqCGA7n6R
 yAumLF+Z1bgBpzgzOH7AKMuSqDb9k3RXofAgzK/YXbXqC5NSdsVFVZ+b/tEpCEEyN2dy
 FctPKx/30TuzjBd5/x3NWnwt2yKLimcICKxBt+pydxX11f6R7TlG1YRalnl/hniZ2RY+
 L4DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUhu/yoU8vGD+m2G0iHkHaBwgd2k88S7HUP7HEd1SvYKmnNc1kpNgmYXthgnpY5qHgmP89Z/4iPBpT2ad6oYDxzlPbGeF32fLUkWcHNSFB
X-Gm-Message-State: AOJu0Yw400DiDVqcQJSdLCtprkFrHJaZOplXZjzjuxgDsfqzMm98px34
 D7R/4uIqBdGujh4vGB0MRqbUJ/Y0R0lJVQqzHO17RX/yNkfZt6NioKWdaqUuVJpeq4akujM+g1S
 rvK5skMNIC1GeMcLthWyEIKVw6em4aPP4Hdm3uQ==
X-Google-Smtp-Source: AGHT+IHroa6k1HZ0B1EjkdHyvkWVW2/keRVisrkhSaTkSXI+Xy1B+n4dLICjNC9Mn6XDdWwQWSgpT8LgLcWwaM+pobs=
X-Received: by 2002:a25:3d05:0:b0:dc6:d093:8622 with SMTP id
 k5-20020a253d05000000b00dc6d0938622mr15444148yba.15.1713355116056; Wed, 17
 Apr 2024 04:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:58:25 +0300
Message-ID: <CAA8EJpq-1QwoM2hEyegpfKnVH+qrswjmTd_hpYs9d9B7gikHjg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dsi: Pass bonded-DSI hdisplay/2 to DSC timing
 configuration
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> When configuring the timing of DSI hosts (interfaces) in
> dsi_timing_setup() all values written to registers are taking bonded
> DSI into account by dividing the original mode width by 2 (half the
> data is sent over each of the two DSI hosts), but the full width
> instead of the interface width is passed as hdisplay parameter to
> dsi_update_dsc_timing().
>
> Currently only msm_dsc_get_slices_per_intf() is called within
> dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> documents that it wants the width of a single interface (which, again,
> in bonded DSI mode is half the total width of the mode).  Thus pass the
> bonded-mode-adjusted hdisplay parameter into dsi_update_dsc_timing()
> otherwise all values written to registers by this function (i.e. the
> number of slices per interface or packet, and derived from this the EOL
> byte number) are twice too large.
>
> Inversely the panel driver is expected to only set the slice width and
> number of slices for half the panel, i.e. what will be sent by each
> host individually, rather than fixing that up like hdisplay here.
>
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
