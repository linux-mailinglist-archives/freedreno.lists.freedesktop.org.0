Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FAA323E3
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 11:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDE610E84A;
	Wed, 12 Feb 2025 10:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZVKY3Abz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2E110E84C
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 10:51:14 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450622b325so3968045e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 02:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739357473; x=1739962273; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kFIw2XQTnE5Os4Qc/8wjpDzMXcpRDMes9ZJKySbiInI=;
 b=ZVKY3Abz0R9AdXnoQQTwU1lB/JuB+X7GeFH8FmTYT84qu89yaxspO87LWBM8edkrk/
 q1GVklLG8gwSpjum2YTQmDvcCbAsvVmLOD2a26kqpdh6zf0HInxBHwbUbpT0VNZ0Mi0H
 Wizr0cwcwNuu4RpQvfiWoSNBhOmQQxOiRc9Wg3ZLC5/SuldPYNdFjHQn4lDkXu+ieq4h
 4xpPmZVWipkG9KGDL0UHv6BX33i54gWxEmFnNfgAl7jaU7XiTZeVxLiNGx9Y0k55oapH
 6V2tf8d+yW7qrUdJzwOYfoyoc+TP55N6g9/+qLmGUHwwGZAjhcON/Ovu9VHWbiY8cyG8
 Ss+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357473; x=1739962273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFIw2XQTnE5Os4Qc/8wjpDzMXcpRDMes9ZJKySbiInI=;
 b=o+J0AKvNSHq4Gw4Jq2om89/oUR60H9wD2GP7i5dFRi4p8XX6YeArRUVInK1fVgat56
 Fmjb/35xWtCFrkFBCxeG4i3eboeO3X9PiETBEnFi9H/xvDXJ9M0kJrXqWF1a4wLbuKM8
 xCiFwEoMV8CxYzbTNLUWFL5+tWdKfd8s5k5f9tDmyRChRMFPQhOg3DR5jyFWwjWuuohe
 wNcJl8vCISZgZAoTnC03jLdQVIq7N6m8MJ16FtHEjg6be4aSYlVpmk6wW/v3i/JsSakz
 IZzuWobsmf1wQ2cELOKMXIbfFcWm2qf6qqRa6qUdk4lAhjoj8hkn61RDyRRQVkRycriO
 Y5bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8vhh2Qwpk9exDTkD32bNPdRRi1sNsIPaS4zir+/fP9r3eGgYNqo6dOE15sHaOvEdTTgNSX5Pgyw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm3JU8HfBlwbNaES73Zi7zwl0PEO2/H5YH2sgeiLM/JzSh6QJf
 byTL7+tzxi/F4ckeYeJL8s2N/z1MSy7WCs3uIG0s6TbpuyzJ5d3UaeelApNX/fE=
X-Gm-Gg: ASbGnctElxD0HnQd9zw8BYQrYMQvXaTLvU20yzB8sxpmCr/kXNMqQzOPPyjrfSfWRkU
 qBG8oB1Nt1wMlo0bDcU/1g2LMc42S4BVAtqTtW/IK1HMLibB0s+LkflMJ6v/406w2htqko4FXWj
 vtmFEVqnrnQkHtHKpNrsk7HkYV4zQyIihnucm5BWSSyFGz6UR0Qj3IeYx/y8REMchvqRMQh0CEq
 Z+bs13CxkbBJB/J/2ZYpYIB0p9rWdXU9a/Xftwe4qs3M02jbQ8aqhoa8jbbon6XXNjp7biYJd60
 gEoe3jc6mhs0eCKz+aSzgiyGWR57kZ/VMdV8BqIxBV/2XoMdL95UCplw+xEAthcKdUIfX+U=
X-Google-Smtp-Source: AGHT+IEDzcPRrcce5UnawSDEarFr9+DzePDbU8ly6wk16sOl8kdhRUbYe8aGObQlOg8I3bS4B63NyQ==
X-Received: by 2002:a05:6512:3155:b0:545:10e1:b1c9 with SMTP id
 2adb3069b0e04-545180ef774mr625448e87.20.1739357472850; 
 Wed, 12 Feb 2025 02:51:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545166da063sm353803e87.77.2025.02.12.02.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:51:12 -0800 (PST)
Date: Wed, 12 Feb 2025 12:51:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
Message-ID: <iwr7hcavp43u2yoif5fefd7y3q3rlfx73gxdyfotfuz5s2jalo@kzyt4kotpawh>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
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

On Wed, Feb 12, 2025 at 03:12:23PM +0800, Yongxing Mou wrote:
> This series of patches introduces how to enable MST functionality on
> the qcs8300 platform.

> The qcs8300 platform uses dpu_8_4 hardware, which
> is the same as the sa8775p, but it only has one DPU. So it only has one
> DP0 controller, supporting 4-stream MST.

This is irrelevant, unless you want to point out something else.

> This patch only enables 
> 2-stream MST, using intf0 and intf3. The first and second patches are
> modifications to the correspond dt-bindings, third patch is the dp 
> controller driver after not reuse sm8650, fourth patch is the qcs8300
> dts modification which add the clk support for stream 1.

This is obvious. Really. Instead you must explain why QCS8300 isn't
compatible with SM8650. How many streams are supported by the SM8650?

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This patch depends on following series:
> https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
> https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
> https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
> 

Please don't patches against series which were requested to be changed
singificantly. Don't spam mailing lists just to be able to 'FROMLIST'
them. Instead work with Abhinav to get this patchset integrated into his
next iteration of the series.

> ---
> Yongxing Mou (4):
>       dt-bindings: display/msm: Redocument the dp-controller for QCS8300
>       dt-bindings: display/msm: Add stream 1 pixel clock for QCS8300
>       drm/msm/dp: Populate the max_streams for qcs8300 mst controller
>       arm64: dts: qcom: qcs8300: Add support for stream 1 clk for DP MST
> 
>  .../devicetree/bindings/display/msm/dp-controller.yaml     |  5 +----
>  .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml | 14 ++++++++------
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi                      | 12 ++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.c                        |  8 ++++++++
>  4 files changed, 25 insertions(+), 14 deletions(-)
> ---
> base-commit: 7ba9bcc5090556c007d9a718d7176e097fe54f19
> change-id: 20250211-mst_qcs8300-4c18a5179165
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry
