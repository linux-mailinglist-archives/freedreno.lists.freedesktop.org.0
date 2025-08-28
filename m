Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BED5B392BC
	for <lists+freedreno@lfdr.de>; Thu, 28 Aug 2025 06:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F020B10E193;
	Thu, 28 Aug 2025 04:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4bGtHj/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D07510E93A
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 04:51:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGhE76014774
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 04:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jx+gQH4DjWBB2/iazSCQmloXHWcepkEB1b0fEXviJpw=; b=k4bGtHj/gKo8gjmQ
 A9eJvxG33infZlCbybUvdrkUHfTeucuGnhBKjiQxy7fRgFtO9KCY7utD1yQ+JdQ2
 a0Qi0JIaofhGapQPGrmZfhuRFSKuIh3cJKwOLgqpYhQaHU9VUpvmDaIkIMTLyVdW
 9RD28ON52PiubJqyM+RayTbLb9sbEdjHsBQspPQ0dTA18tI9tS2C6j4TV/LY9h/6
 heFCPQTDy6mWNg+udOCIy9Ft/5X/MIECfp3m64Eh6NOVStMiK5AYBLGuusENe/2p
 kQA7JXDo2AWC8YWA0x8nNKMUnqRVGShTJhyNHZ+MKYUDYnDvdP8tPmwpnorpubZc
 gwzNNw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we6naq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 04:51:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32502839f9bso134241a91.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Aug 2025 21:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756356674; x=1756961474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Jx+gQH4DjWBB2/iazSCQmloXHWcepkEB1b0fEXviJpw=;
 b=SirRWtj7zhUKedhN8FS8aeR0EktdKoeN1iqOzJzpHrednDI5zk22CpevjFMpeOgLNr
 emEyLIvzuJyeoxY+NTMZcouxcYB7R1fzlr20MugqKDs2V2Zz5FZg/tOVbl8K9LbdD/XW
 qVyt+uhaPxbO4nW462MqmV46bW7Wig7i0KWIpbyK6GNnQ+QcbHpw1Eg3Wrppn2MWr1p9
 Ynk927YOH75YjmeeWIj81y1ssb2jBgQDvFZzPtf8N+KJ1TJplThFYOuQ69hO8n2jYdtv
 zDJBwDF0PhDK7czdpDFIPQkSajd2A6JtDQNUvxzBYohn87+IpkgEXlY2v9EOlycxjhhA
 FZlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Wl82i00z4TWUPciiHWayCMfWKZabeJJi9yB53P09M8BqT0DW4rQ7ZYMzulUQib9vRZ178dG+I/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6e3TkGM00Rq+7X3MAYbgplof10n45bRrmBUEDZNEVlf3AexLZ
 T9FN93/0UCpRWpxWKtC2o/w0Tn4A/nH1bgnlRrB1ZCeZr3+9+cta4xQ3f1g09vxj/njk60GEfee
 lsBECrtrX80ib1Tdko8GdzHAGm9QWTENs4r6CghZXnDyfKe9dFEkdX0TgRkb941NpKKw6MNA=
X-Gm-Gg: ASbGncuyQRQgTeEblbTYJJX3tPDGZjB5tyMvvFHwOnGjrJFubZcbaevxt1Kpw9mYqX5
 SuK0KlDyHtnF+NBxNwbuJwYaZu9WX1yWbrq7i09n4XadREekWanHT3JI4XoowJfx3UR2azs3A50
 VmJokpa08CcBavIXuPcKkYsWMnoBLbwo/2Me6KBLfqJ0+lj/x/TkwBBMx+RwZvI3tMedQh2BMj5
 KiAOiHfb6YrO2WljBEetBVQMLr59MeSx1N+xDDW6PZVNjlo8RAg0dsaguK8wqO7GUuc1QFc14uI
 hwqU0ISWnsh0YBVDmD+hKXGtC5dc/eMvy4j536eHQFSDOwzTXEPqQaMu/G6ALVhUpfjAeXlrBNa
 Hc22oFmZ45ZrKeBd2ZSNkcbxc2s6sqA==
X-Received: by 2002:a17:902:e5c7:b0:248:dfe0:2bac with SMTP id
 d9443c01a7336-248dfe02faamr4014085ad.8.1756356674508; 
 Wed, 27 Aug 2025 21:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmRbZMzQhw30/ipLkmYDVQtFMWzPa3KvkwGn6LZpn9/xGeveJfUognFXSqr0kP7nvEeevGgA==
X-Received: by 2002:a17:902:e5c7:b0:248:dfe0:2bac with SMTP id
 d9443c01a7336-248dfe02faamr4013685ad.8.1756356673983; 
 Wed, 27 Aug 2025 21:51:13 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248e3e0b73csm2558005ad.132.2025.08.27.21.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 21:51:13 -0700 (PDT)
Message-ID: <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 12:51:03 +0800
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
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Hh7com-R6SzNliCPA_NGOkdaeyD8XmnD
X-Proofpoint-ORIG-GUID: Hh7com-R6SzNliCPA_NGOkdaeyD8XmnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX49LF+xg1zAHn
 RP1gDYX9tINX/fvAM3HCNoNjBEuTblwT4Lmsbr+SVuHyo4PSBS4ej2I7c3OetAIhiakrfRgarC/
 +mS/e7t8QzkYWpBIgv8tbQ1wDjj9VbveAQ4nPN1Gcc1ueRXNa3sWMq4pkXcWNYGCRQ524Cn8zuD
 hU1X0JYv4RtcmJ3kkENCNzuNbhs2mUIScsFR8NNjGOOcEt36XzhCj3tBv/afU/JHNPV7BhnWkIv
 JZOG+Eqxy65Zml8Xrk4oT+BtqWJwCMV6b6sIP/cGdFft1Uro3WM4GfowMSbgYyS8+vCE78JVaCs
 2w26MYCRf/KaD4MElsxo7ai32KNz+3pB/w+Aq54pUoHXFSrXNbC9Mu/hAQuJcAs+pBKJUtaAvFi
 +Jmi2jRd
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68afe043 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RRKZIDRkA7xEvhLoEfwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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


On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> While SM6150 currently shares the same configuration as SC7180,
>> its hardware capabilities differ. Explicitly listing it ensures clarity
>> and avoids potential issues if SC7180 support evolves in the future.
> I assume, it has no MST support. Am I right?


From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.

According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources, 

the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -27,6 +27,7 @@ properties:
>>            - qcom,sc8280xp-dp
>>            - qcom,sc8280xp-edp
>>            - qcom,sdm845-dp
>> +          - qcom,sm6150-dp
>>            - qcom,sm8350-dp
>>            - qcom,sm8650-dp
>>        - items:
>>
>> -- 
>> 2.34.1
>>
