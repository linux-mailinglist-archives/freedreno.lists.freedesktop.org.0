Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B5CC39A5
	for <lists+freedreno@lfdr.de>; Tue, 16 Dec 2025 15:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF7110E2DF;
	Tue, 16 Dec 2025 14:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l52Ekt3/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsGrp4Dn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CD510E2DF
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 14:32:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGD8lVk2869677
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 14:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=; b=l52Ekt3/3tztiqwG
 gVwiPPv7VlpREtpqvlh+JR4YQIKRXVgsl88qyfDFPt12ZTOjlfN5AA9jXn1Iq6kt
 UnlEGkX5kemeL+qfmIY+CzLK+ZE/zCZAXTIuOO7IsLnhJjZdzciHhcw2GaMcdfdS
 x48nkxLCX4zvGJJSEVk8Mw6wnQ1UQiRpzNGIZrn5zzU5EwzwH8W59EGWehMlzvv9
 6U/Qk4IdbXbdQdJqzIYM+FONRucm04VVmDXNa1ac05LWk/38iB7KZjMUdd1TwsdE
 vxkW16kHscGUYs5HMVlKxdoJe8nnmHBzGyNvxosPwSUCEJUH9lypLw09kziVWvas
 pSOhlw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33kw9hng-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 14:32:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-93f667cacadso3150133241.3
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765895568; x=1766500368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=;
 b=JsGrp4DnLxrxmt/jtnwmVL3GgWom4DJXyptOOiJY5U9KnjqO/xZr09bT8D1HBFYPKv
 zoJrPH4G7DolKWR4pJXnCkoCEuiGcQNV0HfNHXaaW40fCSGa1VnCZERWQ9ZWaS/vajW7
 qFykriDprPzf8Wi1+zRX+0MtI5MtXxmblhbbgobISokwM94dShXtMAiFIDo2saoTcvRt
 acj6I7yMyvKwxO2VUa+dXIUUo3hbZBaCSyXK4yz1l/GWhbE6iw2DkYuZClpbHD4C7w1m
 vbL4I/aDeQ4sDd5Glo4QkH+iSyQ6g/gyjyVgvrADXp5pkDTmCNHvLcf4I6Fyj4Kvgpb8
 AeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765895568; x=1766500368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=;
 b=iMfH44v9zwbH5RltqyVLYjfIq4DUhVeOt+tc1EMLsbSpwjZdCs88pj9WNxcZCL/80C
 PT2MDj+zLti3bPoPK3EcPYbrdct/e7cVmyJY9b/kbLyaVX9RZqVHOalX9B4ZrtQlR6o0
 IltF8Q7OX42R04bPv3QrsJackasrjGWTfAJIWxQAdYHDN7qB+lLwDLSzwXDmemABInQ/
 NBr24eYgWPxYqaSa+32Z3JtS+LWytDI6RAMsfTd12pMsvyUvPeeXCQdrku8eEHE56P1y
 uNI/cnACjd8Wrj0SJ1W3qD1hP3uYAuRNml/MbeBvhpZ6luPlQ1xkAq8N3og4vsk5WLnx
 L5OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCsGdgpTbaiClCLLjJW4/GstmNF7offzQbng5s7FgWJR3SowZKMvwTcxr5XJgSbhOAvFeT5NgzkNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw21t2IIbS7Dozsif8XBUxzivPedgK4e9gaVpXNO7gVVMVaIoX3
 mpJ3GaNgJybKxEva1/7/OVSHDT1ie1w4SA2mIhmVfDhgjEwtCWqmbM6QedPbsGYAMbUvBwXEKCg
 grsME9tETAAqF0f9RBYLNfluAeHrv1mCpBVF0lkeRvz79m87LpujGPnscVpYRuRLtYK6fOhI=
