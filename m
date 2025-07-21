Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAEBB0BBB1
	for <lists+freedreno@lfdr.de>; Mon, 21 Jul 2025 06:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F6310E394;
	Mon, 21 Jul 2025 04:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd+gqMZN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651CD10E00D
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jul 2025 04:18:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L40uAh030100
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jul 2025 04:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0HxS55+QTxxnhovCNlJMVgeCUCIs7adrQbeCrM4+8pY=; b=Pd+gqMZN6VlsReQ2
 ApLJJ3KRx8yfPGzjKNebwJ80Go6FToeUYYa4O3lfQ5S2qmB4E34dhEzTL4M9KXN7
 vU58SaWiWgI4OzuOYPgSrgb4RQf375zxiPkmT2RUyzmLU7FJsSnJTkBQqSIc0xQe
 hH68NESm3siMXM5EMpgKo76pIExrNphUcOUVqi/jQgSj23wvtEG8dmGSi6TaCuPI
 thk+Z/BVtHM2Lw4D3n6mBmBwz1l9IKfKnqGriP6TdGbt06GYnx+uoH91zzfPDYI6
 F/Oi+QNMY1ijMZcOsntm8K2USXBvnjx669FrqrQIPQixelVh80lAKL/3UoieitQL
 j6WMLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tba3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 21 Jul 2025 04:18:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74951713860so421975b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 21:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753071504; x=1753676304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0HxS55+QTxxnhovCNlJMVgeCUCIs7adrQbeCrM4+8pY=;
 b=pddVshT0lJRO2FEuwyXar7s9F999M8KsFLlMpGDnct5RCAcw5+5ZIbgECGjz+JQ9wL
 CXvhcgzH0qtyqDfqfMvq/6F6cOqDuQFp7vLkdcJvVsYRlkAQW1wKeBsID7wUq/Xdn+LK
 Y199Y/nx7w/mXQ+LOWV8uo3yghbXWmWBLL3uaTeM7c5QXO8SD2qLMT1YoKp0+5m1VZFp
 l5orYzArcezauaDZSsPJScJiSfCbkrcBEc4+mN9eigkBN4A0sbt95/136iv1LRmOkUc6
 cYb5IN9NXCloempYEbZGJX69kgGhLxTbwvv4wqOvrjgeKHy3rd8eU++UI+sPD0H0hiWE
 wbkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8dY9e2qGim6coTQf9MYDieK2zVPwczlZR4YH7K5T0UHNUS1MNnxKkg0RAUjFEBi7jrMQQywiJUKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytkqN/qvo5ZN3fj9Ld7NDLaqFdLpx+uFVFbliOcTrumiT8Lb0r
 PY9uEBVO109Y0w06gkHzlkMS8fhCvERoGuWo1SbQMRAU5PqSRUerJKzkabLiOZfppNDwu9eX7XB
 Ua1gOvBRVccQRFhaWoZomUnVc8IPX7fw7jD/Wul3vzgtXE/SkcFMIk56Z0DpVmkBiktJIIno=
X-Gm-Gg: ASbGncvnTL8Ec2vUHkH+JUYiLI+4AuYA8S1bMD9aRS6fPJUelVFPaL8YkT+tItu/GRj
 GmL2doEWjLjFOcSxA05YtwOT/c0b71nr7NeWKHaMT3UvBNaBg30ENdVy9dBF3eCrc9FFj+naW3o
 cwaFUK4NSBDGzqxRN5tlS0cGnOm5YVkiAfpmxDOAYGa3YIKoMyppOGVPqfm0DzNHvFGoW0s+Ybr
 SfVQGnm/eCLff8u2BWz5/aNavD344sDz7WxihOroslnKiGHT9ak2c49pUfKFhH7RNbtakcRnjM/
 60MgII6nMfgGr1111f5i+1UtjOwMiMBk6FAnbKO0zM7/AD0TYTtAZm1KDLlq5NeYTOHUhH/bZb2
 MDwLDRRg8kZrlIRJB6Cj96op/nwuE
X-Received: by 2002:a05:6a20:9147:b0:1ee:d6da:b645 with SMTP id
 adf61e73a8af0-237d5c0df9emr13823370637.4.1753071504500; 
 Sun, 20 Jul 2025 21:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9E+Jpxuf/n9mwdKcrc+ICdr6n87fGKbL6wE5SUt8XIJ2tugZsZ8TP4nLkT2kWBtaUKyMt+w==
X-Received: by 2002:a05:6a20:9147:b0:1ee:d6da:b645 with SMTP id
 adf61e73a8af0-237d5c0df9emr13823324637.4.1753071503997; 
 Sun, 20 Jul 2025 21:18:23 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe8ea7bsm4493637a12.21.2025.07.20.21.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 21:18:23 -0700 (PDT)
