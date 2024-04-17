Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF78A8294
	for <lists+freedreno@lfdr.de>; Wed, 17 Apr 2024 13:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B36113444;
	Wed, 17 Apr 2024 11:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mFZb7vu8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64FC113443
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 11:57:00 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-ddda842c399so5714857276.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355020; x=1713959820; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7V6DnLCsUFkJaBmXGBgPYovHMmnV4qT3enJ4vhqHZQM=;
 b=mFZb7vu89CdLkeJyH7p9rX9G+yn80/6UopoQdbDtmBYSOl7UNErjxGj5uznWiG0imE
 BZnWLXNK9k5DkB55YCkIVZ/T7xh/xMRseUI0utG3E10lKFyWdz++k7QboerkVhob9aex
 pz86DL0BdLD8OCrkmep2crPAM203riNlCeWF11etvCzhnCdD2Sj+1EbEorGRqPvYgjt3
 Dfn45Ptj38Bxc2GSxJuGVsBliWI/RzlfaX3UjW9clddXpzfQd/jQGR6QQ0+uvBJTz4JR
 gX43ycTDOY6rk5G+7gmZroYe1zAN3erkApIQqnkIW3hulcQH8kVKdn7PHnOzzRDUbNF5
 vFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355020; x=1713959820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7V6DnLCsUFkJaBmXGBgPYovHMmnV4qT3enJ4vhqHZQM=;
 b=MvAYN8uf6oxXr820QDnEz7mS6zVlLKNXpxaQdbU3w21JcqLz4punRbFqD0+kzuw+Ok
 yx+diLJ8I2ctbToAntm4Cwl68JDJRFvqJpK0+tw3YJtvGEVsqbk+twsFg4cRr0nU9t4w
 AQyFed4drkbLKAvpL+TUcEhPvDQu8WydbudYo00uEbDT/+pMKc/sQSYtUEdwJzYKlwbr
 DCV/01B1QCHQrVd5VsR10ITOHDaYKY4LQA34tbrAhjU463HYFdd4OM4JQ0kIEzLIkcN8
 4lQu1g7Z+nSZIRrOurV5R6KYWGxQVRZRnTbR1TNZCVbbr9GuTOiuisCUdHiSMPwlYGsP
 BU8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxfHN75610FR02cuZhT2AdtBS/HnKNcOoELj8idBoLZoqaP3hwoLXZ9SrHki+HrWITySbBgC58uYitamdCxnQM8l0XdFcQH0gr5vPY6V8I
X-Gm-Message-State: AOJu0Yw5bbGgUhvRanCDzOj33BO+7kpL3AuOBmKAG4KbjhAda/+DWoO8
 Q5yJxPFx3w+XfIVPGb/Mg29JbQRKPhJqgOY+QyV0BsZSc8YtGCIpUhbzhwHxG0vkQ97Oavrz6V9
 bYKPSSSXnp0xWHCW/PCQw9TzMGFENlFARQ5n9nwKFT5krnzrT
X-Google-Smtp-Source: AGHT+IHuJ+P0+tIP8Ja/s31hcE/lLfe8rzFJZRFTNiK24q6dN5Ov40yhIbmq423DTWh9Cjd7EAZUIsIKaKherzh7G/4=
X-Received: by 2002:a25:4ec2:0:b0:dcc:1449:71ea with SMTP id
 c185-20020a254ec2000000b00dcc144971eamr15228037ybb.50.1713355019639; Wed, 17
 Apr 2024 04:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-1-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-1-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:56:48 +0300
Message-ID: <CAA8EJpqJfkRd3hN-QoHaxhP2dUaEOyaqnGzA5MiGk96oTLRO2g@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/dsi: Print dual-DSI-adjusted pclk instead of
 original mode pclk
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
> When dual-DSI (bonded DSI) was added in commit ed9976a09b48
> ("drm/msm/dsi: adjust dsi timing for dual dsi mode") some DBG() prints
> were not updated, leading to print the original mode->clock rather
> than the adjusted (typically the mode clock divided by two, though more
> recently also adjusted for DSC compression) msm_host->pixel_clk_rate
> which is passed to clk_set_rate() just below.  Fix that by printing the
> actual pixel_clk_rate that is being set.
>
> Fixes: ed9976a09b48 ("drm/msm/dsi: adjust dsi timing for dual dsi mode")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
