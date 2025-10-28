Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32E4C13084
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 06:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A3510E589;
	Tue, 28 Oct 2025 05:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Od5+Q6EN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F021510E047
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 05:55:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59S3cfUk2232075
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 05:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hVbVyBqtSeMwHa5ZCMjstEwuUlHs1J5AbZsAqxmUJpM=; b=Od5+Q6EN/hVcROkv
 68QhvL9ePE1pHjnXWh+zV9xtdoG9kqSXFOH2ATTmCVE2mHk5ToP/thq7TldSQHJZ
 nx7RovXoZL7Qfmap5TTVF10lORG29RNRbed7jbaq0rS1RGQNNTVIBIJYHajuUB/m
 EituOtTvHoaWS42QNop+O8QvhZJ/P4ndH4vH2J1Bb/sj6Az8YsgUYTVMy+bpTeSD
 3OWQDjccQoBpbj9f6mWDLjk1Frh3ZBJ3LTpeavIplBzLLVXduP1GREB6lAtHfjL3
 mxiJ6s3qPTeTZfZuVkiEZl79DNr3bvmpGMGa39W4Bp5OtG/lBJj2E/fd+At76jaV
 bw7PcQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wnbhw0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 05:55:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b6a33319cb6so3753095a12.2
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 22:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630904; x=1762235704;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hVbVyBqtSeMwHa5ZCMjstEwuUlHs1J5AbZsAqxmUJpM=;
 b=WdTCc6SMHqDT5ZEdQ54t0DBAIix9cHH3LqF202V6ixD8UsGsLYmPwcwGXu4tJZHDzg
 F9bRGkFQH6DS08O7SwPMOOxALT9v2ac2A5o7nWJWVLjDaPDYwtRk99S8H55Z+IENNILi
 RaHfvi71KprWmxq4jj3yS2ETjU1+0T0AP04jK2i8GZm/9+fXG9m9jcdqmq3LuW2g/R1V
 ZKtgL4iCNfQCxJNTpaDHd6i1o3YLaOqywuMsX/SR5Cy7YJqeEAXr8Sp1BN+K3XxYuzM1
 6S//3u2FYGjw+EgSMS+qV9KsgAJnYQPPYaUUjFpHM4B7zgqfTweB/Xfuu+MQXIKLTtMp
 Oz6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoXrExKLZtgTiPWqe/Ih8zTpDZg6LACroCO5bXI8ur+Fn4JkIxaQxzc5MHUK8qMPnstO5YyX9gqBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQaOMOqyeyShshAT3Y6lb1UG+KsF8S2sY0HgSWE8WqgGJh24Lu
 aEEUWqHMwvt+1sEiVrSeDLnVzzD+mjiAEDOWnAmxiFL8zRPpLnEqT5yGeUqDb2UAbfwY8RQDwhL
 TNX4kboBS7vbYvbmpOXo+lsjdQ5Cz9q3q5u8dykVYYW8HfDGovStX/7nemUQXLR3YZcvO/VE=
X-Gm-Gg: ASbGnctYKRBCiEXnMttAFi7+SQiNaB/bVRSiEFcx19z0MFeQ4KFo82M8p4ZpSFp6a5o
 sKeBYNe+9DzRYb0tQocsjld4lUENYgfoKbWf10MMXV8fdNMNgAbawsJVYdjUNBIatUrDyx2guLo
 j4SYQLEsZdI3KDK4vRVCIaiCrOjts6hlT596FtFlcUeFerfWr9/PPEdOuCM2Lbg7ZR+ACQn0GdA
 Td0UIf1mfYLmJyYO1/gjTFpz1NBtU4jwIWLm3JwqGjZnPFktjAYTddSTdCQ+1L6DoxKPooRAY74
 WGakUAJKOcJa4UxtPTt4WEaF6Zn2mAm6p2l02ZNrXYTmwJBPBQ5aur88gdqTquo9fnRkepLTBGS
 BRW4YjbRX5qjYnYc866h1Qw/JK1ep4sJfUE/Uj/BBnESLjBkLyY+S4UakGhw9D8jgmiW/878=
