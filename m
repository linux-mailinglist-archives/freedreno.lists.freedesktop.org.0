Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A474A5605B
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 06:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FE210EADC;
	Fri,  7 Mar 2025 05:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BTZC1037";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8C10EADC
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 05:50:41 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5494bc8a526so1621099e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 21:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326640; x=1741931440; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cklowoo6XciocBvug5xE2tihHXT/6nAX/LWrS1DCIo4=;
 b=BTZC1037iPWdNFkQDwuFojxFcpApWneU844dw2Dowc13kFRC3+gx0PfTSnaQZTxgX1
 Z9CU03kUHcGJ6/7R86noATmUNUFjHkfAjtyfCWX6b2ghD82lV2ukXJP9cYxeCCZAe6cy
 1BY4Xevr4/TYZr5F7HAsIUn3ghhTnuNIqK8YKocrA+Y8I7X3/SsukFxK9GxoLcbEHFi2
 Tdj4mII8rhlDnBqCd3kW2AtVWwfpUrl9ssVdA6OqFoGVY/Kg895OG7Jf1OzH8wd20jYE
 wbt6wM73WwqND/AwYUy2gsrYftpZNA7HNNkeaU4zdplUdVheJCahWYKruAktOG/QmHyV
 CKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326640; x=1741931440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cklowoo6XciocBvug5xE2tihHXT/6nAX/LWrS1DCIo4=;
 b=Aq2HoR9BMQibzQDF59oyOnsuUPVR4ltEtDScU0Pgwe5aDiXwnzmrR1UzZfp6rBRe9T
 qTP2sS1da1W2c2Bt+2AhSvtcdRB3KnmF9ZGFF8BjyHfsHzB49/qBVZbU6LtQP3UuMlcV
 BXQDYlf4QhMC/X1uQAFzaBwijudp5wEbCUTXYaQXOZK0mzTaAl3MvmZWKVOVScGqFmJw
 j20pc+0Nk4CFYcyLGSnyJ5qmGivZVtL3dhG3/TxvUMAJ5XewlmXRIV9wZETlnbpjiqli
 Z1OtNsfGswsuJkohopxl1YQyPgPPZWBmvLlcPCWwCkGloa600VzET3i7BuvZQySk12Rs
 aeSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFQWOVSd4zcTePCcz3Zc7B2CAWOGhp8C06+WoxkAdzdof+b/CbVh8WOqMLd8cWloeJYngJSg6Hf4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFrK4qnnZ1zuUI/Ds836Nvz0/WnYH6Vu61l9BwMfoAggtZJ7ww
 N07QV4GhDP05w9Yrn5c67vD1Gmse24YumqFdIhSIFuQstDnoS+bfPMdV4LoUG/o=
X-Gm-Gg: ASbGncuVxcolNkJMCPDmunpH6nX94drgGGp57/wZu76t3fSnsepRZpgWoAHHH4rB0bZ
 55jOGLjYQ3h5WdtKcHvKV+f+rMk/O0PMtIy5Gz3bVS4qX15YfgDZdLr+hduOhByZu7XIP1lammO
 yWE3TZU1XUw/2gCkWnCCClwZDQSo5OrUw2RNhc9iaHQVY8oJTAKFL5g0rg6EMgDaBap8MwPYAli
 5p20tadG2nCA0/KJIDKQQBsgkIIW5M/BjWduQjb56NUhWBroW9mml4MlNtu/TWHPpFkHWpJOfWU
 R71XtfPdJelwOoN1QNwj2ilE76WpC2NMHb15av4RKp9x5n6NeI4JfrH1FmpH5jaggjJicIE7YQK
 7+vkIdzuj3rY5g/b/FbfVO03p
X-Google-Smtp-Source: AGHT+IFxMJzgkc6aT8SLqY3HFH44f3uS0Pbx7E1LtfSoww8PpYJPAwYDmAvb6be7iccEdwfO0MQmLQ==
X-Received: by 2002:a05:6512:12c3:b0:549:8cc9:67b3 with SMTP id
 2adb3069b0e04-549910b5d9fmr492625e87.42.1741326639884; 
 Thu, 06 Mar 2025 21:50:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1bc56asm382830e87.183.2025.03.06.21.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:50:39 -0800 (PST)
Date: Fri, 7 Mar 2025 07:50:37 +0200
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
Subject: Re: [PATCH 11/11] arm64: dts: qcom: x1e001de-devkit: Drop
 clock-names from PS8830
Message-ID: <ec272btbpxlewp2qiz42c7c77gpg476wdzx23dpv7fqoe2v5fj@53vu6jgpa7xc>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-11-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-11-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:23PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