Message-ID: <a723b6a6-c70a-442f-9785-9f607548664f@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 12:18:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 quic_xiangxuy@quicinc.com
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
 <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
 <d427de7d-76ac-4e5b-b79a-3b7638a8e7fc@oss.qualcomm.com>
 <w66xyhu5w7ajpkennvj24cad4j6izvapsp3reyla7iui2jdgkx@d43b6z3qw5tj>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <w66xyhu5w7ajpkennvj24cad4j6izvapsp3reyla7iui2jdgkx@d43b6z3qw5tj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDAzNCBTYWx0ZWRfX833DrMKScdv0
 XWQSB+4N0oI6ObSiFnSq3RDSdIOZ+bIeaHUuPbiLtIOVmQjP5TJCeoA7f/IrmOPB1s0m0zdSpq9
 f/vVl2E2q7Ktem7nCxqxIdM5fM2ofPex9422ajB5+03vM1k83swBJxRI5QblsFL9e8KmFkxRM+j
 xVITfvQm2tRmN3Set4JEPLbwXloQVcy17S2ImYp32iMxOe0F2okHptnRhai1VXudHQ2N23QV3Sp
 kZu3Upj7xDIgoFsuQGz7AfrIQ0CPvkj6GAq0PCqEk1p983cmlZZnuY+bwLZNlCrTeZ8dIsuaQpv
 dEuTTWqBJCIsOV4bdWVWBZ0OdAx0oob0KnPVk8854VlXxWg5ctbEebiiuDkULfFdi9rWT+R3g36
 g77J0VDfLseTgU5km1EcEeAG/zGJbvUoxnh56uIWQQPnA6QP75RJxXd04YtAr6PZrOW+hDRC
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687dbf91 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=q-zp-rPcFIMxVU44S18A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pQkzmVqmgoobqJ2NZF4pJABXCwZbro4G
X-Proofpoint-ORIG-GUID: pQkzmVqmgoobqJ2NZF4pJABXCwZbro4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210034
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


On 7/19/2025 5:43 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 09, 2025 at 05:16:02PM +0800, Xiangxu Yin wrote:
>>
>> On 5/28/2025 4:49 AM, Konrad Dybcio wrote:
>>> On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>>>>
>>>>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>>>>> when the link training #2 first attempt fails. This approach enhances
>>>>>>> compatibility, particularly addressing issues caused by certain hub
>>>>>>> configurations.
>>>>>> Please reference corresponding part of the standard, describing this lowering.
>>>>>>
>>>>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
>>>> Anything in DP 2.1?
>>>>
>> In the DP 2.1 spec, mainly on section '3.6.7.2 8b/10b DP Link Layer LTTPR Link Training Mandates', defined 'LTTPR shall support TPS4'.
>> The other parts seems similar to the 1.4 spec.
>>>>> - All devices shall support TPS1 and TPS2
>>>>> - HDR2-capable devices shall support TPS3
>>>>> - HDR3-capable devices shall support TPS4
>>>>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>>>>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
>>>> Any other driver doing such TPS lowering? Or maybe we should be
>>>> selecting TPS3 for HBR2-only devices?
>> This logic is porting from qualcomm downstream, 
> Hopefully a downstream has some sensible commit message which describes
> the issue and the configuration to reproduce it?

The downstream commit log shows in 2019/08, SM8250 (kernel 4.19) type-c DP meet LT2 failures on Samsung HDR curved monitor, the pattern lowering fix was adopted.
On QCS615, an mDP-to-HDMI adapter cable exhibited similar LT failure pattern, and it's works with this solution.
However, It's rare compatibility case with special device and lowering seems violates protocol standards, maybe not suitable for general deployment.

>> For other device, only found in some older Tx chips like i915（intel_dp_training_pattern) used the maximum hardware-supported patterns, but not lowering.
>>
>> According to the description in DPCD table 2-232 003h, From the DP spec perspective, it appears that all supported cases should preferably adopt TPS4, as it is more robust.
> If other drivers don't perform this kind of lowering, I'd prefer if we
> don't perform it too.
Agree,  I'll remove this patch in an upcoming version soon.
>
>> 'DPRXs should support TPS4 and set this bit, regardless of whether the DPRX supports HBR3 because TPS4 is more conducive to robust link establishment than TPS2 and TPS3.
>> 0 = TPS4 is not supported.
>> 1 = TPS4 is supported (shall be supported for downstream devices with DPCD r1.4, except for eDPRXs).'
>>
>> Although maximum capability of QCS615 is HBR2, but the actual pattern supports TPS4. 
>> From pure design perspective, it would be cleaner to drop this lowering in next patch. 
>>> Bump, this patch looks interesting and I'd like to see it revisited if
>>> it's correct
>>>
>>> Konrad
>>
