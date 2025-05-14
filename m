Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0FAB765F
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 22:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA78310E707;
	Wed, 14 May 2025 20:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlQB81u8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30DD10E709
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:05:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuewp020099
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0egVoFkhlIxFKQgj4/+4xdNBa7NE99qByFd27WH7Qxo=; b=HlQB81u8h3vfpQmH
 R9pszwc7o4iKCVaVpcpI38BXSXqt6kwCoV4Wsg3RyRMEDG6bGjS5Uzu+YS5eAZWj
 7zYkZK21ZEgZtorGzNtx6/oFF7fvYbwXEW2qf+Dsb9YKi/U7keU9FEOq1yvwXKq4
 Zd7aN3KTNpFd349J8xd5VqCKFltdFetEHwAslQL6bqLRB9nOx/gGMfg+sPh6Ypuf
 olboXxZJTDBUjGUhCDTFlzIPBga3FwrDy33Fa3ho7ps1X9ChqjMV+u6VpPyQmalA
 j5yuckZY+6l4YzTb3ImkYWt/dHVohlpZBgV8EJYN0Xc+VHg+bTvyvyqSj3p8QZ7Z
 f14Kmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnkwuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:05:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c76062c513so2539985a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 13:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747253140; x=1747857940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0egVoFkhlIxFKQgj4/+4xdNBa7NE99qByFd27WH7Qxo=;
 b=IM79J6HPRwVROhyHuBGWo70CpEfWy8bOxImqscjSO9G0F7NspiSMInDOuqagSfod3q
 u5LQ3I5X23eYNLFIz3zTbsB1KTEIrNXcFwjNlApdxSseW8LwFz0Dt+2u7i10Tsy7HL6t
 h/agnIknfhYa6TAoTgzZtJmZRyTct3l7hOQwI5/IxEzFdgx1W5lMOUUXDCJBeDnJawKr
 p2VGX4UoffvISyAZBIId3t2kE2EJcdg0/OrKIbnBx58rDdFYHZo78be9MNl4SCk4Hihs
 RZ9RubsLtla9jys4sazcuPRaOnc6inQY3B7DJtQzvVMZuFoUFfQgDpoog4wRh+MSMZOP
 O7Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpOgRVWzkPmjxBSfMNtqpbGmRJNr8ahPd2jEMHDEZfoCAmIvZjIDzhFdrwUZqHPCVFeKmbOF/OWNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygtAZyROkIGmtdYfVndu2dJ92jpscVTFbIUAUF+YO7P9OH7Vov
 MMKBr52oGRIDuP79W9dWWA73xoA3z3fbK0k/N2sum4EYi5n3ZPnKaUelh7JwYeStPOYOEwZNz85
 D6iX+1yar6KKEOBJ82UERhYO812ZyCjtMshzy633dH8k3cwjWT0wEJOO+XuWD6BJkqnM=
X-Gm-Gg: ASbGncsACCELbxX4bryUP80oxZP05hR6+J4+3wwnc2d+dEJuY+af+ejC6Ubef0HEKh1
 6DNK2fZIeEIMIm7yiKuqvr7ooDGYxhFo0DmDCXUauSU+pEUTSOwbro8HAwsRbK8uA62tUDCxEzt
 mMoIghwmvvBkAViMeyZkXz/3P054vWSAq14XNajwXrtfdUdRIzmk1mygyUH2eT3kYyNpz5oZTV5
 Vm77OsbCPPP/3pkVuY/hE35dlrofhAtqYq6kiDh7hbSO18y+i85FQmkzjxD401ywJdS9UWji9rb
 oBv99TmthhJdNuh09G55m3dYHE7qjnD/A+yySQSnII05YDDRJ36asU6PCXpheBH4Gw==
X-Received: by 2002:a05:620a:2781:b0:7c0:b43c:b36c with SMTP id
 af79cd13be357-7cd287e172cmr305029485a.6.1747253139877; 
 Wed, 14 May 2025 13:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf8UD3BUMMgFpbToJEXmlzYBN1m9L8+A/f6qEFMV/uyiI1zpi1wE/usnt5J2H9YM2otSN8gg==
X-Received: by 2002:a05:620a:2781:b0:7c0:b43c:b36c with SMTP id
 af79cd13be357-7cd287e172cmr305026385a.6.1747253139440; 
 Wed, 14 May 2025 13:05:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc526b2sm9665865a12.47.2025.05.14.13.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 13:05:38 -0700 (PDT)
Message-ID: <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
Date: Wed, 14 May 2025 22:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
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
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yx7fBEOR-uI3BBSrTHz0a0W6_gXsHxgW
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824f794 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=q9V0nb-VcvmKcQyn-R0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Yx7fBEOR-uI3BBSrTHz0a0W6_gXsHxgW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4NCBTYWx0ZWRfX864DdwT2l9vL
 LbI0FFS1+sUF5vAYVBur6cidh2xCgGkDU6tE/oVv09WpfCxhbrMG6/GuMy4izvbGnJYdDiSXE0R
 S584iFrnvXdCpZ/b006zqXT5iDSyoup2SbRr+nCesOEmHEIYl8udh+mEI3tKzoWj23oEkNzVIVk
 dBAyp3UsrgxVl8GbG19JVWTD7hmf2vzsgRUIUCPALrIlj/ogEKMu/fwNL4RGu62V6Kd8U25nb0R
 AHfoVaEqN72Q4+U3mx79K76toncnycRLcsO95whVi/rGdKRV7hG4uBNUhscgzZco4pd3HHXiKMm
 qnepKEo5j478GYIVe1+cLxnoclrOfWJm15Ag8CDsF3Phf1/I1auVR7PYYTj9aBbAVbaGhVvQCNK
 lqpQV+R7bvITyRbkxX3mTcWB236h9sOOcJYAb6idoK8KKehX/9rLYoWAb/AJ6Eg75XBExKOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140184
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

On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>> swizzling) is what we want on this platform (and others with a UBWC
>> 1.0 encoder).
>>
>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>> bits, as they weren't consumed on this platform).
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ubwc_config.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>> --- a/drivers/soc/qcom/ubwc_config.c
>> +++ b/drivers/soc/qcom/ubwc_config.c
>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>  static const struct qcom_ubwc_cfg_data sm6125_data = {
>>  	.ubwc_enc_version = UBWC_1_0,
>>  	.ubwc_dec_version = UBWC_3_0,
>> -	.ubwc_swizzle = 1,
>> +	.ubwc_swizzle = 7,
>>  	.highest_bank_bit = 14,
>>  };
> 
> Add a comment and squash into the patch 1.

I don't think that's a good idea, plus this series should be merged
together anyway

Konrad
