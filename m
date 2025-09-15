Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE689B575AB
	for <lists+freedreno@lfdr.de>; Mon, 15 Sep 2025 12:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A678B10E3CB;
	Mon, 15 Sep 2025 10:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRi20XHi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECA910E3CB
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:10:12 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9Q0xm021634
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oJqDS6EtytX/4EwWe7RLhEzC5GGSyQ3r5FauvRmpSDM=; b=bRi20XHiacZCWbyD
 nnFhvTKCYKBcrF6pLVVEY/ILkKCb2u5bF6NaJll6ONizwWc5ANhK62NewCl44joo
 eajx0d9CD72YWNjWaTDFmScq8uDJY1Jps2ZCSkg87U0JNvta5DeJ4lPF+jnzPGVz
 KT2BtL2oLJJBlt7WyE7V0veIBLTpwQV2VRY3vsh6ZgU8PlaP5V2RTtmkTUOYpejL
 Jt5oYmVCftVRI1ConQJrqSposZdQ9caCDCpeguEuH5KeJg8B70aKv/y/5YsidhBH
 F1YN2ptpqvXsFzhMscvyrGoluMF7MRokDvrGpbfXl7YzixcZJajCETPRe6zwKB2T
 AgDvMA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n04uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:10:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7773f219a58so13178b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 03:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757931004; x=1758535804;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oJqDS6EtytX/4EwWe7RLhEzC5GGSyQ3r5FauvRmpSDM=;
 b=axOY1zKopGRbjOtVi+LLOrPT7Y5oQPcZ0XTwDycLhoFIwjDgmW5O2ANaiVg4L66MRK
 e5OmJIRVaoReU2294Fa8+Tyz4sXDPTJXe88tlwDBL7WXRWbkqWNK1HhQlNcEQe4CwhNa
 MloRLv+FmJG0DGxP3Cyw119d48hYKX47E1SpKPR8l2/dT71GX4tZTPJgLywL81wwk4BC
 Z36bsDiIOKpPAVr1T1Xw4ELSdtmhk8ofdVTHmI2xFezx1mGemlXBm+CnHYFugTM4izR/
 4jLT5yDahkZAnWcVTs+Yx9R2yFxt+h+iJvTpIiIIqt0/S/Db3pv1BWUbktUqOlOZ975B
 uX4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1J7pppUZ3/e8jiXwyHLOdoy16H5p/Jwcn8tPJUF7n9ohADIFGs+2IOkQn9dCWJChkIlVlifgYygA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoRt139dq6icuojm7ua1ZIjCvhVJxs+W6gHg33CYRpU8kQ6eKt
 QT964mjSJegB9c6Oauf2bvIKuHYXG97rL2qeHbXlHbjEggVIY1z9HE9r2Mo8aJGPIESU3cCqPcN
 1WQwrSVt/t6kByP9V2e0YynRPMZeXkzkfQZodrUXIX4gJc2zRyAriZzyEB1GefzS1yuK0a9A=
X-Gm-Gg: ASbGncsIYtCyTnN/yC0eJfuijp/l67NfR176193Xmzsixgmq9Rl1nCT2aJB/yLCcf00
 5zNVrvuAIN7+A1ouix9kx3H2SnlQ/Lz0gJvvPf6MonVA5Ybf4LKsvTUR7EOuOYfHuhz3VaqXAiH
 +8o8J3zir1CH24BjmaYDPIzXqsV02r2f0QsAE9Xw017CWtrV6RC4JyXjmoSsd+WSCErxL9+WrEU
 xLxR8W5LZaNTLCNZUuFwM4IchNT2SiM9J1hFKvml6RI6rO8247H4mseccSg8cDk8sxc0OErzlpT
 bNXFldx2pM49vgPfCEIVR4L/hJjJSOARQyak3RYLNbLOQf3JoztSo1L6tE5gNVv2qmu+3mr4Zzf
 z3ePJ72IwI3RHW2tUv55BKJuVfNWp0WX9QiM=
X-Received: by 2002:a05:6a00:7608:b0:776:165d:e0df with SMTP id
 d2e1a72fcca58-776165de1e8mr5272820b3a.0.1757931003877; 
 Mon, 15 Sep 2025 03:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+aEaZbmtt8mkehB/0dhBi1/0r9uuMfBdz44WzDP2mKLR/7wRH7bmQR6ne33XUYpBhPwb1w==
X-Received: by 2002:a05:6a00:7608:b0:776:165d:e0df with SMTP id
 d2e1a72fcca58-776165de1e8mr5272797b3a.0.1757931003421; 
 Mon, 15 Sep 2025 03:10:03 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7760793b5fasm13129962b3a.16.2025.09.15.03.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 03:10:03 -0700 (PDT)
Message-ID: <4dd37b1f-2175-4759-a250-fee4ed2bd39c@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:09:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
 <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
 <v3vuphn3n4w6ynpaqeosechjdcelomn53atwfotka7izqvjuid@nnvdwxqlelrp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <v3vuphn3n4w6ynpaqeosechjdcelomn53atwfotka7izqvjuid@nnvdwxqlelrp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SUtE87poVEQyktJCBkZ9CvtYH4-D08Ht
X-Proofpoint-ORIG-GUID: SUtE87poVEQyktJCBkZ9CvtYH4-D08Ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX+hKsTWCRBAbr
 4+pY9+dG63ybyOVwkQE7F1GGXL3+mZ2Owt5KClnXqJJTa0F6iX2/GfXfoUA/V3Arz+Ezc8ektU+
 Zt5NanMVBv+zH9OxylLePPnaVaWFYzSAON6kkAT9K2qPtpfh9Z8XDnjZ7RJ5ds9/XOgTiv6bdv7
 +f/gbcmWtXNe2EImOx1nsMv0IqziEFqFMGS3qynIIUZHOSMgGgNiOqIbJJwyNRQsgGngVrsS7iY
 XLUIHefXMoRKFrxi6IOmxDP9BKS9a7WyNqJsTz/Ma1KHcGPV4UAXyAkly3jncWFQgj4j/EOj+5U
 JwaMma4x0sbPJqAq15qhGsAdhK587XqnXJtVdaVBt8RFR1lb1oBqKUMqyBIIitmad1Uf7+FTFli
 00TxfHBV
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c7e603 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=3s9BUBv2AkJYRnd1iEsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087
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


On 9/15/2025 6:03 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 02:26:12PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
>>>> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>>>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>>>>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>>>>>> potential issues if SM8350 support evolves in the future.
>>>>> The controller is exactly the same as the one present on SM8150. HBR3 is
>>>>> a property of the PHY.
>>>> Ok, will update commit msg.
>>> Please red my response again. What does it says to you wrt bindings?
>>>
>> Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
>> previously familiar with how fallback compatibility is defined in the
>> bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
>> fine to drop the driver patch ([2/2])?
> Yes
>
>> Here’s the updated commit message for [1/2], does it match your expectation?
>> 'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
>> compatible to sm8350-dp for consistency with existing bindings and to ensure
>> correct matching and future clarity.'
> I'd prefer if we have "qcom,sm6150-dp", "qcom-sm8150-dp",
> "qcom-sm8350-dp".


Ok. will update next patch.
'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp' ...
fallback compatible to 'qcom-sm8350-dp' ...


