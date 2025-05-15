Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD60AB8B64
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 17:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFED010E8FB;
	Thu, 15 May 2025 15:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8nKleJt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1041510E8F8
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:50:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDt7009069
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=; b=U8nKleJtoiVp0HPr
 Ek0MAMznJhONqXdxdfICIwTA8XT6akalaMuedCzh7N43y+Jc0D4LSl34+JQCJcd8
 xOT7oRbShJqGJZFqgFdJmVC6TxD766q9WehiJVIep+knlDBAlkUCAM5WQcwGXFrh
 ssDo9wjLPYIttGE1EVwU8AOVPgvU/Wr7wBpip+fIEeNKR5T4zWMWBWe/jxvlzmSE
 ilb/eX6at088x+i8uo8LyoyiSbonxTHu8jnwKt6qnQovQhhrrTMgf/ZMHbxtQzMU
 2TRmSSkzJJyVf1efm5N4JoT4vgGrqEoLpR6G14XeI57J/88Nm2lpnjvcPpCdk1GL
 QJuypA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6q7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 15:50:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47983a580dbso2465521cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 08:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324220; x=1747929020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=;
 b=SMaTkyyLvUr4n8YwVpDaCULFwa2KvWhwMBKeU085DpDHMDE1biY4hrayLBm/hr1gnT
 QmHWOhb1cqTJS2Vacim7Ub6TtpIJ8K7N1mxN4zH9sK43kcjv3kLRP7AGPI9UW66iEfKK
 ODwK01AB99wUv3CeEo/fXl6Q53e72i2SJlgkRbarnDF5RS1LPzxCQssVzvArpSALRgnR
 kWA6XzgPgc6aqAxmGRQk4C7G1OcARrjRh0fUWe2/eFPjzth+bGjOCKXU0l0/INACIpOj
 nW/JK3LLuMvduyk4PxfdBEihfgNvvswACcUvT1itNf0hdMU+xUZFmpFcaQEZeJ6dfW0R
 7KTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0+/c06dcjMiviiQW6TTB8nlyYWximPaqD08xBQIRvn5DwucuiL7+exJB4DQl33bKZ+iEwtrsh5x4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAAe3Lu08XnQRh+OzOBahlqYh2mPnqqx/qJlVoMjyWQyD7LOu3
 J1+34KWAMPY65sUI4gARGN/hfWsCMlGsw1Ojwyvefu5/f2EcJMNKd80hGA/Ad9tLmRTBkEEFjVm
 lGr03e9ZXMIjMPDraXFNLz055JVnvMggOd2RCD5H9VB7jIKfxEpSuNNtOdNCp5RoS6kWc832Sdz
 k=
X-Gm-Gg: ASbGnctXKaCGimibkh8iZOme7i4Hr5fGx3fPYYhNtOcYGOJ/SxkrETknJinqcpHQqdN
 s+KgfeWE74pdB5V6lhz1ztisypfonLMm+NGWiZj3O7i+CcB+wDzo0xk61Vbc1wDqZw8Kqui3jMJ
 dWoab7ChYU/D7FbO7CkoS3xX8FrvstzNLq9scSdeewuBIOrMScUNMj7mTZC0gNXdR3KDYhOh20K
 qHvADdm16Ps7+YVDNbXDGK4CU16RTH3xQIvmumId8EYjhQlO0cCgYuDdOlNI+onksDsmzh3lWGi
 Tu1qFs6kwEV0GjKSOaZVo18TebQawMFFljMFU+asEAI0YMohp5nD1x0Tongm3D3E8A==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id
 d75a77b69052e-49495c66538mr38609171cf.6.1747324219739; 
 Thu, 15 May 2025 08:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMUIAEtbW2Lfnl05viWeYgKuGoOg/uXu/bpms5M6DOAK+WjTQWzMp430rphpSK5jRVU7Lf3Q==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id
 d75a77b69052e-49495c66538mr38609041cf.6.1747324219274; 
 Thu, 15 May 2025 08:50:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06cdefsm8041666b.52.2025.05.15.08.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:50:18 -0700 (PDT)
Message-ID: <c1a18f29-440f-44d9-be9c-fac49639ccbd@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
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
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
 <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfX/Bi1wkAw+vs1
 XlyMJqNZLgJREKet5dYHn7Bu8ETr3B06ekvHj4nzmNU7JGMZWwj3j333QOvCDhexrXd7WrLWZqA
 Wr2LrfqMJBn474n7R2SQd1rqYwRIEWkOEVMCxjHGbU6jrwe0d4hweTkfXsuQw8XPkhD3T/j7JBW
 E8ajsC0t3w1C9Qh8x4V9vUoxkSO2AwhDJY5Oe1GfdMK08mxTYjCBJ53iVcoRnlGxhg12knyERS6
 jCxpbaBI1+RlkVapQwpdVsHGSDcF/ZGspmuIPSPAfcJugzY3hFbiWDGp66hei0iRAGB8aZhtn/P
 XSGm4NEkuL2DcUhQry/T/IgWCU01rhzcHQB12VY27svXDw0DmJ2bHqDx6BvlpQ8szJiAzH6icnM
 K9gDeGY3UtfpqeTNF+aInjHWFJpWLxkiDwWrW3uHG9oOJ2FzXUdMFGUXPW+z70xrlx5tc2qc
X-Proofpoint-ORIG-GUID: pFs9D_t21x_Di6OL2bPdUXRWAahC0ArO
X-Proofpoint-GUID: pFs9D_t21x_Di6OL2bPdUXRWAahC0ArO
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260d3d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jzhEuBAUjWbXnsiB1ZYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150157
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

On 5/14/25 9:03 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:21PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/Kconfig       |   8 ++
>>  drivers/soc/qcom/Makefile      |   1 +
>>  drivers/soc/qcom/ubwc_config.c | 235 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/soc/qcom/ubwc.h  |  67 ++++++++++++
>>  4 files changed, 311 insertions(+)
>>
> 
> With the SAR2130P fixed
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
>> +
>> +	/**
>> +	 * @highest_bank_bit: Highest Bank Bit
>> +	 *
>> +	 * The Highest Bank Bit value represents the bit of the highest
>> +	 * DDR bank.  This should ideally use DRAM type detection.
>> +	 */
>> +	int highest_bank_bit;
>> +	bool ubwc_bank_spread;
> 
> Nit: any documentation for this one?

Not even documentation seems to acknowledge that bit's existence

Konrad
