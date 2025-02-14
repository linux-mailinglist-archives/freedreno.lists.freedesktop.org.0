Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18408A3617D
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 16:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E394C10ECEC;
	Fri, 14 Feb 2025 15:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sM2Ozt1P";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED15C10ECE9
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 15:22:29 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so22346101fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 07:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546548; x=1740151348; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fJot5B8/dqhQxIfQ8JsIVVHPjrU/SK2cqPunhk+EjbA=;
 b=sM2Ozt1PHxi3s0IDpvtLBwR23lMvQdFDYR9/e6gQ1+Z7XmHhtkXPkwj1OrHjRpc6fj
 pxgTmMllWuvB0hLOtsAGlLOlHCX0dqPwr7JHsnwuqDFZv91xdFNAH1A0Gef/VWi/c63A
 uEK7g+B6GHCK0h7qA3KDrb1Ol1bk6G/fhw02G4kx1eBjgVk9V50OhORiJnXacbu3eZ7i
 sWEAYVlKXC5XKMjJXt1xD08NS6RKi2Le0D3oru72DZOHxnwQ2Hd2p1to5lj+jgJOQ2M2
 SJj7LRTIJhG4/dnClvciJ5avFu7NEJAJl5noozw5eeCoqAGDd5eknAaWgfUThm3FE7Ci
 Oogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546548; x=1740151348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJot5B8/dqhQxIfQ8JsIVVHPjrU/SK2cqPunhk+EjbA=;
 b=bcRMe3lgTa9/T0ghAYGuYfw0WhPPXgXzGsSNZBO0/Uc4MSmvHIWGiXF3lyLULKjbV0
 ZEqga+IKv7hVTgLdvScPvQlOmaGyvONg9fGeoG2sDnbOAk1TKZiglqdghgUCSrwjqVBX
 qwll7A1oo6ry1lEwrsvMMBXL+xGQ2NLseeFXBtjRvEoFm3xhO/CjhEoO5HJ7LjpVqVxQ
 vOsbhk/YZS2GZCb2Ou3WdzR8ADqA2oYRa4mcMDrcbPcJHsp7vrOESGKwnqcfh4g1l/pK
 RwaCAs4Ypn+zDz5h21v1+mqE7EeQm1/x8cYWiUH3ZOSpjKssVFuQWXipE73zvq/Llxd7
 jfUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGaEqZgm8wufWKyKOamM7fQiyrPVTbJQ1sPjL3ptrIrVS/SZ48H8u9kJ8r+4gpUQdQDOupuOT4Wk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSexV/Q9Cm3m1mKKkzPMjQFaJSgCTDFg3Si5lhfuqudS82ewzr
 dNDwK9yV+91FLjBg5yGIvv4UhMz/we4KsfIOn8oA0fGyewRWV/v7Q1As6dr6JqQ=
X-Gm-Gg: ASbGnctgcrIwu7FZDSIEZIudBDcvYptLqKYH1yQE8ggHshexKXDtz2D4ptRpqITru9z
 KoP/A9s+VJIQwtBkyjU6qvrxCuPw6lkf8fl/zaY+YTTxXsckZH14K8HqSy6RLRZyxgyaDpMUYx8
 lshEdVYd4ZOFZIOLKZq0Ux1LAQUuf8c8SqcJkZYHJArkGw82DctOVAvnzKkhxLRuLrGaIRHY3Ue
 lTo64IUS8Vn0g6OqqlYZHjRkqK8PuyicsSmhYnqgraD2TD8sa5mTdMYc/ak9RnHR05g6AbAGCBh
 94nVZLhjsh4emfudajiTZD0tDkpxeOzbtMtZH1Rm6OaRaTZ1EGwATrDYxC7C5CSZjpwTgD4=
X-Google-Smtp-Source: AGHT+IHd6YyZaJ0gJzVV6IzMidNDXlHHAg8FDIw7tYf8COTL3g2DYgMEui7KrHFl59zy7pcT2QzHdg==
X-Received: by 2002:a05:6512:3c86:b0:545:2a7f:8f79 with SMTP id
 2adb3069b0e04-5452a7f908cmr1095665e87.16.1739546548279; 
 Fri, 14 Feb 2025 07:22:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09aae0sm569393e87.64.2025.02.14.07.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:22:26 -0800 (PST)
Date: Fri, 14 Feb 2025 17:22:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
Message-ID: <aarbydttw4zexzkorcr4yb4swscw3crn65u6eactutpfgpnt4y@fg4zyd45xwln>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
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

On Fri, Feb 14, 2025 at 02:17:44PM +0100, Krzysztof Kozlowski wrote:
> dsi_clk_init(), which gets the clocks, is called only through platform
> driver probe and its failure is a failure of the probe.  Therefore
> NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
> value stored there won't be used/dereferenced afterwards.  What's more,
> variant-specific clock init calls like dsi_clk_init_6g_v2() are not
> doing this cleanup.  Dropping redundant code allows later to make this a
> bit simpler.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
