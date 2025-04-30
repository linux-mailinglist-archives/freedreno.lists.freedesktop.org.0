Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3308CAA4B56
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 14:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E403510E75E;
	Wed, 30 Apr 2025 12:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCOo2aW/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FD910E75E
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 12:35:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U90v1E004143
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 12:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=; b=kCOo2aW/dNR4HZBi
 hTvCsRcyGXI6Sr5fc1x0GWYvFjc6V9Lq1WrSbyvVXEAapiPIGUqnXXq/Eneyuds/
 eMmWZvRyBYy7LH6j760UO+GOoWz7Ab76FhnNgd9hfZiKGT/EmUqy2/A+B1GxZkbD
 oLmAVhlvc1COl6Sd7pBlGZI89TgZ1fpax5qbsPgvdi5viqcmMLugbxWBgQSBiYRA
 uBfAg2trRUMJ1ISyL0mbv0s71nUP8F0BtGgvTISxIBaTqIE/BrhnQa/hAnXVBjg7
 BImfF0zodWtqi82nB3kQbmOe+b97rBBh5RtJKXPxdUG71gIDeY9mqGq0SFfdu87b
 QevxqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8a5pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 12:35:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-476783cbdb8so15675221cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 05:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746016522; x=1746621322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=;
 b=qFD/+3L0lYmSxoq64u6+1buIXP/knTFPN3AT02Uuxaj+5cPFLdA4dEDCNuPgd6WYgh
 qNHi73+t5kV9tXPAPkH45MbNKMZ+LH+jrEZ93ISP1neArS1ZdtskuG95pH3yhW0gUYCc
 Qdg5sC6yeaQ5N2NrBO6JFuqWYn9e6AVRaBFatxwc/fwh/ZIV/vQLiReEvalGpMv8+P5l
 AQemaXWYkKljwnjyIxYaEjQPCkCpyVxoP/A4tMzXfbo0JjDFChd5d3+NyE10sCVtERAf
 blVFGicWzTZa0T5mJ1pjMXNTCtNyOZGk+H+n5htpReA8S2kxeBaEZjRQPShHQ/zPPIv2
 reuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNyHAURIRL8ZkBJPAETVg/rntw0dP1GdxyORTNGjBFpk6bthKfx4BUfSKUX+nZkk+FUl9acnjMzuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKowoPK8ksD1PhvZw3im11Z6wzpecJI06ZjsYbOCc/4fBEt72H
 nVitYCFd4/Rc3mfhn/VvKzJB6nfYsV28Fe41y3+IetbOy+tB+FxQpXwJi2w3BPs0Cyq7rxIjlPR
 azQhGf6/lzn8iR1ly5z2CKINkI3PlIrLfJNlmVL59sY2KNAJA9tcsps1swodjgEt1lLQ=
X-Gm-Gg: ASbGncshstwIRzBq3CbGoDQ9LIGTWM6Frm4pDWqeQnBG2P8afOzlV+pmDG7TcNMx4e1
 MBnP3PN9wiEwq+IeRJWA2pzxKEmkpsI49+L+RYkmfC7ltVd2/HtIHKzPQm266rOezTCm4I2AOyI
 JRfqkyjwC/ap92OmvTCGPqLKvNQUtA6JIUH5ANkY+CpB480sVZYWuAw20N6+byKRkhgwpGTxBq+
 D1qvm8shJtxlV9GAEAABx/11VUm98lRUS7lAS+k2+8KQfYZMz78HY/cP6bAtVKNScokw79LX3rP
 e1ZlMJRuh++ej9mVqRdmgYAQkT9HipaOLqTf8RRqjrfiGx6mMrfg7DuySE93tmPjBL0=
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cac85a0299mr123371285a.8.1746016521550; 
 Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5YnBbAS+ImgEHeNjfO53rm94FOWqBYpnXyEX6Ie1ldv17RmYfaWc5AhrZsf2uYwjVaJF4eg==
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cac85a0299mr123368385a.8.1746016521141; 
 Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edae042sm913931766b.169.2025.04.30.05.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 05:35:20 -0700 (PDT)
Message-ID: <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6812191e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=_6aSloehX7qqCDj74gYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: f-6AxxR4JwJ9EMClUOp72G7ZzEBeDxe6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MCBTYWx0ZWRfX+pp5caWSRx6s
 WWXz57cae477w3lqxOc3DPgWMd2jV8oQ24Dyjte75yllsMG4XcZX60/5sBPAxuH0W0szPbj3ein
 RZG3rLBYofulkufZyUkzBEPx+lMSRRWLEWZgwYaaRMq/HbB573DgiqI++WlpgBZWygU1om4SlYn
 z/eo54sCHeUwSORyHmJLK3PZfGUftMA2Oi9jw3aFpqNNqf4sZM3nbOMH5yqWhhIiUQmWZhPbGSH
 2Hcpgu7keO27g8EM9WgXEj0k6B/jfYCD9qRNLusiGHMx7ywI+VK6rIrIRKcHXkl6xn8edU+I6kV
 Mv0JdlUNwJaIJadauOaAGgL/6qygu9CC4Cb/aK5kHXpVwJ+rhZyPRIaOJ1ZPHeVxo+ha/h61fXj
 oYB/bQxpZjCZUwPfbf4xRB9HXAhG8Wu6i2v8ihs/LNQsgJ+qclTRPjGBYsTW1FgJW8+3BcGV
X-Proofpoint-ORIG-GUID: f-6AxxR4JwJ9EMClUOp72G7ZzEBeDxe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300090
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

On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>> should be speedbin 1", but what the values are for said "everything" are
>> not known, so that's an exercise left to the user..
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -11,6 +11,9 @@
>>   #include "a6xx.xml.h"
>>   #include "a6xx_gmu.xml.h"
>>   +#include <linux/soc/qcom/smem.h>
>> +#include <linux/soc/qcom/socinfo.h>
>> +
>>   static const struct adreno_reglist a612_hwcg[] = {
>>       {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>       {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>           },
>>           .address_space_size = SZ_16G,
>>           .preempt_record_size = 4192 * SZ_1K,
>> +        .speedbins = ADRENO_SPEEDBINS(
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
> 
> I'm trying to understand this sentence. because reading patch 4, when there's no match
> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?

What I'm saying is that all other entries that happen to be possibly
added down the line are expected to be speedbin 1 (i.e. BIT(1))

> Before this change the fallback was speedbin = BIT(0), but this disappeared.

No, the default was to allow speedbin mask ~(0U)

Konrad
