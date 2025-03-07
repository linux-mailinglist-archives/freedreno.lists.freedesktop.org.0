Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1EBA56054
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 06:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEDA10EADB;
	Fri,  7 Mar 2025 05:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QxxxrwbL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B0110EAD7
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 05:49:50 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30b936ffc51so12193051fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 21:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326589; x=1741931389; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jN6ZIl4heduOl3aV1Xlhy1GPaNYpaPeTUI2tGOU7POw=;
 b=QxxxrwbLVqCaItnjB/RhxnSTM4X3jCGU4H+Bv5hy9HjJdhba+9jcp3kDHMJXBTb7Mx
 yK+7qFEOlAMIkj6Xr7C2ym4wZqhlqQ5XHcDYWD29I0T/Iarvnp3IokhYPr0U2sqjTaY3
 uaPvRkeGh7272HVln+OyLbyk2OTK55Y0bkx4qQFYhe6e0dxu1qFwJqyPfUZPeybowjgc
 V4x2H1KlGqA7KEIdETsshMfcyDLUXuHSOnibZhcLnjJ7UhUFCObHQfS2wAc3ww1sZmFl
 xtTH1Z/4DI5KzNJNoFxpX5W6lXuWPwdQ0vHXguNAodvB3DmL6AY2YCDjxKpEVW0SlZtD
 QwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326589; x=1741931389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jN6ZIl4heduOl3aV1Xlhy1GPaNYpaPeTUI2tGOU7POw=;
 b=rKxLrGr2rQSD70sDxXyYZY/611DwDIqj6l5n+hw8bxMAycyCJ3WBiHTDWsLzn02EbZ
 91pmmG67OloKn0Z3nJOOT7t7VH2G401tBWu/iDEUrXNKeOYh1PqmoFKPnp/d055uFlv9
 oZNl09e7MUZcFunKIzUrVtLksgOQazZBUPCO8czRYv1No13R2ksZVAal06WP3okTTtqs
 EcHi+cyjTMRS+cDLOTJGTuMxwVnDkNCHbDDf1bG0ynlCek7/WILwYs4fAts7jaB7RSFa
 iEjVdnjBQWXsWtGiUTIvR0hJPqJbsq62pJSqoZodqeDQCRTxeWtia+1qtgHfddMMKMbl
 XlQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtSMuzjNYiSTz2XN57Jo9KNlb+TrZlYK2Ggoj9MeK/vSn/MKFue6dp2LuySoSTC+D7gBMsq4uaZDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiIfXKiXd/Bu0qrqKlrwhepk3xh264rmKZ3TXFhryMVf06/gfD
 FGOncnT+kn6t1eNyV2Wtf7BSJpnlS84yI/6WIInoh7KEmacqQA0caaXjoSh4WNE=
X-Gm-Gg: ASbGnctSytuArjHqWVfoWtwac+AjpCo2NRaPN1Kl6t2PnWqKt67BeEILjd6DoH79iT6
 RcDIpQZwMQaPbou1YYa6okFR0BbIbxsWpJmHd3UVG/DYF8C+wTWVL/mlIEE69HChr4k7axFVOul
 jFIqnukv4NLhUjJibB1w1pzXDQvLrXvzHpX1NCYqKEejO3V7X4Ym5wKK9WqRevopP+J9nF2vWvc
 v+CArTr6sTUHM7ByYg+/bKPH847rlodslzKrL2wK5z7O3V0RmwwRORtYBr9WGc+3aTBkg316xF/
 WjqH8gI8bpR4g9dHM+j3d2vGe4pDDOlRZ8yuFdIxJ0dVtEj3ZjgqCm8wF5L2Y5EeNRknbvuorl/
 HxUM+MrVAj33RnVYUygOW/8p4
X-Google-Smtp-Source: AGHT+IGP9JChyCLN8oP+7KejrIg47v5OBKkR88FiJPVHk9F4HcqJxHQhiZKSP3fE87nRAiAkngPRQA==
X-Received: by 2002:a05:6512:2804:b0:545:2871:7cd5 with SMTP id
 2adb3069b0e04-54990e3ed57mr611055e87.15.1741326588773; 
 Thu, 06 Mar 2025 21:49:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1b2d66sm382417e87.153.2025.03.06.21.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:49:47 -0800 (PST)
Date: Fri, 7 Mar 2025 07:49:44 +0200
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
Subject: Re: [PATCH 10/11] arm64: dts: qcom: x1e80100-romulus: Drop
 clock-names from PS8830
Message-ID: <737cuybby2fsp5hl2c75q4dajax2keymfe7ka4w2b7omw5b4yx@elprmcldts5r>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-10-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-10-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:22PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Fixes: b16ee3d0cda4 ("arm64: dts: qcom: x1e80100-romulus: Set up PS8830s")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
