Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D08A8812C
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 15:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D42810E5AA;
	Mon, 14 Apr 2025 13:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcSosi47";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5AE10E5A8
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 13:07:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E9AcCN031859
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2lDMoGbLTkfpV9XPmY4UE7cjKyAc0EvO1VXR+z/uwKo=; b=VcSosi47HmKEE9fd
 TAKwP7IleGAq85XwKdpf7SEqMk3nFF3HRFKNZYb0zOx7D7scBTCM4+O0Gqu7CPs6
 LVgDK/quX6mxxfrOOhzc+MUxlx/HtZtGwCrsHfdKA+7xNZOtaWk9LIqtl628skQL
 jzFxNYtKCoNlV8MFHYaXknULyKRfE6CQKUhynqsdTdVkv28y+EIbJOcCibXbEoB9
 lBWQUOMAeMmBXyruLjYrGg6fEM5qIF1M7uFopExABEcUi0qkC6QHnWxICluET0y4
 lOeDTJin7+Y0WNdcS64OE2Wt/XRiLzbrNPNbmmVPrv8mJNq6Cdoy3l3GWY7AWrnD
 aBgxCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj4tb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 13:07:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5841ae28eso100349885a.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 06:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744636053; x=1745240853;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2lDMoGbLTkfpV9XPmY4UE7cjKyAc0EvO1VXR+z/uwKo=;
 b=m9fV1NFvJYZKDUKYPqK1QiMhVmvGAoeEGlbCzNWVbzGS0EHp5pPLp6Ak8/ybRsyuSs
 yNi6fjGOqbmOfvU3pP/XCOXYqC3Iu90Jcyt7cCS3XUUfSN6Z22kuSmp+V+XDCLJbvILh
 sXmNeSu3TI89w2ID3ecDuiB80Tczqe8xvnDBQraozcQb2/GUpoTgyDkEBkMjfVXpTUbp
 tOt0hldYc7sv+gRxuFBFgdHFCB5SMScBVBKkJE1qs2uOb8F55T9BxmHr/DUddgVu6Lzw
 TK34NRMPZTytd3xn9/PnGJghtuxCRSj0Rp0CIhHjyt+c0E/v56Tok7MIOGCPoeishIlu
 oo6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwmKifT718F2xi6AeLW8W9pPnBp/U2RFXZmdFdZ611r0euG+8V2ZaGfPUAws7RLxWXNNtspfMXkAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8j75WOuLHGvBm2JIa1FbvmQebxm2Sc2lO55MEvo3X0lYQ41KP
 q6FusTgOX36yUriSiigTPIXH6hts6WoVIoUJvtHW2Y6j4JETINl7TzMfNf3I4SMV2ylYn7cY950
 6zH4ZeMjNpRbHcyZje/RpQWMEOg71b7jxt6XNVBC9pVukyTNrwqzBe0SkLRwStCh3dzQ=
X-Gm-Gg: ASbGncvYVOFVDrRp4JSqHR7BaMqrAIAeSicj+n1uvrN30K+oNbvXW3Nqf4F+KDWdCBL
 qZ7wVwzoXMTyd/VpgI80CBoTyjETZmDLRl6POxLo2KHOY6BBxThXIpb1nklC2QbtjuxERc8PV8r
 NFX4NZZKMebIRcoHCWjEe0WStKnkvNqAlVP/NaHmIkEuCnU0E2YIFQCcwLUcOlb+zwyP3K6DRxh
 OoGG0vM+yl9CWI+NwDEOtlsFvn3kbSb4hcWYX6bLJUnG4w9BV3mi2MI5S/JSs3p1D4AInIjc4vc
 Q/rIQr8uvbCLTzixt98cxuhNtGTEXOpXuh37e1K/sNFPgJhKpyKsLzObcLcs3PEpMQ==
X-Received: by 2002:a05:620a:c55:b0:7c3:d752:f256 with SMTP id
 af79cd13be357-7c7b19a73d9mr526923885a.7.1744636052474; 
 Mon, 14 Apr 2025 06:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkjyPRb5zjVxNYkQFuXETFI2mifPtUz3VVZ8CZhW5cBCjg9CtZG+TWolnSrPbDxliiMbxdEQ==
X-Received: by 2002:a05:620a:c55:b0:7c3:d752:f256 with SMTP id
 af79cd13be357-7c7b19a73d9mr526922685a.7.1744636051876; 
 Mon, 14 Apr 2025 06:07:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f459a32596sm302607a12.65.2025.04.14.06.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 06:07:31 -0700 (PDT)
Message-ID: <5b7bd3a6-532d-416c-aa64-8523c54d87b6@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
 <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
 <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fd0896 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ivjB2eyK2o-HjyQSxY8A:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jenBjT6CNr4cPfrVKQM7XLTe_zBiXa6F
X-Proofpoint-ORIG-GUID: jenBjT6CNr4cPfrVKQM7XLTe_zBiXa6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=737
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140096
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

On 4/14/25 2:14 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 01:39:56PM +0200, Konrad Dybcio wrote:
>> On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
>>>> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
>>>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>>>>> controller. Link DP to the QMP Combo PHY.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			mdss_mdp: display-controller@ae01000 {
>>>>> +				compatible = "qcom,sar2130p-dpu";
>>>>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>>>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>>>>
>>>> size = 0x3000
>>>
>>> Existing platforms (including SM8650) use 0x2008 here. Would you like to
>>> change all the platforms and why?
>>
>> The last register is base+0x2004 but the region is 0x3000-sized on 2130
> 
> As I wrote, this still applies to other existing platforms. I think up
> to now we were using a mixture of 'last actual register' and 'documented
> space size' with VBIF using the former one. Should we switch all
> platforms to use the latter one for this region? In such a case I'll
> update this one and all other platforms. Otherwise I'd prefer uniformity
> and still use 0x2008 here like other platforms do.

Let's stick to allocated region sizes (i.e. 0x3000 here)

Konrad
