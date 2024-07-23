Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E993A0A5
	for <lists+freedreno@lfdr.de>; Tue, 23 Jul 2024 14:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6788510E174;
	Tue, 23 Jul 2024 12:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="TbNkjntS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B196010E174
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jul 2024 12:57:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-367e50f71bbso3156497f8f.2
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jul 2024 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721739461; x=1722344261;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SeKatBLYJH5XyX/2Nj+nxQW9hTn0jzkDBU0xeQ71mXY=;
 b=TbNkjntSHTE90gtDLH2dBbGmpOgxcknK8YyvYC40wkULMIV9aOPm/ny5Ryjd1E88MA
 zwSsZRC5ZT11FksLdrVhvzo5E+HS1hBeA68mduRx+aOSwc82pth1ztCJZ1BsRsJltDCm
 jaEfUTQUNozqL1OmQ6wwjgYgRnPOmT4hgbRiGRnkpb686sUWu7JMaBdiIazeYXIWdJmE
 3nPKG2D/YpP1Z2fblMpUuiohI6MAgCHUp6Fa/ZUIU6Q7HA6XF8I1JzmIzvIGAjdeYtPR
 hF8UwAtAQrm2q+DlbH4XAi0uJrI6R0BXKNAlTEB8lJzLpb24nXpDhJNZwjEwA6O8SlmT
 z8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721739461; x=1722344261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SeKatBLYJH5XyX/2Nj+nxQW9hTn0jzkDBU0xeQ71mXY=;
 b=cqs6ZT9IJsfP/dCLe3GRsNPqq7hEXWsAuqS2xJ8SgmwqtSSZEgpomUJyrhe7mLVbGI
 ub7cNhIa97HGh+SYF0dSW4ZPYtmXZ/r2Ms+fOTBvD00H0oCe9kB6RCbvonyp104orsFi
 xXCtEe+eB4ZRAH1WuN+M9QVgzpKtG66gK+loqXppfyxovMKnM+Sbxn4boEZ68TLIyWYb
 vzd40YN6bp8u1epcaTj1H7yNmvjfj2igA3PT+hhdbHevOVCMLn4BYeL2C+uJ01BJq+R3
 VJKeaxUyhwswuupaln+BmQ5KTiomj7LwSxwk0x9EFqGvSZxV+KNC2rfoSZ50hI4Tcifv
 amhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUEUz6svdOe8dMcXYRUyTLgPAjNGjZnm6yKSmRVzKRIFwkDLeGmpuVh99drNxbfIYPhGrX9XALJLrmO/zrBn7XvIbCe8MDwkgrN47ZoyYi
X-Gm-Message-State: AOJu0YxF+aOjB4/kYjAMEPuQa+ubhnlwVwLbCVnkvW59xRjtF0HKDNz+
 mWIJSQB4tJlwKSX8AqE5Jb3cXaFHjG5UduHSR1XluTYoZO1zCKeoo2Gc9htM8HM=
X-Google-Smtp-Source: AGHT+IGKnPjeRq1q8SaJtQeMhMmjaCgxwKDKeHRrSzys8nqzqExgksL9p1XuEKgZOiUCRZ+30+JqnQ==
X-Received: by 2002:a05:6000:2c5:b0:367:9881:7d5e with SMTP id
 ffacd0b85a97d-369bae3bfaamr7585209f8f.8.1721739460788; 
 Tue, 23 Jul 2024 05:57:40 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6697c3fsm173164805e9.0.2024.07.23.05.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 05:57:40 -0700 (PDT)
Message-ID: <7d34a857-6495-482b-9070-1817c88c9913@freebox.fr>
Date: Tue, 23 Jul 2024 14:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
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
 <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
 <CAA8EJpprtmefNM_CJFRbYVNxOWUVVWbedBq44r7GXOdDrQ2WjA@mail.gmail.com>
 <04ef978f-2bfd-46cc-a9f7-40a6f1c507f8@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <04ef978f-2bfd-46cc-a9f7-40a6f1c507f8@linaro.org>
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

On 23/07/2024 13:45, Konrad Dybcio wrote:

> On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
> 
>> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
>>
>>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>>>
>>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
>>>> to take a look at.
>>>
>>> Context:
>>>
>>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>
>>>
>>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
>>> on my board.
>>
>> Interestingly enough, I can also see iommu errors during WiFi startup
>> / shutdown on msm8998 / miix630. This leads me to thinking that it
>> well might be that there is a missing quirk in the iommu driver.
>>
>>> I can test a reboot loop for a few hours, to see if anything shows up.
>>
>> Yes, please.
> 
> Yeah I do trust you Marc that it actually works for you and I'm not
> gonna delay this series because of that, but please go ahead and
> reboot-loop your board
> 
> 8998/660 is """famous""" for it's iommu problems

[   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0

I get the above warning pretty reliably.
I don't think it's related to the issue(s) you mentioned.
System just keeps plodding along.

Regards

