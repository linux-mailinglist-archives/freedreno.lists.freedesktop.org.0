Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B59AF99C
	for <lists+freedreno@lfdr.de>; Fri, 25 Oct 2024 08:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B1E10E9F3;
	Fri, 25 Oct 2024 06:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KSS3ntYH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC2110E9F4
 for <freedreno@lists.freedesktop.org>; Fri, 25 Oct 2024 06:10:34 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb59652cb9so16992331fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 24 Oct 2024 23:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729836633; x=1730441433; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6kkKPNMfQxKeojJArVyXseEAJLG1rkqHbjN5GAes3jo=;
 b=KSS3ntYHqvQdmfuHmNbNAVB/X+4d4ctc1xZyAPcd7F7g4fLr2YWNOKnR/2pIxqg0R5
 Jy6vHJ0n2q633BYmjBi9BcbOVKstDR0X1iiYBvDsbM56lGrXqqJ9Se60jxzR1G8kZkI3
 xLpmZDJd/SFtJBqccIOE6DDBCSL6Bl5MX6H0VPWhuv9W6jQrFj1hlBGY7gfLDuCHu32A
 yOMkkQl2Q/h8MiYYHNkEvI9a67nK++C3w44khOULZjEPo2jCGDUNOMywmEhiHktOI/SU
 Ved95yl6ySkUwk2PvgwJL0JTantKgZpmmaHknTH1ei0eN+iozn9FGHpQKJ8ljImpjLSQ
 fwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729836633; x=1730441433;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kkKPNMfQxKeojJArVyXseEAJLG1rkqHbjN5GAes3jo=;
 b=AKHRUPy8r2jKyGcJQfYLLvM4XLa7vD3F0x3gd2L/3/zkHZTFveyDtpxnD/82XyoBey
 cCkq21JnvMk9vT/Dmi5khkhKsopM85WvJF4kbDNdwSr/6BBm6DpDn4ShmYiZU5fT2M6R
 p0zBwrJzsPrIXi7kn0WeA5hfqVD2MYHVYe4ZDAtobZfSmAXpa6/4Eph1P+j8iTf6ItIL
 h5SJmxalYuLEqC8HmQVk2HkhSxPvxzwlMjGY/J/LOQ2n54Krnh4M56j1hQ9+bce96HOe
 ABvui6ffQcXFkUHZ7XTvYg89iyVl5yHWMCMmjLZDSDWAxT6rN4LIZY1WaaCU7QbLUtjZ
 KYtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURBge/TADhIDeOuOeRxJ2tomLVqTNKSNEk6FBUkpYpowUR2JTK4OREk22ZQ3dH80vNpt5F8E1JCHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCkJmL9AMkJNLc2l+cWhqMJ8Q/pf/qD4zsCet1aNUFRt7uBLj4
 lS1lCVg/HOXmNdqdgf3qjxO56Eo0MprylU/dL+qgNCPVLsthtlyGPp+41bARMoU=
X-Google-Smtp-Source: AGHT+IFXtDyLhu4urkvu/zEBWCkjD6zDt8bX3VJFbWKeSAuwp/zDLD94N+n1R/o9WeiwSGWu061YMw==
X-Received: by 2002:a05:651c:b20:b0:2fa:cd7e:3b40 with SMTP id
 38308e7fff4ca-2fc9d3458camr51692481fa.11.1729836632473; 
 Thu, 24 Oct 2024 23:10:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb45d19d7sm692021fa.96.2024.10.24.23.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 23:10:31 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:10:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Message-ID: <dfaszv64mpxtqnqfulibglshdrtb67fsmj7tqilrrisqq4274j@z7u4qcom77zi>
References: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
 <20241022-a663-gpu-support-v2-4-38da38234697@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-a663-gpu-support-v2-4-38da38234697@quicinc.com>
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

On Tue, Oct 22, 2024 at 03:16:06AM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Enable GPU for sa8775p-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
