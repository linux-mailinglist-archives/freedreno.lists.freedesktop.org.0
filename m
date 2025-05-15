Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A559AB8B6A
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 17:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E2110E8FF;
	Thu, 15 May 2025 15:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiXF5xpl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABF010E903
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:51:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFQeP007929
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=; b=GiXF5xpl7xptwRm4
 pF19Ie4+u9zfT3/0yx/lR+Plg5siSxVxCoZqPYLXYudzC6fan3bDGi21iMkiYH7m
 CDEprpPjdpkkKiMg99Bm6QH8BiCwvolrAl8J+TV8PWsvGY2XXjhXFshGDeFQaNMn
 sSkApNLLbWr3QUtpTLSawzouCafJktmVFIqgViNC9d+zt9gCzoBcJqkACr0AsNQ3
 iLJR8hBv8ydXUoDWnOsFX+C4g1c9VBahqhk2FTKVmPBWmg1MB+MGr1i0f5RIfnRb
 V1Vp/cIR2+okLCUOp2k+hA76l+/wZBfe1kDsmxYynkFYDx1JJVfPMPhuYBAaFJLv
 uTaI/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxq6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:51:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8aab0a94cso1402496d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 08:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324268; x=1747929068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=;
 b=LaKQU6jkF8OHxYIhRmDqwNh/TRNBd8wu/EkmZtuKFc8BDrGrVS/4uSDc4QOwk/JWIZ
 DFes/cytogryaHhxNUvIgl3z0r1wgmLmggHouXCvt6v0p1x10Ml7U8CySc76rPTlQDAx
 pViYw57TkAwnkOHLSYWlkyR3p0iwgVkOBtTQ/JSNd4IUsA0BYuy7/gDxd2EjdseEJ5Ry
 BxHTAE5DcLa0wi31Rkf4ai0X0OCtSG5WPTg1fqLgwoPoxGHZ84m8yv1QwTdKZ6B46KEm
 X3Kem31ZhJ97KNFu3WdJwS+f5K6gb1HKnDwIIeZj8BK512jpls3wluSfw7OVRbgzZDcw
 ABNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXavIFjIRJgw0aV8p/i1ZnVCHmwLq0L266chcVXW3eSURysXVDc3CjTPWZWWsdbWGVyGT8A+SPVM8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywtqgun1WXwLUr8+txjSzas0c4HABIJzLmYgujsHn1N7xGVvsKR
 G00UPXjc0BHxtlExUIfAPEeeb0gUiuwtVu9yMwmGo+9pYA0ANoYF97JzBRZCYNK49wMtD8F9EM9
 RNNG76KV9Oc8Yc2iqz3QKyxQhaJZAMkVvgUz38a8XLKfY1IXKew/0lU7t9cTaU+h3rLkyFk8=
X-Gm-Gg: ASbGncs6KOpmAISVGnFBFf22SJIka5M1r6Ana8Y+39mNDbbU7bu2kB6k8rF5fJZd9mH
 JGkZCU0kGeF59Oqll43OsiUketkHQU7C4Ls/GNqp5i/ZYv8Sz+SSK3kTwJrpTRCgZJCHMTrCInh
 mJDiejBqgnDFd5Wf/SbAHn6gsr6LmjgWrwQZ54knHffFIK5nbHMN3BjPSX1IbLE81xTazAi14vu
 JJED5EctT3AuCJkApfA1doMeW61R0MNHzWBaVWrmkZI4GsVdw1Iu6jD9mumIIto51u4tdhCrOs+
 atazoCdLlh6PJSKIMYjBMjYwwASlM9k7X6wN2egkdgJNRmRZep7zryvXSfCVcKTjxQ==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id
 6a1803df08f44-6f8b08811b3mr1262596d6.5.1747324267817; 
 Thu, 15 May 2025 08:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuP636c4a4W/vTuDcHADRpcLgMarKC0rmzXDUBxsuM0NINQpQHYG/rJHp1KJPbZZsCqr9WEQ==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id
 6a1803df08f44-6f8b08811b3mr1262376d6.5.1747324267436; 
 Thu, 15 May 2025 08:51:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d276592sm7839866b.73.2025.05.15.08.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:51:06 -0700 (PDT)
Message-ID: <d7cf919e-bded-45a1-a352-6b2e659d0197@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
 <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aSsfpuRI03s2yYp-NGUcJMS4ez3wJBU6
X-Proofpoint-ORIG-GUID: aSsfpuRI03s2yYp-NGUcJMS4ez3wJBU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfX78340B3DyXP5
 tp7KoxekPGPx+mfAsQmpXeLuxEMGktwDEbazgDqjJWIpwNAcelJJeUFrVPiMvbctvg0rHecvpHI
 EZZvJyP2jz+g7TiQ2N9sdyFWtmeBU6jrMOUGGPVSbDxQx6oBP7bpvwVVURYuyyFP1tYYdXdgW0D
 pLEeezUhbzFz8N8O9jDKV4+hpzJsJBSmA7UJHc8FaB7VuJ7bShZ/02uyUA6JA1ez2COe9ClzGRk
 5zAcNOONjnXKwSUFY5JRflsXTaq/OeKxh3WHrfymEC9mlZwPw1SiqFvM1BUv4w0BOb1f/iAfZFE
 8StvtRjyd437dWe1z+AFFccmSUSYr/KFms+iS2hFD/XFB0ctSIaUecGtjRDZFgfGoAgpvP1cZFq
 OX243Hkp/NEPNagKkC2UqQh/8FD6kI5FZvTEeNnjWCHgFTPeMXzHe0+b+7iu9OIDqUc/Gu1N
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68260d6c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=zQN7QPYGGEOyCfchBhgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157
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

On 5/14/25 9:19 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> It's only necessary for some lower end parts.
>> Also rename it to min_acc_len_64b to denote that if set, the minimum
>> access length is 64 bits, 32b otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  	if (IS_ERR(gpu->common_ubwc_cfg))
>>  		return -EINVAL;
>>  
>> -	gpu->ubwc_config.min_acc_len = 0;
>>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>>  	gpu->ubwc_config.macrotile_mode = 0;
>>  	gpu->ubwc_config.highest_bank_bit = 15;
> 
> It occurred to me that here (and in some previous patches) you stopped
> setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
> Would you mind updating the patches in this way?
> 
> With that fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I mean.. I could.. but I delete the whole thing couple patches later

Konrad