X-Gm-Gg: AY/fxX5aLOBsxjC8BwpevR6SkrJgn9cZlGixUPI7+JV623/1+PjlfoyeS4GhWf2tZqy
 7G8LRLt6ubqUTp2OXgk2qbopej+k3dzzFRMH/+YQ3uSp/0v/Tm8tHng0kIaEv6sNUfrQyoR9ZVv
 EGkMVR1NlrZDcWUhmBYROENCUsBk4/1LXHkpOImYI23IyWzw8l0H1vK21HeuAd3ahDILB3IEAhX
 bw9pHfVwnqhcCPerEMXDTfVfL0OoCK8BLo+3lOxOxZhDo+SCLiLQMIDjENAmieKSBRyi8PTJk55
 C9Rdv4fV5oppiWzO5LvPytgWDfc0Soh6p0/hM3D9OK7h7Mlow3KL8AgOpjmyL2Imi873enxUVcG
 NEtFKpJGYNjwGeE7Lwq8hu5BAHGJlDvTHDuE8wDtaOZoDctdzGr/x4NClMtmOUqIONuRQ
X-Received: by 2002:a05:6102:4487:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5e827488c7fmr4127717137.3.1765895567453; 
 Tue, 16 Dec 2025 06:32:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5bvKhIUfXMFuxDOHV/Y5m3VNAwV/RECgvjwhUnC/dgoHjCv0Ee4gAMKdHTBXr7UcOFJElvA==
X-Received: by 2002:a05:6102:4487:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5e827488c7fmr4127698137.3.1765895566843; 
 Tue, 16 Dec 2025 06:32:46 -0800 (PST)
Received: from [10.193.196.209] (82-128-196-119.bb.dnainternet.fi.
 [82.128.196.119]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da1a7d8sm954688e87.37.2025.12.16.06.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 06:32:46 -0800 (PST)
Message-ID: <0e9c0f8d-c1f6-4c84-b467-37e11837882e@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 16:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
References: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
 <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
 <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TLpIilla c=1 sm=1 tr=0 ts=69416d90 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=UP4AmmvVc3sGQHJQO2VA4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8z4_Mw9kuIkUejV11uIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: Z66lIZkElQ5Lh1PrKP9oj-vNYyJTFVP-
X-Proofpoint-ORIG-GUID: Z66lIZkElQ5Lh1PrKP9oj-vNYyJTFVP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyNCBTYWx0ZWRfX274WyThNsycz
 iM5JgJ/QN3tBauQKcOPP6QhmWxwoOFp5QmYx1e2ez4VmBYYIAH+UQkeCIYS4NhmlV727aQscIhx
 E6ghQYGjioQJZciG6Nd+ZEK7zW5YBYyGZdleEyDdyZf5+g7PwWueZXWXz05yFbNOKKFRE1U5JPQ
 cDEYuMk6ukc9yJHMyfMZn+P+jDUzFCVhrIyDjpcIlKaNMz/aGPkRG+8WmK2/8dVekIEpxWTE2jU
 PshG9VjEVqUD+LaKWIjaHSbeK5hDSNX4CJnVxxRRjFQDiqg9zAY5zoMVSmoq0y7mn+SwlHve7e+
 Vb6Fd84Ihx/tsatGL9A1EkEhaSX5INT8f2ahhiDWHbS9XQ4FIk7uVWTgZlMQVKoF5x3JJoscfLE
 rbxGYOAWTDYOydpOWWQp0VbOAcjlzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160124
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

On 16/12/2025 16:31, Dale Whinham wrote:
> On 15/12/2025 22:15, Dmitry Baryshkov wrote:
>> I'd suggest following i915 and writing DP_LANE_COUNT_SET before
>> DP_LINK_BW_SET.
> 
> Thank you - made this change for v2.
> 
>>> +    /* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
>>> +    if (link_info->revision >= DP_DPCD_REV_14) {
>>
>> No, eDP has separate versioning register. DP revision != eDP revision.
> 
> You're absolutely right, this was a mistake.
> Does something like this seem reasonable for v2?

Yes.

> 
>      if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
>          u8 edp_rev;
> 
>          rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
>          if (rc)
>              return rc;
> 
>          if (edp_rev >= DP_EDP_14) {
>              // parse the rates
>              // ...
>          }
>      }


-- 
With best wishes
Dmitry