X-Received: by 2002:a17:902:cec7:b0:290:9576:d6ef with SMTP id
 d9443c01a7336-294cb67481cmr35489625ad.54.1761630903956; 
 Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNN7tbxAtF8QwpzLzr8V1BNKo9CW6ELJvgyAYmlxy+kOCt0Ww5BoZG9W1Wv8WH/BdO4oLiA==
X-Received: by 2002:a17:902:cec7:b0:290:9576:d6ef with SMTP id
 d9443c01a7336-294cb67481cmr35489155ad.54.1761630903456; 
 Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
Received: from [10.133.33.222] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf3405sm104695945ad.2.2025.10.27.22.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
Message-ID: <89ae527a-c4b4-4294-93ae-e9afffb11f7a@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:54:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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
 <rkuihu3pmhexeahfch6j7bvwn5rn4ecccbhamluh7fas5qgaup@av2foeiwmcz3>
 <8a6861a0-f546-475b-907c-65b691d1d340@kernel.org>
 <cwuecyparlinhtdqckff7vdqpkio2kk7dwemzfao6qkhnuzhul@mfyqdphfvbdg>
 <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=69005ab9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rkEqYQ_PoaDmHDwLzVwA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: FS7CiRqyzAICu6QGfp6y3Mwh0XjIMfPV
X-Proofpoint-ORIG-GUID: FS7CiRqyzAICu6QGfp6y3Mwh0XjIMfPV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0OCBTYWx0ZWRfX01ccoSzfKHL0
 yI+ZG5J4WaGzoyNfYXtwt0GHisz9GQUsBSsYDJRrn7VUgac7vgAyxwkPC2q3ADR5SGIzx9RyHdM
 TIQzPd0FnYFdQhZm4ao70AZSjlIGlXUJEJzVebbvZkRjOS1LPLy7rEYG/D8IM1uxTwNrBPjNTYM
 IVx+brOJf9JNH2YGgiBH6TpXd559hQDl0LrHQDdczP49uGKhAlBWCpwMSsCcRwZ7Vjt57aJyB+d
 NpamZL6R59aukfl14jugvHAvs5GxGsNFkKao7NpQGxeR5yggp+LiCh1XT49SGE4n+0jLgIKLbfH
 NgeTWNRlxUgoUa21PNcLd1b1w8CaAAX3UB/udIv5lIaEcsjuhQ7+Ss0COWAezemglZcaJg1x2ec
 NyoF1rKXS8/DbfUukUcmbdDSf0WN7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280048
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



On 10/27/2025 7:52 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 10:40:39PM +0300, Dmitry Baryshkov wrote:
>> On Tue, Oct 07, 2025 at 03:43:56PM +0900, Krzysztof Kozlowski wrote:
>>> On 27/09/2025 08:26, Dmitry Baryshkov wrote:
>>>> On Fri, Sep 19, 2025 at 01:34:39PM +0900, Krzysztof Kozlowski wrote:
>>>>> On 18/09/2025 13:14, Yongxing Mou wrote:
>>>>>>
>>>> process in other patchsets and in my understanding on how to describe
>>>> the particular hardware block. The changes were reflected in the
>>>> changelog. If you plan to review this patchset once you get back from
>>>> your vacation, that's fine. If you don't plan to, I can ask Yongxing to
>>>> send v20 just for that number.
>>>
>>> Solution for me could be to ignore Qualcomm patches till they reach some
>>> sort of maturity.
>>>
>>> I am not planning to review this patch, because:
>>> 1. I already reviewed it, so not really necessary, but even if I wanted:
>>> 2. It is gone from my inbox...
>>
>> So... Should it be resent to get it back to your inbox or should
>> Yongxing just restore your tag on the grounds that the changes were not
>> significant enough to drop it?
> 
> Granted the lack of response, Yongxing, please send the new iteration of
> the patchset.
> 
Sure. Thanks for the reply. Should i add back the reviewed-by tag or 
just resend the this series?


