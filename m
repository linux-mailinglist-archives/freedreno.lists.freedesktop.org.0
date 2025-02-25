Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A507FA44963
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 19:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317E810E785;
	Tue, 25 Feb 2025 18:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HimF5/Mr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A110E78B
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 18:03:31 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54524740032so6045770e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 10:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506609; x=1741111409; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8O4HWot5EUMVzTxv5rN66ccO0MtiNkXIqoN+/YVntbU=;
 b=HimF5/MrniaWKHFoKSNWSzOBwvSNININaIFEhsmMEN3GOgxWT0Wel0hnzYm8Yttyty
 EpjGJN3qa8waKkh8dpx2KQEucgYeycpexUmLFs/finWN+fUxnX8BlSFtF4tIudE2imiR
 4yekKTTL1JWJz3kZ1/LAneCxvNM6yQL9UpOVSGRLZFFh92Es62Ln1BoPDpZj03vwy8g6
 /eS2dCokluIlPCrnRVK2y48kBSX8WHQg5jo3mFFKpj1WaLrGh04B7AA8TmCbowAdIQaQ
 3FDi1vsIKTxewcT2rf3r3ePpGElBsB2m1sdVxo6M+cROzeeQVBsZob+jTKg7+j8/wdty
 NQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506609; x=1741111409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8O4HWot5EUMVzTxv5rN66ccO0MtiNkXIqoN+/YVntbU=;
 b=fzq5b5DNkcA/O0w0bULXd0acRCIUPQx5jucNHtiOxZksSBB5ZCxzQIqIIC/HtSnu4M
 C/StzKqMO3fgc5PVdhpObRStzHNhgIO19e7nLf84tASlRU/DmJpgOLY6dH1PDZ4qygau
 w3M/s8Rels1noYVbwrzn7L0EDVOg+qpibIDPDE7btQnYBuOkGOdUbpk7rGWPpOKMsrug
 0kvsHldIzHZ3F9usXuLT+0Fn9m7Uzmr+9+p4tCNXkT6r0H3DwQPAAnAgKtDqsRi+uAKt
 U5u6F7Fpj4azKwtP6Suce2DItlAP3NevSJK1cbdbKhnlQJfdfaB4T8M9y0GqCjm6xxkY
 xwqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvHbH03KCnTCbDM5t/8rh9F/1TkacSp+ODI7aYMGMp04/WlEWT6wquQgycCeT3OEqzEwIKhh6N+MA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjCH+uOvpmEpVm2hnymt+M5WA/ZrgxiepR82OVYPFOxyrmsU+J
 RrLdLlI0wMvy8vU6n20+rQcgW07ON/WAd8JVcofPV3RcCFW1PKPwHvb4cDRqiek=
X-Gm-Gg: ASbGnct829Lc5jbVk9VL7ee3ALCQnpHRGBZTMribIDW6VJEBwIliulELDu9oNQp/1g7
 9p5IXxhKkwZWSEeCe6+GCHuxnNGtz9HrSIyaUq1+mUI+Gkyx4HjtyuVglqDSrdTQ/saVAp1XlHD
 nxp/0ysY4qxLyx8aHXMm0gi1pz0TB+7i6gMIlszRRj6lCWUrdgEif3Ro88F+aqNemzNnuQjfghp
 BX/HePydbA73IKCQPL1ar1vQxULWdngnE6F8l1rvNfgUieNqr41HwjSBCxF4mfsTo/ExwQC7yI8
 Ymz0G+0w53QGF5bMGC/zIvZDXmt2zmREsXdXgnCT9TsvhmHDWqp5sjhzV7OVZ1HCi0TQAuMoUxr
 y13UG9A==
X-Google-Smtp-Source: AGHT+IG0Zc7wZsxG0nheOFfzzmCVwdzpAM4bFH1CEvsvsI0SU1fbCv6O1tOWiwsm5/goJ00WgZzfcA==
X-Received: by 2002:a05:6512:b05:b0:545:8c5:44cb with SMTP id
 2adb3069b0e04-548510dc89emr2751908e87.31.1740506609286; 
 Tue, 25 Feb 2025 10:03:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514fb084sm234263e87.221.2025.02.25.10.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 10:03:28 -0800 (PST)
Date: Tue, 25 Feb 2025 20:03:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 11/11] drm/bridge: anx7625: change the gpiod_set_value API
Message-ID: <rgdujikhrizof6p67cztu3oh4svy7do4okvowlgxg6rddeoqkq@hjc7pni57ilb>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-12-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-12-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:24PM +0530, Ayushi Makhija wrote:
> Use gpiod_set_value_cansleep() instead of gpiod_set_value()
> to fix the below call trace in the boot log:
> 
> [    5.690534] Call trace:
> [    5.690536]  gpiod_set_value+0x40/0xa4
> [    5.690540]  anx7625_runtime_pm_resume+0xa0/0x324 [anx7625]
> [    5.690545]  __rpm_callback+0x48/0x1d8
> [    5.690549]  rpm_callback+0x6c/0x78
> 
> Certain GPIO controllers require access via message-based buses
> such as I2C or SPI, which may cause the GPIOs to enter a sleep
> state. Therefore, use the gpiod_set_value_cansleep().
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
