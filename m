Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19588A56061
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 06:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA23010EADD;
	Fri,  7 Mar 2025 05:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rVqekRQo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813B710EADC
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 05:51:14 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30bd21f887aso11971731fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 21:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741326672; x=1741931472; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
 b=rVqekRQooHvQGylVN/J8aUdHPTQ2sX7qM/grC/zR10TsyLj5pA1b+EY4ZFQsMdgxE/
 excgapqwDw4xr7e8pJTnfqIwXnl1cwVW4wyEZRQCsB/WHoWWTH/90aHVL2uBzIvFMd9I
 FbKFfeiatr09YvpMj+RPY4Pl2nz4k3WBNLtySmdMeqoQXnqYOREWTqW1NipWpcC5qz6S
 5wXfEpH9EIg7CNr9Zs2kjOOpF+dwOkGR1l2jxwvtBtiz0k3b+Zw20nz1HB/jZweF1yXo
 AHHqfkxgZw/3F4ifnCNhukJV3eS+2SBL7os5et/7a+IVvPTnmkjfQkNzyj2nYtQlZWsD
 eEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741326672; x=1741931472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
 b=lkkVSenSa6cCnDqHsVfJU39XhBoWKJxY5KFlGlsAPyk/uwZKAZF7tPvlXPNK1t75pZ
 CzUuHCsyvVK19aIBsPrxl7iqJNBF0BW1R5/GzP+qikMqmwkJpmOpUdkmCzkzs/9fOHoH
 1237vB8fvXk/4oTa0FDQPY/TQ/tFIYJ3L0MB0go9DV7JtHxHYjB5FZ9LkFDUte+jpqmy
 dWXw1rtIjtY4ZdlHlGqfcEI1FHl0MWx7hjUSVcKTr6rp3J7FiL/qvj8hDW8ZXxj+sC1q
 FuaEms8Oi7obHNsCE9M0Jb+7RRfmlgrKf9fKW26YJpeUPiURyTJh93vyUc76R5XteFP4
 yZnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjS0GFQOsaZn543QGixZWUUH1C9QmP0nB6msD11iD0VwiZIquQfQyRsyRbtwgYqV/7eK1kK+FbHeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywczh6eOY0bUEbv0friZve6+NSVqWkCZ6/hi6pL/GGmr4pTriFW
 78uDR5KAn6B6+Le1nESOHgWR2eiFvmwaLtatCbb4X4hUnRkjSqorzbaJjxqP/Vg=
X-Gm-Gg: ASbGncteiMFbbTAAFP1y/rjP7em3MUNrJMoBQ6CrFGPnfM+mJAtLe3cmq6uHUkL+q0i
 DMVurapUuRT2Utr+qmi/eoccqBYbRz4O6exl28LtArfaAZAt1PmC4fQ3Xybvq/pAtEjBTDkL/eU
 fiQU8DDF+VSxc18tCGLZwg4bXnQfmpO/lsxrizktQ16/0iRXkdL4UD0fah+QWH05GjYm1uAhAPO
 1O7CDmHeCQDkF/b1+0IVkiANFTYpDzgiAKUhDJLLNxiF77Is8lIJpXvKWORiDbabE7rDzgMIie3
 TCUYVPJyvokdDV4L1ncir2mHMskC9n38yr3W4w1LzItgsKhab7W7UDBixfpiREyFN9zjSCA+rFS
 Vw6mEE/Im3IknRuAtSUf4qCQE
X-Google-Smtp-Source: AGHT+IGZcu2fypEgK7clxXmR93TzJ7unEXU/+kahsKp0+Qev+odXPrrlaC4iINRI4Yd2AzKHpypLwQ==
X-Received: by 2002:a2e:330e:0:b0:30b:eb08:53e3 with SMTP id
 38308e7fff4ca-30bf45360acmr4804561fa.17.1741326672025; 
 Thu, 06 Mar 2025 21:51:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be9a073d0sm4291591fa.112.2025.03.06.21.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 21:51:10 -0800 (PST)
Date: Fri, 7 Mar 2025 07:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>, g@eriador.lumag.spb.ru
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
Subject: Re: [PATCH 09/11] arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop
 clock-names from PS8830
Message-ID: <bth4rfqqu2bat24avosimvxuqmruc52taues4wljnhfcmxnx7m@zkjvf32oiogt>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>
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

On Thu, Mar 06, 2025 at 07:11:21PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Fixes: bd2dbbb1f35a ("arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
