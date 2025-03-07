Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE71A5603F
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 06:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0A610EAD9;
	Fri,  7 Mar 2025 05:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H8vT/vUM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E682610EAD6
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 05:48:35 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bee1cb370so10371621fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 21:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326514; x=1741931314; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xIUlPQiEEjx7lB+nUPvIprXpkiiTW4hGNlxewbBn0Vo=;
 b=H8vT/vUMtHt/Ir5xKU7dGdBKxK7fONcJJk5IaHHyoJYRRPsJHxinrUZWfrv533zIcR
 u3MwieEmuFlp+U4kmTg7ygkBqSoVse3Fstv3awPzkCue3PK1fNfSp/q/ZUo3izCb6toT
 oG3zQduk8Z5SpskcGxH1mNoia6EotJCssWY9jxI0T6NPvu2AR+TuN7L22rt6PdofxOLh
 7LJq0ti1AOmqmG8N0i6AQO929WUnpFh7yzY/9hX6lw2b14lvQZSz4fMRtJ3eNo7w47xK
 kDHGGKqM1eUejx46uNs576mQv03k3boc6BmrUOu6dPoXJGrOOZ/7tCOrjcQ14xJUHSCe
 NnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326514; x=1741931314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIUlPQiEEjx7lB+nUPvIprXpkiiTW4hGNlxewbBn0Vo=;
 b=i2iHbuAIqp5p2kc8KZc/FL9z3WULx3pqfMhAm9aIh4+wWxKX9GRd+ji2sg47HE4IKl
 x9qh2cIkBI4BmqZFkcNNVeIC7H9omusrI4bU2J5IsfvrUcyrZbELjAmM+xZt4r50orRe
 WVjmMcL6C+Ye4u9u7DS4/6w0Z9tVbp/xYwvfGGQ9qYuDqfLCDCDE4dd8zoF0rx25AqZp
 VjdbAjM4rerCPtu8UpG/xE4xt6raLMVX13fh7C7BRJ09KYOpzE66zRJLAqQP2H1pT4yI
 IkBmefm+9zC6KhGCNbfqu0TDjd2Q77X5fWV0n5iSW0ZBJtlHynCLWkPaY1EoQ48gEMeH
 tFjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKJ7kSs/54ZTSJHp9uIILAzsqiXuFJDk+qL5tD/Jpfa7x5Q5Yx3tNzSNwrEWaawlt+4eI/wROLLYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRq5ALKsPc/52al+S1CNPMHKvYTWT0gGCUrackMZ1L9Wy4QKbe
 1vMUR1jiAxsTfs0nxE1aIKhu0G4xIKkvCWDQv4H5eYp3FcMSoyqZm1MGe6J3Pqg=
X-Gm-Gg: ASbGncs6JUsXRa7PTlryXP8Ri89t8tov0fnY8aoCuyA5IK3MiHsDGV2m7rzlAt4RZvr
 RmJULmhXBm2G9wwkVVtczyo//3K0hpqwj29SxrBbg5zBT42EVvaMyMr0Mi9DWQm/1N3jBVLL5Y6
 5nuJ3iQI8HzklkadlzuyBlaUIuJMACpH9gB83mNZuMo0A6zL/JONC0OADS+bQBtGh87wUhay0Oo
 J+E9EklZADVEXko8FU8GveUa6KgTazgMVtW5k2foi9HfzNk8d9AbwRyMn4Gh/m/k1QPqjZojihr
 /vmvnL53znkMcggcfAPno9OUZAeUgzoz21PwUs6G9jLXtUxij6eePpWYcXd7/tdWHT5TtjYSR/b
 a8SR+JVPpZWCUHiHtJX6ASueZ
X-Google-Smtp-Source: AGHT+IFLgCjDUK+ssfV3W8fYXWF3IcyBRSZKJMxl/h3Pqf22SL2LHsOB83+2OXk5a+mSVQE5lVC+4w==
X-Received: by 2002:a05:651c:b2c:b0:300:2a29:d47c with SMTP id
 38308e7fff4ca-30bf4606942mr5189011fa.24.1741326514230; 
 Thu, 06 Mar 2025 21:48:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be9a07204sm4342721fa.114.2025.03.06.21.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:48:33 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdx75: Rename AOSS_QMP to
 power-management
Message-ID: <zmy54zmhuai5vip7fvdjkf5hr2tsnmmh6ts2labnh3amkg4s2l@6pjfprdfxn56>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-6-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-6-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:18PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The node is currently named power-controller, which requires the device
> underneath is a power domain provider. Rename it to align with other
> SoCs and resolve this sort of warnings:
> 
> power-controller@c310000: '#power-domain-cells' is a required property
> 
> Fixes: 91f767eb6938 ("arm64: dts: qcom: sdx75: Add AOSS node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
