Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA6939E2E
	for <lists+freedreno@lfdr.de>; Tue, 23 Jul 2024 11:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A3D10E537;
	Tue, 23 Jul 2024 09:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="jtMOFAVO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBDE10E538
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jul 2024 09:48:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3685b9c8998so2257280f8f.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jul 2024 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721728100; x=1722332900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rbEJArM2criAyBNgn8vJ5ITCWqJpj4+z96xeB0rfsFI=;
 b=jtMOFAVOP3KuQBHXIC9bCau6g2Zu70Uohe7M77Nfxis6QXlSQwAIeYBLwr6QdW5fc0
 Kq9cFAMXAzjXSnetZVk2TXrHOeH0zBwPGcieWYUyWOMLkYpmvzkMtSRCJwgLnhSDWCCG
 hkqg3vDfhR3+Y4VeyjU+QQrmunmyKQ2X3nHonoynfd3U4oUo8so2rnCctm2naqvp30lz
 4PLfqiB3F757pQJapFV+kT4DFhRTE/Zj5MosocqdOiO4ny2P1R5cJNm5K2f4Fo9u5ppi
 JkH8WphDJ1VnkqZvEqMLBXhlTsDWdr4cBkE42UT9mwIvsjs+fVVJKftws8uW/+FH7OiF
 GxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721728100; x=1722332900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rbEJArM2criAyBNgn8vJ5ITCWqJpj4+z96xeB0rfsFI=;
 b=sl4bqfCM5bASu5rdKdRsIpoae0WeCgU+vMDX2i5cbKNrvvVXy4Zpe/KfawdQFBKPAw
 PKyJfi/uWSsqG1blVLfhr2O2DuBHyEn7x+0iFj5hYwAwsrAAGw7zw9YnV8obNjS9fCeT
 g7/fh2tpYRcBCKoXkS5P4nBbQM/dNcVQqJIKYlG01Qpo0MyZjRyFvJdrX3h1DhnXKypf
 dsOzxyDXcI5seu5WCUjbLbgvYmDs0p0sSWEWhuaTtpa5UOeUuFj5C11WVAXQZUrzl/U1
 yZmoo4vC/6G22NOFOS2Ys1LIsBHTHz8C71SSMIH1nkGvr+dlptXMeR5dSETj6BTazQey
 b5/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbitNMAL5b/y+WDDyjMv/eDlbI1x5PqGIcm38GseGlK6YQj6HDGim9xardFd9JkePVaTTxBQFmY3sXGl/ybaJug2fSFK1ms2yFm36abdUW
X-Gm-Message-State: AOJu0YxueM5kIf9HsQdfKH18kd0ntnEOFqkRIdH2Vvv083J3tgHuoprA
 blDrKfnY2rBsPm6HBjm5Y7UvpZeC/xroyXFD3xSaNJsd35JWJdGPWwS+qqtorig=
X-Google-Smtp-Source: AGHT+IH4hk/YqpKQL3zW/Jf38G6coS3kepTKE1VDym0yEzRHfbf7GMeH/Em3PPXdvHdzhvTFpRLYnw==
X-Received: by 2002:a5d:4992:0:b0:368:4c54:ae27 with SMTP id
 ffacd0b85a97d-369dec2931emr1628909f8f.36.1721728099886; 
 Tue, 23 Jul 2024 02:48:19 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787caefdsm11053461f8f.66.2024.07.23.02.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 02:48:19 -0700 (PDT)
Message-ID: <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
Date: Tue, 23 Jul 2024 11:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr>
 <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
 <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 16/07/2024 18:37, Dmitry Baryshkov wrote:

> No, that's fine. It is the SMMU issue that Konrad has been asking you
> to take a look at.

Context:

[    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
[    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
[    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
[    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
[    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
[    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
[    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
[    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
[    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
[    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]


As I mentioned, I don't think I've ever seen issues from cd00000.iommu
on my board.

I can test a reboot loop for a few hours, to see if anything shows up.

Regards

