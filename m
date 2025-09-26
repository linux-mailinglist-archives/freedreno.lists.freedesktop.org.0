Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F0BA318E
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 11:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81210EA08;
	Fri, 26 Sep 2025 09:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNgeqdL3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002CE10E309
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 09:17:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vZW4015994
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 09:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wm50d4xWWfh0HW+Cx0UYIE/gdY+1+ZE80v14qcFJHbs=; b=iNgeqdL33AfJQY6m
 HpHam5rvSwaARcJA7ySFTVKvMYWlanoK9djxVoIKbMRS6YBp8BfEXygnGooY1q8d
 JdpXhjzIOToLc24yg6gk4nLtERVgvbh5F7SXeU4pvQunUseVMbwOznWtEQdWgiAp
 YHsXmsLdiXNrd5F4vcNE+4uNmlx72h5VxOoYf3X/4iRMebGFcRAqJ+81lMhpsGax
 ElQyInrmMcKgUrhEEMCOWk6tuGQmBL2JYHw31ecuVxKpvZO+UWVj0/2LuGKe9ft3
 ux896clB67Ko8NqiKK+ukpXVosFTyoymg99OW/t8PUVtBpBD1ehwj57tgZmn683i
 CJnQpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rj8jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 09:17:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2697c4e7354so28464445ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 02:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758878254; x=1759483054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wm50d4xWWfh0HW+Cx0UYIE/gdY+1+ZE80v14qcFJHbs=;
 b=WE9F6e99bicuSQkotd/6T8dsZyA3ixRAODHVwLmIYCDbjUYySITORBWvIBOxBGvtQ0
 fMfEEM52wMwFUpIRMFolaJsSAURL9AZltGUnHhnWjzRwHShGZdHKUHfqcATzHKlF2Ub3
 P1qV7F1z1vCauxhFFSRJzM1DsjzaJlmrUnk0JKMIOr55Zdf63Wd7piGbRJJO8ZUeorIY
 lxf04KpcfqYbpkdfgQieB8bbXbxpx1qBFdaOhWzUucnQOAT31raSB0t27wX785lyf7V5
 96cXkPSkdXiFzjyOXeKF8Ezv59WnEhzerfRsxX4RMKGPfjrrPhM/LRjz2Cag14z68djZ
 lACw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmjdaClxW7K53fp2rV8jCSv6APHgQr/9lj0o/QAGfCQPgqCQB10nQRu2Tm9tJorsASWR6vWmGwAF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy414GXQ8VnmuHK2TLR7lOHLeAhLCWkCDE01D+ygyX/QzsMqUhR
 Z1sM8wfGTpEjr+FBL1ouhOklmBxlYu31SVKdgDK0eZipbLTGrd4CbfLYQvrtANRioTcY12eFur/
 HH+kTVBmePj31057PNwFp1Yab+cyyyIfClWY4zKtRPtG2RSI2w6WDwdxMWZOfBPjk3uxA9dE=
X-Gm-Gg: ASbGncuDWjspgGb/daPeHE2n2+0B9afYucXxhQSsFdlR9l7pKVaZZbaW9Jh9gmti6Ep
 AjU68EmhPz98ff2DEgcquVs4ij1NyHHmRvWmRtU2LAfjCzJbhljlrOHH1G36oC7uVgbLF7eyK/+
 GpYmTWVTlHDfmpFV0L/6FidcPj7cYOD5YK2Rn5Z+ffmvRxj7zFhEAWY+VD+PLG6u9m5xPGEd1wP
 5r14bynPrqXXWcwTbt2jVBVVfeu3I/Wg/Mm3anWWadncgPgpPGNnSEFFE+aXb43JgrLhJ1HwM+2
 B3XQ/7BkaJHGBArmgaBpSZY9F0y3TAWue80Cx/NGnTvcOXVDFn1+TR7m+0ir3Dag3zblL5pL+PB
 r0lulI+604HCejb72MKgDazX5ZR4s7WZ3Ii2+
