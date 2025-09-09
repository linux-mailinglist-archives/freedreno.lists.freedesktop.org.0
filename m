Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364DB4A5E1
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 10:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0924B10E662;
	Tue,  9 Sep 2025 08:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8Sd18PT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4423710E66D
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 08:48:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896Sjcs023508
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 08:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KZymnpnmhs5B0YBDAMI52uZ/Inhmlk88lRXrLORVF+c=; b=L8Sd18PT9GCr920+
 ktTKgAKJQX5h6vBy+sqlOJNBCDze1sMH2MMPgRohQ+PbHRjhYHQiqI6WaKX1OVg5
 ov98vj2OxCFx9qeAMpFZfXr1I/lb3XqswZevZFG5/Oyf2lETMkP4lrisRPrywnz9
 N65bYaQFOkA+c7/KwB6NkHXt9iVDIjGaitmTLQw8qbwT3mfvxTuLQTHsaS3HWgOm
 HXmiSz7ZH2Gxef3Npo13I7+Bsr/FyZSBm89kUM+W6kQ+TCnJCP3yWRE/fHb0GN+B
 XayvryN7ECaB19spRXGKWF4NbYALDOED+W1rC4iFhOtxI58kyOy8bmLyxtNhqU0X
 Y2iP8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8fkhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 08:48:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24cc57791caso14319265ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 01:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757407680; x=1758012480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KZymnpnmhs5B0YBDAMI52uZ/Inhmlk88lRXrLORVF+c=;
 b=F1BHOFPup8qMNx7YTW+ADXASO0c489+O04clJJBiAhKyonKNIW7CyIyHrJb/JQjBEp
 xTQ2Zii35QOwO3yYvMLBxCZwgvkgOrXgi0VCINyWcwVDuyFIWjG79X8uuBV/zqIMNPMV
 11/JGiKRB4uFYYGuOf25r3jsnoavl844EdTWEGgt8YFECcCdegNL7p3+xiVnT/GMzl2Z
 IrWIkRWxeMVOdAgNVWcgLsruE/cYmsH07tnlEtWgjKO3YQHtjLSGS2RppT4z7nwgleY3
 WU3gtLmqhuvQXQXqFYF/9Y28S8yLQ6dAcn6Xr3NW/1VoNFqlqzgCstYUn/4rTNz0+zHU
 yA0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr5HyjUWz4hJJa/6a3SoXfq5d/RXGg5BYuAU09wCFAtQvLvaIWlt91w6XK7XNf5eRct8OzvPzAL/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy18a+zDvaNlUCfsTIxfn7k5EvZ6RHdHYx/6PymX+bR3pUMOiMf
 JBmHZ1jUqh6FB+3sRhI3BwQbWndYsN1tIY6/mUGtbAomKeGRiOao42IslY4p5L6OkUVRcU/iF15
 aM4Oiz59OaGPM5cZIEJZtxUXfUR4xW/5jGep0k1TApxohusCzPFkplR6tzSOhMgm2V/U8jDg=
X-Gm-Gg: ASbGncvyRDoV4wFMv8w53xQuOLexSt90LI4ISjUxZPUuCdd8LxnQFx3qzNWeKAw5eOE
 thcclyIAIMwgcb+vOioXCQ2vETzCCg9TXlKzUI0te/MB7mPY8X5mAYnT67h9f4U4GO20X6SQ18x
 DjFtQEV9MPxIvZzIYirpL4OZf2sPvmF8ux55eBLflmDxcaoIbWJ1fmXFUgtR9MLa7SIWAjs5NS6
 h901T5ZCMJ2/ZW+Fz8Ltz0Qtio6/cWtWa41Qalv2oQLql7DHvXAzBWUs5ZquFGBcZcPHdd+7/sE
 IyfJO0+qv6qEF5tFHAfNBarDkyEdthYoS6NnagIvzNNKNS1Kn9o8Dxbpb2b0G8edE3tdxqEakwg
 4XzVpaJ/o5Q1Bn8EjqujpZlVkuE+nhA==
