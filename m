Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC17290F334
	for <lists+freedreno@lfdr.de>; Wed, 19 Jun 2024 17:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EC310ED19;
	Wed, 19 Jun 2024 15:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="gulJe7Pa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DE110ED19
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jun 2024 15:56:31 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso72716601fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jun 2024 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718812589; x=1719417389;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M1BFZzRTH7ja91K8N7mMKCSJfOC96DMaExd23EFhZN8=;
 b=gulJe7Pa0OpRN5llwLR+y/+f8U0UFN/xHvgZ+Rp4UxOLdyHi9U8H/IoCSjoc7PhKF3
 XO5AbrjxllSvQ3F45decCgeVdF55c3k9AKlJdhj7DDoIevbw+wKNFOKX3KGzvMFZF/Lr
 tmlW43rgxuhsGBcTf0xZf4NaAWkIPib8wrzQz4MFtqCdRuT6lHL73Vl+JV3jiJQzGRY+
 kSo/Aon+OiUS0/ZKtEzudL+RBQ7cxPm+DeGDttm//L5h5RuBxvtsMIAxJTX0DL5Amh/i
 xhAlN7STeaE7N2z/wwTQE1SaWPBpIC80cJjxAR3NXOtyanP4UgA4G28mzXYNcFVBL5XM
 vFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718812589; x=1719417389;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M1BFZzRTH7ja91K8N7mMKCSJfOC96DMaExd23EFhZN8=;
 b=b3puYBstNbBUckjp93w2nLKlgPiVUTHyUVVw+h17nkSAoXDC2EWR9wtIkUyqW+Ij81
 D4jY7KgiiJYenmL7NpLnHZ5oA4q9j0PIAXQigdptv2RyhNmiRL3BxBMSJgubw6Bxl9gj
 pnBvqW0JsIYL6C9feoXmk42eq0f9oH1HsEM22+a36oPlEjTq32ZdM6uFov3CY3Tx+qIj
 Scbmhv/1LUcgPxUTmyfXwG+4BGTAVInB1pRBRYzc60kmGcoFsX56oTPs1xh+NQ6QO/C2
 YoqerYH4P7w8kHK2gDZcZMYXZtKCCFlk7U5ZA2yKEjmD6vagFEJAjObXXGnbrtjLTz1s
 9ClQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX5sO0GPEZrPaGLyw3uUWl6eiT8RNv25Bs0s1OtOJ5mKBnw3PZ5LnwGZz+JeGA/6DdEaPpA+a7BD1029HxiayWw7MnobpGXM+wi0LUVU3M
X-Gm-Message-State: AOJu0YxLeJOMKL1N7bUFRfG8gsDm7wZDMAb2VH8OGPIpY0i871wy3bVD
 LZdwynyUb0+dkPPzZ/HR/Xu8SOoHZJx39fyFvheWffWs4IMU6Z2peCfcSX08X5k=
X-Google-Smtp-Source: AGHT+IHaA9hcJJZxhODlzWXhLljZW7b77T7umunIdwrTJtOLoyjhilkaA+PUmNL+9uZYE92Nn6e8VQ==
X-Received: by 2002:a2e:2416:0:b0:2ec:fa4:e310 with SMTP id
 38308e7fff4ca-2ec3cfd6deemr18677031fa.34.1718812589347; 
 Wed, 19 Jun 2024 08:56:29 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:dbf8:4c1e:1db7:2077?
 ([2a01:e34:ec24:52e0:dbf8:4c1e:1db7:2077])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e9145sm271027215e9.22.2024.06.19.08.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 08:56:29 -0700 (PDT)
Message-ID: <fcc585d5-637c-4736-a7ba-5f4eaad13ae6@freebox.fr>
Date: Wed, 19 Jun 2024 17:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr>
 <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
 <348e16f1-0a1b-4cad-a3f0-3f7979a99a02@linaro.org>
 <pprbxhow6gl6bqlhzoiozz7ymwqk5uwuyuwclviulie4ucyjok@xv34zrzw72oz>
 <b6676951-33a2-4c3a-bb29-0d1ea7ad33d2@linaro.org>
 <c18c3acc-8f08-1384-0d99-509ffd663879@quicinc.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <c18c3acc-8f08-1384-0d99-509ffd663879@quicinc.com>
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

On 17/06/2024 19:14, Jeffrey Hugo wrote:
> On 6/15/2024 5:35 AM, Konrad Dybcio wrote:
>> On 14.06.2024 12:33 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jun 14, 2024 at 01:55:46AM GMT, Konrad Dybcio wrote:
>>>>
>>>>
>>
>> [...]
>>
>>>> GCC_HDMI_CLKREF_CLK is a child of xo, so you can drop the latter.
>>>> It would also be worth confirming whether it's really powering the
>>>> PHY and not the TX.. You can test that by trying to only power on the
>>>> phy (e.g. call the phy_power_on or whatever APIs) with and without the
>>>> clock
>>>
>>> I'd prefer to keep it. I think the original DT used one of LN_BB clocks
>>> here, so it might be that the HDMI uses CXO2 / LN_BB instead of the main
>>> CXO.
>>>
>>> If somebody can check, which clock is actually used for the HDMI, it
>>> would be really great.
>>
>> +CC jhugo - could you please take a look?
>>
>> Konrad
> 
> Documentation is not great but it looks like CXO from what little I can 
> find.

If I read correctly, the conclusion of this sub-thread is
that the clock tree described in the patch is correct?

HDMI controller:

+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MNOC_AHB_CLK>,
+					 <&mmcc MISC_AHB_CLK>;
+				clock-names =
+					"mdp_core",
+					"iface",
+					"core",
+					"alt_iface",
+					"extp",
+					"bus",
+					"mnoc",
+					"iface_mmss";


PHY:

+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref",
+					      "xo";


Regards
