Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931399D9987
	for <lists+freedreno@lfdr.de>; Tue, 26 Nov 2024 15:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ED910E8CA;
	Tue, 26 Nov 2024 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KGOolcpW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB210E8CB
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 14:22:16 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53dd2fdcebcso5382880e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 26 Nov 2024 06:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732630935; x=1733235735; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NvxvLshTV6jYerFVYx7chEJSlAAM8Tt1+r2hoHp2IbE=;
 b=KGOolcpWIv3Roa163UTUs9EUUdx9tVDWFI5/acZlZRckPzZf0+twoqSevg8/BDTzeR
 ogcNJl7ESzJrlt44MOy4mOSZj8piZIndvt8KPIO15JmTSiCrDMvwiecDjxr2DtZuiuPV
 YqhbWpHN8DSk+5uZuGbZ2qOhEg6z4x3uPTl8LyorOS/JypW3JzpBYxtRi8h4yGclCoeC
 nB/S7Xfs8MdgeDulWFxfaY3nSlyRT+99x5EPCHHn9dJyWkUXHEJ9SY1jL0PxFAo3GBuX
 PT4dkHlU3+j6OK2c/4l8vYxl6szW/hKLDbnOYr/TbfD3jLQyuSUJ09WTO794bJDn2RMB
 Pwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732630935; x=1733235735;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvxvLshTV6jYerFVYx7chEJSlAAM8Tt1+r2hoHp2IbE=;
 b=K/gd7Ha1WsT1/uqI2bNW3jffVvmnjDz0x/gQv3gOQegq7Ax5CvDy504lRuMNNtLwqK
 S2S7tgzVfX/UjMS5sNtJ9OTEymx/q6R5aSliNhRm6uSVW7Vp4soDmA3+gFA3VAfpcnsA
 Ui+6BtDaB5owfvV3Lt02vy9xwKaeTgKkNo+K5Z/Oo+vw/MqCGVQkJq2ckuNMmqIYwUJG
 jl4TWs/Ze7LQYmFzXmwPaV/eUrlv1liJB4fb7IcdhDKsjiJDuIj4DAoZbejVEA5uUqvp
 xyYcjes13snhmLCS2M9TmpwwcwLEkIzu1lsgUGNe+nh35Z+4WPFwmEKODLIJX1n3VIEL
 HtTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuHIk7hVVl4j3+0mQVL4iSEivyu/sTk6/RFu1ZYedkP2lCTmIur+37YMMSQnDB+06g5cYN3khZkIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+AdkYp5USATscwJ34oE4RUBDwOs3g8epcvyi6OF/CRXksxegx
 Cjy/R59ACWx7PBR2dXCpu6YRCdP/BLYCL+H6afSgkGggwL98nJwcffcJM1L5y4M=
X-Gm-Gg: ASbGncsliG0Xo4ucd+57NROGYZV1Y2yEPsI+tdlM+9lRkiwOdr1D1Cr6YHBKOzGJJE9
 a/cuGqwmVEwCfKjVbIvv7bFYQUk996/msXIxf0Mq59IH05JyQzNygRegOTznu3Zk1CS1Sa+omOw
 FRIfxxp1/r2Y8Z0NITQ3hf+uJHLsJQILbLOudB65lIlnEOkz8jupEtOtwL0bwYKnwHkSpetn1Vs
 0lRFlkQ8PVI678DEGZfO36uvoOw7xO/gEga5ZmdCBpVoAUHPdcwD4fmGL/yZjyzF5TwB+T4BUQT
 /MrW3zIghAywHgcwZ8PplHqE/Q7EgQ==
X-Google-Smtp-Source: AGHT+IEAl7X75IiAncEt/phKEqkFqYtoa4WMTlsSJtcMFByYuTRg6SCQ3j0BgI9MU+tyzTVAw8Jtng==
X-Received: by 2002:a05:6512:4022:b0:53d:ed70:1a74 with SMTP id
 2adb3069b0e04-53ded701abamr1046438e87.34.1732630934648; 
 Tue, 26 Nov 2024 06:22:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24811b0sm2054224e87.162.2024.11.26.06.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 06:22:13 -0800 (PST)
Date: Tue, 26 Nov 2024 16:22:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs615: Add gpu and gmu nodes
Message-ID: <b22n5muywlavttjo2iub7uijqbonoeifkqhrqlvfrqadiod3tl@l5mrikdtbyp6>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
 <20241126-qcs615-gpu-dt-v1-2-a87782976dad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-qcs615-gpu-dt-v1-2-a87782976dad@quicinc.com>
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

On Tue, Nov 26, 2024 at 07:36:48PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 

Clocks might need changing to follow the schema changes. Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
