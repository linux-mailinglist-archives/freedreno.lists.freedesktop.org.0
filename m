Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A08B39AF7
	for <lists+freedreno@lfdr.de>; Thu, 28 Aug 2025 13:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11C110E322;
	Thu, 28 Aug 2025 11:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkzNktIe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5364810E322
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 11:05:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SAE6Qq007255
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 11:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GWz4EmxyWXf7dXG5o/SW5rNMyyXGmYaGBN9NZMKjXjw=; b=dkzNktIes08QLczO
 hlxo3ShN3hIS6b4EPWNK7XpY0ycS08KtG+q8doSF83aKpqd8BIjg9xWQfREPwSgH
 MQNIkYh6KYv64gvNZgoCoJKybu/BjmFW3o+p7V0K78upoKCyHZ2Bw2f6Ak14MLdK
 HGUgeeSx5sYiI6+kuCH31IWr/5fNHnVVi4iPifl//6dCEHs2spk8IfxR3r96dODv
 jfXHjwiWOdPTWCYQT7zTp+2bCJqHQQ8Xs1ZProWWlP3TLDlGCvVlz7COfXqLDPhD
 2gtdzc08CYCrgXLmuh8p25hghTl8KsKLuHAfPfMY1dahPyKzPoDYFu7Jqxb5PZrK
 EVWzdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67g4ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 11:05:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso19861176d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 04:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756379113; x=1756983913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GWz4EmxyWXf7dXG5o/SW5rNMyyXGmYaGBN9NZMKjXjw=;
 b=Rud9JT2T9lQzZ/qEniYhHOtEUB8KD8j8avkPZOo4naqSUsoiiz8J+AQI13K+Nmce10
 yTBUnGJpvzZXmBmymf7MNvvBK+Q8r92lLNVzhfMF9MvrJNFz0AStuiRY5nUFFycjRyr5
 Y73kn/48zTx4tutFvAE+jz5pRGBk3W1C8guja6Tt8ErWI0Ulm1tyPeeEj/erYlmPatss
 R4w+1VLd87lIi3PkfLD3wJxgsZZMXz7jygY3HnktmEkuEpCgT3KSGXp0FT52tgYT9aO/
 HXgCUSqvvVp69mWViXEPVr3wb5xDJCyHReWJxqZKT+tL0mBOnkL0gCI/5SWon3xdReBc
 H+jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8HTPj7r67Rv7EXUgD5dlKzwRM8yLvKoorUtxFiZGlB1NGdR2HGgZN0o1aMMZBVqBCyilo7qTSWEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDyVFHuVRLvWb/Mc6Pga7Ht6is0GYXPlKRSDZwvkIljEKR8FPH
 RNTrxCUcJz0Uh0ndwin23MksRaoKS5nj3O11wFMb0zc2fRBi1iCG0bkIxLTxAA78xusyRQ3CvIO
 jUdAyBT3PFvkZoEIjfdutPJnVUI1C+sV8dQrUSid6EusnYfT6baSEAxO7aWSylLwBkP/KH3w=
X-Gm-Gg: ASbGncuZ0ReWyKsrptnNvqImFXlnkqjCVtLnHXeCx0eWlbFDT3hBB+WU6gRq3xgdR2L
 MoOVgYUW7oSF0jD6/UtaYbgFTUuKPUD2FtC7dTbHMAAkujsFD0RIwpM1TBFeuTXouPP1op+YCde
 GzzVx3H/o90GiDktXGUox85UHRH++2vn0vhb7ZacL1HxV4wSPFP99kWCZrXVzl6MsSRQyez15lr
 JlcDG5zgL/Wic07REWjBIPdxBkaOEtCtuE6ae2T9pCb4bRheI7ahFhw+r/K8qWwpMoj0UnACg3b
 eR4CJNqDM6SuRK1+wdJR89aOfzVsSneE2L/nYtdLx0heSPfyN2HvqjQY+MxmyShnhKw2lACblXL
 UyAddfULr6XrtTo7rKAYKD0klculjdVNxCfE7hfw8+h8=
X-Received: by 2002:a05:6214:1312:b0:70d:9291:bdd8 with SMTP id
 6a1803df08f44-70d97109866mr271525466d6.30.1756379113170; 
 Thu, 28 Aug 2025 04:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLnBHAxYeOFUCjvzXXjJoPfriPl5kZ9soekFn2bdbrOltVRygzUC2PVtjW1wYnOgDWaHGQnQ==
X-Received: by 2002:a05:6214:1312:b0:70d:9291:bdd8 with SMTP id
 6a1803df08f44-70d97109866mr271524786d6.30.1756379112368; 
 Thu, 28 Aug 2025 04:05:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5da244sm30163331fa.58.2025.08.28.04.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 04:05:10 -0700 (PDT)
Message-ID: <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 14:05:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
 <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfXyNb6kRTi+q+v
 HK9YNtnzbhtzUfhozSMFrq6nNykxg0h3UBzJCdzDk24rDVSKtTqfGRKLm/WsPqXKoV/J/sIrE6Y
 nUzh3507fIh1pk3V4lllRFyB+na0/m+Vw8A+TiKXC8Xzr52IpVQzYhnhLVKaH3IouBSJ9bIa7po
 xTlVD/PFiU3UbtMGIz+27wqJdzJeTUwYZl/iT5zqd6AQomAA9sHXIkP6xJBvVIJDK5ckmgBAI6b
 gwaxO6NbbW2YJCPxI4o8EDHiIrFycZPz+IQ0faosmkRhSH7yprvMdMG8wC44rBlQb9FLAP+RDDq
 i75dBCUudPEzwX73cZnkf1fzmxAdotmWdV6XucSAxViPJl6gz8+U/gcCslDS1KbTLranq6LxIck
 jZGyW2Jk
X-Proofpoint-GUID: hA1vgKfoWei2Hen5dvnAHOj2DaZ6F1Px
X-Proofpoint-ORIG-GUID: hA1vgKfoWei2Hen5dvnAHOj2DaZ6F1Px
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b037ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KSO3TaR41uafEWVwNF4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085
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

On 28/08/2025 07:51, Xiangxu Yin wrote:
> 
> On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>> While SM6150 currently shares the same configuration as SC7180,
>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>> and avoids potential issues if SC7180 support evolves in the future.
>> I assume, it has no MST support. Am I right?
> 
> 
>  From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.

Then please describe MST as the main difference between SM6150 and 
SC7180 (which doesn't have MST).

Also this needs to be rebased on top of the MST bindings. I've picked up 
the latest posted revision, but basing on the on-list discussion I might 
need to drop it and post another iteration.

> 
> According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources,
> 
> the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.
> 
> 
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -27,6 +27,7 @@ properties:
>>>             - qcom,sc8280xp-dp
>>>             - qcom,sc8280xp-edp
>>>             - qcom,sdm845-dp
>>> +          - qcom,sm6150-dp
>>>             - qcom,sm8350-dp
>>>             - qcom,sm8650-dp
>>>         - items:
>>>
>>> -- 
>>> 2.34.1
>>>


-- 
With best wishes
Dmitry
