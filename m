Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802BAB0EFC9
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571EB10E7A7;
	Wed, 23 Jul 2025 10:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdeZnmv5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6643910E7A7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N96Z00024768
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ADPEX257lqLR7aZspkqZLx5E5CPI+QZpWMnfs3fbuRI=; b=JdeZnmv59F6s3ybT
 mj/FzWcRtRL7AR38Xeel4YhTE3aoxfIBO6yRr1VYw+jXs1Wetl0N/h/2xqSRMx5l
 xUDssShPLP8Waqh7FtemfFjAzkM7JbswAqU3YX+/EsXJDOaeqw9Mp2FVPxp5f+1Y
 FWIQkJhI5FoIkhu/dGGAwDKiX4+z2jRrf/Omt9tXVYX48zzZufwZfJdWqNIoA0EX
 aimVtxzmKM0qixrZcxLzbY2MmRylj58rj2kqzBV2POpuQ5nC/ObOImkKiF0qDt2T
 JNm/Zw7dvxZ4dSi5o9bmXO0C4PrqHTusGZY0bFZSBMyAyddofVkW9l4N+9rTnZOY
 /WNkQw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dmmab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fac0b29789so23606596d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266450; x=1753871250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ADPEX257lqLR7aZspkqZLx5E5CPI+QZpWMnfs3fbuRI=;
 b=NtFVaPnEZQEgLdB+/13vHaHDNNwKMy71jm3+bVMmFbqL7COsgdII3jSh+0ekO2oOWV
 jRNuYfBRw56EBDtzvKY0XBYrjz69OsVNbY/wEXfsVBO2JNNj9oWfOLcx+BVfMD4wef3s
 kPHfGcuhNl1YBycENXVxf3tRfyanbm6E0x6kZCWTiuzd2ZJZG1HOPa3DHu3BbJb6LPgE
 uAHHzpF6n3eb/n02OZlfbsj+02y9U5MHQu02HTopwYJK46ngMhfq2Tg/h5/HO0Y4SY/L
 6SM8hQQIS7d2tsFvOvWBT/QaLVVRGE91byD3m/LuzGPJPYOeZBP5oQY2Ya/Suj7nU8B0
 nDMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ6y4Bbp7ajf/PrF5YDL65K8WEAJ5BlPipD1qISMLdJW+EP+TAjHPznxqcPohoX1Rs/NVBX8kTNsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWlRwfoH9IMdxYHcrK012Av12GAl6O7mDVeyPEEwdHfedoO8MQ
 jgGEVWTzFIHL4c6sNgDH94cKwcC2irjg/xovvK8JPfNJIJEQ5kU+2Pi4B2Cisurl8JZXvodsTl1
 KbH9PVeZ5MsDb8osJTZM2qO2BJYWC/NyPLCLa537nEtQkEvmw7Zk7W6dRW9qbB1FlQgPVGj0=
X-Gm-Gg: ASbGncvZQ4CcMG2MtQFtsTzAO2t+MJU537/d7qRmTxJ+egaHQTbnSi9iIvf7YLo6i7y
 NWNNmUrtDtu7yHwZdG+xYdqw2BcefTocGpXzz2Z4PmVKsS9nXGwxHZ2s1gqiCzTfCR6lE88RYD+
 yE9qg34mloh/OoGXrV1CCczxSI8r5mwKx/Fa6gUiaUezCT5kTKpamyJDuvDJpzzOXIiMiSyEKF/
 YsHtCWxeJyLUP0Y91TW7I+1lo+8MF5abHkXKkp2/9OxqpRdEYMIhvl3q46uSwBdTjYGtckBv5Cl
 mn/W0hVgboR4JXz/pJfJ57WNMGkoAjyMjM4wWUBMc9JQzZE1T0ix2ShQyRxOH5R3Q63FoZ3stzO
 b2siheBXA1VApbJBsSg==
X-Received: by 2002:a05:620a:9157:b0:7e3:31c2:2808 with SMTP id
 af79cd13be357-7e62a1635c2mr84740685a.5.1753266449887; 
 Wed, 23 Jul 2025 03:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlbBqrpR3KQ18lK2XKRLKljilp74CSPk27LxST7ZbUN/lfUZkp9SSjf53wAC8c/dVC+rHKMw==
X-Received: by 2002:a05:620a:9157:b0:7e3:31c2:2808 with SMTP id
 af79cd13be357-7e62a1635c2mr84739285a.5.1753266449263; 
 Wed, 23 Jul 2025 03:27:29 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c907759bsm8191624a12.54.2025.07.23.03.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:27:28 -0700 (PDT)
Message-ID: <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
 <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880b922 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JXpgR7ONGPNzM5tbrfUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 0fDFCpZ4sdb-KRXPOcmkJJGbi579kqcP
X-Proofpoint-ORIG-GUID: 0fDFCpZ4sdb-KRXPOcmkJJGbi579kqcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OCBTYWx0ZWRfXz1PkeASL3923
 JQyc7dzhf83soh3nrH0LR5kvlronoHsoR8PBY79l98lHizXwZF9xoyVn7dT5h1d7J7T4oQAkvJs
 deU822ja7mqSeatJdFawxbRTNtn9xpO35S6IIpww7mTG39qbgVshNPDs8owr5A59OaEdBb83b2v
 Bk/oG/+aOAA2y1js11yz/bkvnmQ1pGVcxwn4TWUWqVa2kr/URafxAujayKv3JLRvtlHzblUTUCR
 M57OWCKDGY8vFPFwwfIYrQWRSPW9w8MxiyjXKBG8hdNIDKUNNm8hv2283nGtULW7YDTxMdq7oKu
 2bBb4YPBp1B/W9MSEfxvPN/M/7mgNLb4jCaiFJSImUe08qXT1ebdY1wdEERRdzx47ULTSAy1gdm
 4F9GeMtCou4eV4/7Fd2bj5uyM26F7DAvr9yA4pSMIfWN98O8Peop4WOMooLDmk2SKUu6Nfc/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230088
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

On 7/22/25 11:27 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>>> for a gpu. Based on this flag send the feature ctrl hfi message to
>>> GMU to enable IFPC support.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>>> +{
>>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>>> +		return 0;
>>> +
>>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
>>
>> magic number?
>>
> 
> Let me check.

techpack-graphics/adreno_a6xx_gmu.c:
537:#define A6X_GMU_LONG_IFPC_HYST      FIELD_PREP(GENMASK(15, 0), 0x1680)
541:#define A6X_GMU_LONG_IFPC_HYST_FLOOR        FIELD_PREP(GENMASK(15, 0), 0x0F00)

(same value for a7/a8)

0x0f00 is 3840, which smells oddly like the XO clock rate (possibly mul/div2)

(38.4 MHz or 19.2) / 3840 is (1000 or 500) (ms? us? cycles?) and the other one is
(333 or 667) - without any further information I'd estimate this is some sort of
scheduler tuning

Konrad
