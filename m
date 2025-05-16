Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C8AAB934D
	for <lists+freedreno@lfdr.de>; Fri, 16 May 2025 02:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475FD10E986;
	Fri, 16 May 2025 00:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoarfBbP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61D710E986
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 00:48:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFGB5024402
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 00:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eJwe0WaTATjPuDQBRpYRk46bCtNvD5nI4hYmgIuJ90M=; b=aoarfBbPpBtN8svj
 4epA/14KwUKec8F93WrbzmB9VNHXsMWyZyJYJvAmjmWE3C3cFDvoIxX130g9bC3K
 5hIgnTbhZns/4STZmAD7SGzUN0uYGUIuRu3vlL/CVK7Y7p9V7Op8a7xtBH67lWVf
 GvESWPew7YPB3PloZSVZ75GUIqxUEPtJz9O/Vza6n6QM4n5kvhD52o9jPAiACobW
 t2NAcmjCMT8TQOZnIh4sc3lfdmtDtT2WcLcCrsz9pHnjVRvHstHzNhD0g6nK/BAP
 07ELv9TW6ZGz03+tVwYEiiLPxAYGrzJudZYeMPUgJwnAXUoBCiQ69EOm0yO9WRel
 YgVZvw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn093x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 00:48:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-af5310c1ac1so899241a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747356491; x=1747961291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJwe0WaTATjPuDQBRpYRk46bCtNvD5nI4hYmgIuJ90M=;
 b=DNw0qALZ1Iow6C5uX5asp4fk0Woz/BxyvlyLRqr7bom9cjbpD+KWG/rYwAlt2q1sdj
 z/p5GIRF0FvYp28ICOfEByhJVw5aSj46RJsJEpiO+kxAuATlZ24s4v4bb4o6Azt1wHwG
 +oLgm7wc3DQA9u0oW5GEBF15te5ukkTp345eqNQdS5t4qYaWUh69vTDVMWGt7GYjMVQ2
 CVwDJjFIEHQ3koC2d8miprSmDb9mPzghs2DxiBw9gfgetEd+egvkZ06dOw5giARcv78I
 lnfmDWxARawYBds04ViWZKR9ABe0txqVzDyK3HthS2hV9Z59XL1eUMhmu2zmhGmdKNGT
 R3ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsaWPe55RYQ4/fkWUTV9hucxaJO8nalMwP6KRVNd+SDueuB4WL9Z8c2HHBamFC1k/wYg08Sx0aLJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxRhcGhDM0kcLnJZmp92FP2RBpfcUHMwZrjZ5gRJQT1WywuVM6
 X9hPo5caOceuxfDdc3NWZb3FKS3+DaO/lDIwEKaBOtDTOCGzzSujZ0ojBVPv9npMnGXXZlrc+2a
 etAD2qI7btkaKK17M1mfntYBWcfnIo6eoMvQWqAZ1uDa1SM+BA2rvRjPKGf0JztsHkO6wlQQ=
X-Gm-Gg: ASbGncsqIC/jKQBx8XoTu7qgFo9ZQVrr8AgP3/hSbdHv47XkMfc2MAyHIL1pipa14y+
 iPpvvel6qzOzA0UbIdGF0l9atTh/p811PP7/lAepTjkVrFOwIg7qHo1f1fyuMjtP8Q5WnPx9Cbg
 rWZoUj8BZyZqbXnlKlnObgqQ9iZFkQ2lZ3uaK8Zs3u2SZBK8hvdjACSxBcx9/u8kD+5xPn+4J43
 W+1lNMo1/kohj+ClK6SiBJosOKJ6CQw4frS16wiw8lRbNE3i6eBMVOivW8knpiFUr68AoRYkvPk
 jK7SHdFTg8OcqKjtl+P19W2ac9y9qEweEGxdjEfElv2GI91XAqsF8MDjIckGF82yzQ6oNg==
X-Received: by 2002:a05:6a20:9143:b0:1ee:c7c8:ca4 with SMTP id
 adf61e73a8af0-216219f8d84mr2191388637.36.1747356491301; 
 Thu, 15 May 2025 17:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElOJZvNSsuOCJC5gbWoMAaCBBEQUY+Qd1QGBRr8weuXx6OAJxIlMvUCJtTtrI6xCzlhuO7Gg==
X-Received: by 2002:a05:6a20:9143:b0:1ee:c7c8:ca4 with SMTP id
 adf61e73a8af0-216219f8d84mr2191369637.36.1747356490958; 
 Thu, 15 May 2025 17:48:10 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9877056sm420384b3a.143.2025.05.15.17.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 17:48:10 -0700 (PDT)
Message-ID: <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:48:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
 <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jiv-PRYyVTSkCNiKCpyEe8eNlPtSW-Ls
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68268b4c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=TtJqN5EYLmW1Dglx0zoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: jiv-PRYyVTSkCNiKCpyEe8eNlPtSW-Ls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwNCBTYWx0ZWRfX/sWF0e0/r6w4
 gQB6CglZEhqw2J4mY4u3p+phhQBHN5EmYlAnHR/70nakioc+pDYVBaxyWAX+tFIk8Inq9TCAg/G
 NQX7ZfvytD96oSU39DPDzbR9rYWmwBRsZdCChzKu8Jt6TafyJH+UDL/5DaxqPKVZJt1NMHq0BEq
 MnZ5ktx3yG+jCI4yt2o51tbAHSAcPDsU4VKLCUN6E+oNfK4nBHDQrex9sh01GBJF9yyr9dl2p4C
 R86FYxMr50p/nDxvo6qS5XTYaQkzOImTTTQl+NxjVskay57XJEbpSMmEqaSCT+OyROdY5iZB1z8
 yutshNOcwXfEojSaBsrSQpTuT+2LybHFdZkgz2fpSd7RE4mAZJOhRQUZ0cmJx0h5QDluMpiQBA/
 Y4j48/RjJFzMkXeuaBf0oGh96gTioTEbP7/cGFi2dPshvAJA07/L46dheHwDLUX9mdoblnc/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160004
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



On 5/14/2025 5:17 PM, Dmitry Baryshkov wrote:
> On Thu, 15 May 2025 at 02:52, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> Since the max mixer width is not a strict hardware limit, use the actual
> 
> Is it? What is the actual max width that the mixer can support?

Hi Dmitry,

By hardware limit, I mean restrictions based on the size of buffers 
within the hardware block itself.

PINGPONG, DSC encoder, and WB blocks all have buffers, so they do have a 
max supported width based on the size of their hardware buffers. On the 
other hand, LM doesn't so it isn't necessarily restricted by a max width.

I can clarify this in the commit message and cover letter.

Thanks,

Jessica Zhang

> 
>> hardware limit (the writeback maxlinewidth) to filter modes.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> index 8ff496082902..0a198896f656 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>>          struct msm_drm_private *priv = dev->dev_private;
>>          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>
>> -       /*
>> -        * We should ideally be limiting the modes only to the maxlinewidth but
>> -        * on some chipsets this will allow even 4k modes to be added which will
>> -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
>> -        * and source split support added lets limit the modes based on max_mixer_width
>> -        * as 4K modes can then be supported.
>> -        */
>> -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
>> +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
>>                          dev->mode_config.max_height);
>>   }
>>
>>
>> --
>> 2.49.0
>>