X-Received: by 2002:a17:902:f78d:b0:266:3f63:3500 with SMTP id
 d9443c01a7336-27ed6ce6bd6mr59847905ad.12.1758878254226; 
 Fri, 26 Sep 2025 02:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbhY2xko/xj3ahYbA0EHEhHusHZw6XP4XJMWBT/7X9Ki73zPM3HqiR38u2BGTHutIJSleAWQ==
X-Received: by 2002:a17:902:f78d:b0:266:3f63:3500 with SMTP id
 d9443c01a7336-27ed6ce6bd6mr59847515ad.12.1758878253715; 
 Fri, 26 Sep 2025 02:17:33 -0700 (PDT)
Received: from [10.133.33.162] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66cf181sm48314975ad.28.2025.09.26.02.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 02:17:33 -0700 (PDT)
Message-ID: <ff178417-5903-43d5-8f4a-7666df9ff85b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 17:17:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
 <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
 <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d65a2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=LHWNMJjZwAtaeQ_MGxQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: 3jPQFxYuD2uBAO-xETib9dWNpfwOw5ZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2VdQWNmCCHHx
 ar71PBQBguLJaVnl8ZXnM7G/woUBU+miAadun1v6fUFWZGNRFH/bfBIE5xlplzu4VV6/COLXaZh
 VE2weDd56BBq/t0d2acLXNo2RhXhnjyIOaBkiX1brvGFTfLCsUFGHCRXYjS1h8M3+aij/tY1a6T
 L/DmXe69jsYAP4EKvY25yJxVDKyKoDb0NRIwIv23W9aHLAz+V3AXesMfhHLdnfBSjDIPRAxrL1x
 kWU5egSxjXsj0cljSRvPmjM6LjwrTOmIGuk84hiqMnlKEPVQgRtRQdoTfDpCH6536SDXrl5ei8V
 AxNvl01X/F69IVjGCV0PEEIKQDT57H0y/nFHT3EkXDganJqNxXg8wYJJE/iOQrXRG+9tXRXxuc0
 xaWaZvWOR91KTXyacbFxPfdmurlNYw==
X-Proofpoint-GUID: 3jPQFxYuD2uBAO-xETib9dWNpfwOw5ZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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



On 9/19/2025 12:34 PM, Krzysztof Kozlowski wrote:
> On 18/09/2025 13:14, Yongxing Mou wrote:
>>
>>
>> On 9/18/2025 9:01 AM, Krzysztof Kozlowski wrote:
>>> On Thu, Sep 11, 2025 at 07:24:03PM +0800, Yongxing Mou wrote:
>>>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>
>>> Patch v11 and still basic issues. I am very dissapointed.
>>>
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>>
>>> It looks like you received a tag and forgot to add it.
>>>
>>> If you do not know the process, here is a short explanation:
>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>>> versions of patchset, under or above your Signed-off-by tag, unless
>>> patch changed significantly (e.g. new properties added to the DT
>>> bindings). Tag is "received", when provided in a message replied to you
>>> on the mailing list. Tools like b4 can help here. However, there's no
>>> need to repost patches *only* to add the tags. The upstream maintainer
>>> will do that for tags received on the version they apply.
>>>
>>> Please read:
>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>
>>> If a tag was not added on purpose, please state why and what changed.
>>> </form letter>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> Hi,
>> Sorry for the confusion. I did intend to remove the Reviewed-by tag, and
>> I mentioned this in the cover letter, but maybe explanation in
>> cover-letter was probe not clear at all.
>>
>> This patch includes three changes:
>>
>> 1.In the displayport-controller compatible property, "items" was changed
>> to "contains".
>> 2.Use "qcom,sa8775p-dp" as fallback.
>>
>> These changes might not be considered significant. So I’ll be more
>> careful next time. Thanks~
> 
> 
> I really do not expect v12 to receive so significant changes in the
> first place. If you keep sending us buggy code, which then you keep
> changing after review, I will just not do the review. It's easier for me
> to wait for v20...
> 
> 
> Best regards,
> Krzysztof
Hi, this is the final version and i will be careful going forward.. Thanks~~
