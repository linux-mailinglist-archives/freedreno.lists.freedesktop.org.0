Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D72BC4F9F
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 14:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBD310E397;
	Wed,  8 Oct 2025 12:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYpw7sr5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367710E397
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 12:50:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890U3g026718
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=; b=FYpw7sr5rxcDfAem
 UzAZ/lwkxo2ODXO5AvoIyUUBbP5OAwJFOM1WVVHFO6hIXDd2cJaZp2Z7x+hbOXTF
 aBF+Cj6OWwrP+fC73ZljkOYMxTwmzXa1nxTonQK4N4nxl8IQ+U6kuJOISiPAAhCP
 sVYY2rheAg30xW39mxiHfR/b+SZBLU2pEX1Ji/pnVXKL8RpAbzFcQzb+De4U4AL7
 As3sKNXCezKByJ8MaovHjo8mRCRMqDK8aRnyI77oo9t85gwrJnjimzpanMf3K+wK
 NO+dPXdbUahdeXC4ngpTg5OUpWD+OuruBY5X/xSXSGcTx0587E0ioz0hUb7UEwCP
 gZ70kQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hj9x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 12:50:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e231785cc3so30504161cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759927852; x=1760532652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HjXA54200/MazhziXIpKEeI9K5n9Bf0pQfwu9EvIxC4=;
 b=CTfvk53NkMTcBrgmaBZQKNvjqv5FKvzzOCjxbFeAWdFA9648xD8D35zhxFZbmPjdGg
 DCNjttQwVf93er7ucudEugKcXcjodhOc/iRYzGMRmWP27cUYd1lTG+Is6U2VVN4oSYdd
 Ug3XpTkvUYuEAF0+tdY4PTHA12ZYSeb0Xz05XMWD6KWTHaF4M/Mj6Oa5DhAaN/WX7ySN
 bRz949PELhSeQvAb9awwVJfyESgn6SW/M1N0sPo1SamCDvsFbGPh7ubb8upjl7j4Adlq
 5KzSeFQJFhcNMjnNtAa2Rwe5fYbNB7ZyV2KW3+8CMQNetQIfuTSwAKFoefASW0x4mjMJ
 Qr8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo1WlldxVBBhDkC7La00gN/Wkx3wCDxdF4dSiL4QB8eGPdiCNF6GckWD8X4NnUfdYnctkXFMSzDe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW7wVSlpGgf/V1FesuibRpl6x5o16dbCdSfduTi2CCA8Mx3LrN
 x3Nf+af1uF6Bv17S5XvxE2/ZHAWUzhHO/9TYco9QQHhccScaachv+gSZHVybw7CbiqddXxc+wRn
 HqwNl29+DrPXEYpHpq61tzePHFmKaOsnE0t5EF8CvX8pES7lCaoYyf3Z90BKsuP8z8HZbJBA=
X-Gm-Gg: ASbGncvPpvl4d+070POAAjYyyKWT+4qI8G2u5shxmNuYumaJMzXg9LV2+gwesdcSHkZ
 8qSMPDdJTqiI2DYUhS2uGSSQ5pRrMr6qdp8ezBMArchA7SJ1u2uzNQJBnKWKm3b/FkpM5FBmzJU
 EE0DTAnBt+vYHgOuG05BEZlNK+FFoc39UauTvOYvR9JGvFQzzszl8HlV+nkH2zjlxQ7sjXgw602
 8cUU/ACB0nBojHKQMm3VgpklH53Dk8oS6VKxb+G55ng5A2Dala2I/s939BJaEICry2vPmW5HyIQ
 hkSNZQuz5U8nzcotGujQtRTeNB6aInHhZrRGgOckAJ3d6tEne/aZeGEGHP5Lz5Qi1U8edsTpx5Y
 ZQfvJWeu/lqDIJJTtjqDr0XYZxhc=
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id
 d75a77b69052e-4e6ead0aba7mr29848921cf.6.1759927851748; 
 Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd3wvG1Ynm7djM218qT3jkj11ov7+KlyDnSw0DDL6cJyrMjJ5qDwiZKjNKdh5U87l7RnzuDg==
X-Received: by 2002:a05:622a:60c:b0:4d9:ac87:1bdc with SMTP id
 d75a77b69052e-4e6ead0aba7mr29848301cf.6.1759927851051; 
 Wed, 08 Oct 2025 05:50:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869b4e49esm1648890166b.72.2025.10.08.05.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:50:50 -0700 (PDT)
Message-ID: <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfXwIvBp0cv/Q24
 sL/hTzYGZO44UuxnLsuVzD8cL9LLJs6fL5Il2L3sC84kPbrsWSdtubFuapE4OHnJ7t1b5fcWXOa
 keC1PGzdEjAXv/jAEA/8Z8ym88F0L+bPU3p1SSdXPOS1ApSoFULNVT9f7ZKdzJSBwiwZSZS1SD8
 KJE+ovh1mo3sakv9LUo1PCFtSqW1zTmz8v8rxNjAgjFWgkGYWXeWJMQaxtQ9TKHCKMd09302mke
 pPzDs5ZIp+QEfjW0E8SOjm9ZVD5baixi3v/XjwJ+c/Hfh4m5VjRjHvUuhj8fH/svxPjEK3VZacP
 eTN3lNkXdAEx16xtl2e0lCfoErGvfoYEd6jDYgxwpKBn5c8V2HVnXhyKwoHnYs9cGEcuHfAqpcg
 4S68v0IZbZCgJNK0cuWLjoRp4nYcyQ==
X-Proofpoint-ORIG-GUID: EjfwdaAT9LXgBmoqilIBBUuDRoMf1Tq8
X-Proofpoint-GUID: EjfwdaAT9LXgBmoqilIBBUuDRoMf1Tq8
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e65e2d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=Nc9AMxU9nlP_Mo_kQ7EA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146
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

On 10/8/25 2:49 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
>> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
>>> with their corresponding PHYs.
>>>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp0: displayport-controller@22154000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x22154000 0x0 0x104>,
>>
>> sz = 0x200
> 
> Hmm, why? I think the memory map specifies these sizes.

Yeah and I went in line with the allocated region size (not last register)

[...]

>>>  		dispcc1: clock-controller@22100000 {
>>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>>>  				 <&rpmhcc RPMH_CXO_CLK>,
>>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>>>  				 <&sleep_clk>,
>>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
>>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>>>  				 <0>, <0>, <0>, <0>,
>>
>> You need to remove the same amount of zeroes that you added
> 
> Nice catch. Which means that somebody was sending untested patches.

It would work.. until someone tried to add DSI to the second row of zeroes
instead of the first one

Konrad> Nice.
> 
