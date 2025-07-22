Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC2FB0E5AA
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 23:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06DF10E719;
	Tue, 22 Jul 2025 21:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFU09Jt6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46510E06F
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:41:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTLDP026556
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jjqeRMS/46ph8PMRqSc+j1jHH5fh1ltcyKMQO/fuhWo=; b=EFU09Jt6AD+YRXLL
 pLgqiVq0wEeKhRgF5abY5Z0yiZHrPlHbor7i2DdETV0Z3EXMDY/qc51RT/cEOjvx
 MktNxllr1DW/6HMysgzyNTIYJ+k9kOCUiVeka24JsXhrX/tTvUUlygbRKQhAsM97
 0eW6nYR8woBJK9Kewf2BSSyLHigkdwDiAoLDe5TzznK9szmnksJrskPoFNJXmMnk
 yZoNDUyzXJXDHrskBoAmo3Kk07ePvld60vV92H0XUmXRIb8yiB0CWNU75FM0C5EW
 4ajn/hULaAumpB0Tp2AgpsA+NnvRAr/cx1DeQAXfBlts45kaJlOZLzkxZlrUld09
 69/Ncg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qaydw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:41:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b31f4a9f67cso6752421a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753220469; x=1753825269;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jjqeRMS/46ph8PMRqSc+j1jHH5fh1ltcyKMQO/fuhWo=;
 b=TPCNnFZUyetwZreeFYGPuGavo1fw9FeSmhTeFYMLdpHkk2nx+kp8XpRP/0gAnRh/v1
 hFmCJq509pOvmD8cz0squ6PxdEEuzeW9U5zLgLtk/t5q/P7S5tFQYHMmWy/1pZ65CmeM
 mdEVCYLnElRQiXjMOw+J2dLsv3WFwcnPFwgDz6VpdZPNqiqn7gHkKBHMyPaISo2IFt4I
 xRZfAf6j5bdEoVfJVOSxHxTR7sTzsUJoRuNv/O5QdUqWzhprtjxEeyFZdhXmFZV4+tcU
 gGaZEZW1tGe4ZAJKWKMHsZo0aSLVVh5e9ceqyIhADFJH2QrU6F4pzHjHfkeDn/chjKVr
 FwKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVac7sw4oA5to8vEVtPLObkqRt50kBZ5/qR5kNmx1PlA15CkQg0ZlYe/Bphx1x5dhFMvUln5KhbrsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzPdS++f5EPgTO14rz6fWE16r37RRHXkmHrgtKw4Skm12dh1nS
 H9q/0oTR918Gs3HQ+oeoWHow40+Z1wrynNj7xhBqEn24HtzphwYJaimCQL5Yr/uwGB9u8NrJiMQ
 d7msVI6NFskYG92V15BhzV6dLgayhtCcXFKS+oQ46AtLHbDeWrZQGFdxNrbegTheTQqCnS4x+y0
 9a37o=
X-Gm-Gg: ASbGncsuT1VsAXNYD7SVsW0kLtJwBYECweg21+Hzx80TWM+uyefTiHTCDmPZzlmfavM
 B3MtxlRY0Wc9WF5dc6dR6qOfLkVoPWmRedLDOwi+4EQ+7solqzZH9X7LuYraqxhoqRrJcnf2Ybv
 wWgw0+HbEIo48Y2XlK0Xn2HKvTzq5AjNQmKhzmM2HL3YAi+r/vUsTlImic2VJZyOdHhJ9/wYd75
 5hmnyGqR9yFIuDQ0XiJkLOb4QfqNu5B4LoJdDYgKex3J9UHBFcq1KBuP6YH6T+15GeLxSgoCDIz
 nvZQ/3Hz84yi9NA3JngL5c1+Nn3Z2vzo7edrns/TQBc6AnNMR/AHb2Lg1JHHze+t
X-Received: by 2002:a05:6a20:9148:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-23d4915fb8amr590777637.39.1753220469365; 
 Tue, 22 Jul 2025 14:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAegiXBmz6me1rwnZXHQKFdO1xAzXIAxFFtINhqI1FUmRxyNoREYp9vqjr22X1YmcsF9Ffmg==
X-Received: by 2002:a05:6a20:9148:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-23d4915fb8amr590746637.39.1753220468954; 
 Tue, 22 Jul 2025 14:41:08 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-75ef7510655sm2143552b3a.55.2025.07.22.14.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:41:08 -0700 (PDT)
Message-ID: <02d1fa2a-0faf-44db-a683-53c5a51e09f1@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:11:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NyBTYWx0ZWRfX056b6T1DYi0a
 8vknzRaeGlgKWETt9f0IygdkNM2qX2MSSNBO4O5N3y4MFv8GkSSKsAp9kJ3ColCu2Y/7XThfLG4
 +A1fYLqHp/eM1d08rjkgunp5SHdhY3Q+0MRlCQItqdi6sb/aSnAT6lPjNGPOJ51wOaZCRhAyVJG
 VA+uzlaAjKs2OfJk5pziFVcj103g/mAyt2UK11wQyCZSt7OEG9+fEwICM8Cxwei9sY8oL6XNssm
 /e0Hczu1nvu4gsk0lRF0bM7rnent+nS7BGmYnkJa3EGDRuax4NsInctfhhGommGXGqvPuhTTdoY
 7dWpB9JATR70FaQ5Me4wj03xa63Fwqz5y1QadhpFjv6hTBNFmgt2sPNd6wF7JVd471GeZaNM/U7
 wSrhde4T4sOuOiBp+3E9S7vuyG5O4gAeZcj41hOCO02vTWCciKKII+/cZWQsaoEehab+UYpv
X-Proofpoint-ORIG-GUID: BdLONjiYR0e9_-IRbR67kEgN7juop4vL
X-Proofpoint-GUID: BdLONjiYR0e9_-IRbR67kEgN7juop4vL
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68800576 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wgrHQ5V9N6DtgpC36WEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=614 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220187
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

On 7/22/2025 8:25 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  3 files changed, 78 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>  
>>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>>  
>> +/* Applicable for X185, A750 */
>> +static const u32 a750_ifpc_reglist_regs[] = {
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
>> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
>> +	REG_A6XX_TPL1_NC_MODE_CNTL,
>> +	REG_A6XX_SP_NC_MODE_CNTL,
>> +	REG_A6XX_CP_DBG_ECO_CNTL,
>> +	REG_A6XX_CP_PROTECT_CNTL,
>> +	REG_A6XX_CP_PROTECT(0),
>> +	REG_A6XX_CP_PROTECT(1),
> 
> Is it fair to assume that we'd like to saverestore all CP_PROT
> registers on all SKUs, always? We can save some space in .rodata
> this way..

Yeah. Makes sense, but lets do that when we duplicate it in future.

-Akhil

> 
> Konrad