X-Received: by 2002:a17:902:db04:b0:24c:b39f:bac2 with SMTP id
 d9443c01a7336-2516ec71a55mr86020325ad.1.1757407680133; 
 Tue, 09 Sep 2025 01:48:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGcPEO4ewq8vPdRBMjUnVoQbZofkFK2H8oWkKbHPow7Vq7zP3XFvEVLEjwbhoyUbsAwksJ8g==
X-Received: by 2002:a17:902:db04:b0:24c:b39f:bac2 with SMTP id
 d9443c01a7336-2516ec71a55mr86020095ad.1.1757407679630; 
 Tue, 09 Sep 2025 01:47:59 -0700 (PDT)
Received: from [10.133.33.137] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24af8ab7e7bsm206214375ad.138.2025.09.09.01.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 01:47:59 -0700 (PDT)
Message-ID: <48a76d34-b748-43e6-8a2c-bebc8095478d@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 16:47:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
 <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
 <3zi57uvggw3zgrj4bfouzjnf56yywjnw46f5ru7krihyrw5bkc@c3xf73ianksa>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3zi57uvggw3zgrj4bfouzjnf56yywjnw46f5ru7krihyrw5bkc@c3xf73ianksa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXwmcinvk01pqX
 Rtzm5K5BJda5WZStoRgQx8xeg7zj38+Bjkba5EjY9x0tAdKQkHjoFoC3SQByzxN23SWUR6eH2BV
 A1/O1nBhqa1bFTHArs8Yn7a604pBqEFK+7joBTTfk+mJ1ODOXl93cYuPQz/HHniFVK3YpmYaCib
 5tgvS9jXQEjYY3b27nKGwH1dSjrKT570EOZqLgrkdzIBO5kQysxxyXTb3Rw6XMPNJzU7RZlsOud
 /DF1gT1dOqcP/D53Hcgr9AdO/xvuDXZx4cvfKtoqoX8R+xMdj57/JIKNERqpcTTGI7P/8kRz/WD
 GZSa+nQDVEcVZlQIcUiwQz0HmZWsM7xL6BGpn+DyD+v3QgzJfCjVuFRNR+M1AI4L1f1vfMNNgfJ
 cHneYLU8
X-Proofpoint-ORIG-GUID: sqKr097zQ2E4PMAWuZ-tMGVtZU7CXflq
X-Proofpoint-GUID: sqKr097zQ2E4PMAWuZ-tMGVtZU7CXflq
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bfe9c1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0xAmN0HNA53ciqJMUUUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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


On 9/9/2025 4:45 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 04:39:26PM +0800, Xiangxu Yin wrote:
>> On 9/4/2025 8:34 AM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>> While SM6150 currently shares the same configuration as SC7180,
>>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>>> and avoids potential issues if SC7180 support evolves in the future.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -27,6 +27,7 @@ properties:
>>>>            - qcom,sc8280xp-dp
>>>>            - qcom,sc8280xp-edp
>>>>            - qcom,sdm845-dp
>>>> +          - qcom,sm6150-dp
>>> The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
>>> into msm-next-lumag. Please rebase your patchset on top of it and
>>> resend. At this point I'm interested in DP bindings and DP driver
>>> patches, the PHY part can come up separately.
>>>
>>> As for the compatibilities, I think DP on SM6150 should be compatible
>>> with either DP on SDM845 or DP on SM8350. Please choose one which suits
>>> better.
>>
>> Sure, I’ll split out the DP binding and controller compatible parts into a 
>> separate patch series.
>>
>> SDM845 seems not support wide_bus, while SM8350 looks closer to SM6150.
>> But I noticed SM8350 is still configured as SC7180 under dp_display in
>> msm-next-lumag’s top, so this change will mainly about the binding, right?
> Yes, it's only about the bindings for now. The driver support for DP MST
> is still WIP.


Ok, understood. 

Will update next patch.


>>
>>>>            - qcom,sm8350-dp
>>>>            - qcom,sm8650-dp
>>>>        - items:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
