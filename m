Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C59763B1
	for <lists+freedreno@lfdr.de>; Thu, 12 Sep 2024 09:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E5E10E88C;
	Thu, 12 Sep 2024 07:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xme/e0+V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586410E88C
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 07:57:59 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso8555001fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 00:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726127877; x=1726732677; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ox1m01XCLNWbr8nh6dVZJd3HpwbkC9RDWpp/m3khnEc=;
 b=Xme/e0+V+8aGB/Rx99T1dGZ9VPxGiaU1XfQAPvLs/0k0VfB2QJS92X6Ajncxf10/Jx
 tUCcT+S4+WPOlRTRS0X/WvC46MfWeDShy6w/Omr0yQKORZbW6yn1P5EDZsFvKPl97Syp
 KAAWgHdl1odCwaUwj4YDomfWd2Y882LsvBKTjCFO6DdbnPBNzuvjDhqDQSjLRfnIbPPY
 tp5KnZq/gw/RgfIL3ES4AA6PEP4baPRszF9m/Qingn14USq6wzLp5eqiXoSgq3biSidT
 T7E/HVPRUGHp3z1aYHTrZbGAEVJO+ye9qoMmcQ1nDGgwez/SqV32jZGtJ9o3u9VdQFAA
 FkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726127877; x=1726732677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ox1m01XCLNWbr8nh6dVZJd3HpwbkC9RDWpp/m3khnEc=;
 b=kAZ0ZPQCwgwguM07tzCzcX9Ovme9ZgRGFaV1N3k3MpeBzg4V/cxitdCIcZesVz2pP6
 rPY5emMgc7N837U/BbgZTq+qgPuG7DG8POoba++rXYEfSA9wA4AsUmxLx95/x8cdnOS+
 leG4ybNUERVg/HSm1H2dNkjq5Vi8a9ZQ/M3LJhX5eDgHdEROn1KyBezKlFUGKWUymczE
 aqm8uHVmw13RG+X7Qs+pKQys/0RCQZHRqGF0C+PanB2Nlzc5t/pRAUVdGw98kqfjcRYZ
 OAuEmA7PWqh9XKxFLyM3XCEq1YKQu2KFZz6GC88T674RRX5nCub/COjO9Z3G1eH0BHsK
 mcwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSYDjZs5OZSw2/zzh6XTcDYo/50W+O0H4XBA8Z8kQrhgd3yNoUrEqt7hIZhoqqkckaTDMDHctvvJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5f+6G3sWyCIm4gGyFt124kRFwFG+ISq8Xqn9WPnQPEAEDXHCb
 9p3gaVMuEppzOQa8yZu+IdjlWESo44oiXJvBzm6WOqF8lHRy7ap8Z34RXbsyXGM=
X-Google-Smtp-Source: AGHT+IEMx5McwfR5w48GvyKDso1IkapKp/bxkvo0CGrrFUuAGOcvr7DDSK6O5G6wN5uQdo3VlohPbw==
X-Received: by 2002:a05:6512:39c7:b0:536:545c:bbf6 with SMTP id
 2adb3069b0e04-53678fb1dc9mr956157e87.1.1726127876818; 
 Thu, 12 Sep 2024 00:57:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903ca4sm1825185e87.192.2024.09.12.00.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:57:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:57:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <5uttdpchtd7wjzppve3e3hby2s4adft2tv7ceshyuarir3ppiq@u2fcdqs4uqr2>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-4-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-4-quic_mahap@quicinc.com>
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

On Thu, Sep 12, 2024 at 12:44:35PM GMT, Mahadevan wrote:
> Add support for MDSS on SA8775P.

Patch subject doesn't follow existing practice.

> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index faa88fd6eb4d..272207573dbb 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -684,6 +684,15 @@ static const struct msm_mdss_data sm8350_data = {
>  	.reg_bus_bw = 74000,
>  };
>  
> +static const struct msm_mdss_data sa8775p_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 4,
> +	.ubwc_static = 1,
> +	.highest_bank_bit = 0,
> +	.macrotile_mode = 1,

Missing .reg_bus_bw

> +};
> +
>  static const struct msm_mdss_data sm8550_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_3,
> @@ -725,6 +734,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
>  	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
>  	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
> +	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>  	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
>  	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
>  	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
