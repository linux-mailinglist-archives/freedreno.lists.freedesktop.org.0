Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB0A49AD0
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 14:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566BA10ECAA;
	Fri, 28 Feb 2025 13:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D74YUx0M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2566610ECA9
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXLwO010891
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uK7XPFL9iClFWAeim23sLhZiHmmfyDn3gazcoBk2iEs=; b=D74YUx0MGKkLqrsn
 plW6U5fatD9Sbz8W3JEK8uNcX54S7V0YQiMTX8G5pMmVi4cCd16z0b609MWeZ00P
 3nezOn4EIrtoBkaLJD+2lBYeMYUqLneevM8qHRGU0sz6hWrmuiFKZL6YFRWtC5T8
 YrLI6phohOguy3bQjB6jKTafAteWHSzJagG477EWpD/vHNRncNS1ic50tTLlLzYA
 2mkOPSxvXHT1nryaD/b7qjfKeCxwCrlXVyIvHvr91xVjNXJMfWLgBDMseP9OkT1N
 OKjvpxlMMKlTSUb5XYqBeB7wwv4xfudSRUKvETzBmSdTK5cmNMnomkbot0YzKQ8f
 bBwxYA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnsh0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8a0dba34eso2169686d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 05:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750208; x=1741355008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uK7XPFL9iClFWAeim23sLhZiHmmfyDn3gazcoBk2iEs=;
 b=cYSX0/RuIrtTNlP28eZG59CigAl1OCl4raEi/C28Kcci6m/3IIoC8iVWGn7Hhft1LC
 5ULvDGe8ZXwmlwbGqrYY9bUIpcwzATRyMF0cEeIIkwZ018OpvjbTdd5rxjI1cOW8t7Hi
 iy/30LVMDPd5n9hnFZbrm6nUhTjSLANX7c4Cdx1B14VwVVlf8Ym6b36vJMUxxVhye7f6
 Hfh2+xDGxDP6Packo0V55PFvffnSedXWWD0GMFAPLMfsPqqLZi3C+68Mcl6JtxYyIWXi
 cvAiYaZ8qx6Hvb2OTJiHMoQl9hlH9U0K0ADLZMV4f2Fubl9qaptIeBWnyG2jsc1w0Eet
 rJhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH74qUMBC4t5qkBJchFIgdkM9D3mq0gGwRGLxjYhwm9W/vrCpHE7yGe4qN9svQIcrk+j62KNcbX7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk3cTAnouMQ1Bnr+LdNXRwDlYic5TL2LeBPgB1a1Db4CShakiJ
 sj+7s9ZWAEQB8Rlwc0dYynXgxnfj3IeIN7ceEkQ24hBKtTRqy6o8p4/IECiiHGgEDSr7QvTx7yP
 V1MnbOx8d553U1ayU/G+AlOl1FPXF2AzBuRL6C29DpI9Yi8TLXazNGtHyqy/P/WQjjtU=
X-Gm-Gg: ASbGncsPd0sNsYM2S+9xhBAb8UHYjaL5279zIq91yuehvwum0PUbMoYb0cqdYWTIaJ6
 T1vhf3E5UW9l11DknhXhT7OkQ6K1qL1CgQ1F/ExrjDG+rgKsL/W96GXrE12a3lXsEdIjY/MgcP0
 r2PQE/WUuFtgNt9Mm31glLu7LcIJ9TgW6kGEkJUbmYV4ACqIM3XnY0l90QfadjbpuH7vOn24pyT
 5Z4t6ubqfL47PCTpPOF4fgnAQBfnAxUfcLQIRFwyc3GyJHJ3zPc70foHXAHk1+8PfQ1sX6UBH1c
 FODc9mkQRo95qL2RlE+SdUNhE8f4BlzUQCsvZodaCHDsgOjg6fabI7R2PBQIyHH90fLjVw==
X-Received: by 2002:ad4:4eeb:0:b0:6e8:9c91:227a with SMTP id
 6a1803df08f44-6e8a0acfacdmr20127786d6.0.1740750208441; 
 Fri, 28 Feb 2025 05:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6LsgtGwg0dHHSjda+X6QBa3Lh1LM3XCxwbSPqdc++bbG/PxqnrKamtHXvnvNs9sSIfeIs0Q==
X-Received: by 2002:ad4:4eeb:0:b0:6e8:9c91:227a with SMTP id
 6a1803df08f44-6e8a0acfacdmr20127616d6.0.1740750208096; 
 Fri, 28 Feb 2025 05:43:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0dd6ccsm294572366b.57.2025.02.28.05.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:43:27 -0800 (PST)
Message-ID: <aca6056f-cb53-4879-81b8-3d9f0913c571@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-3-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-3-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rk2GZ6WYhFlH9A9_ptBTduVpFGxDq-Oy
X-Proofpoint-ORIG-GUID: rk2GZ6WYhFlH9A9_ptBTduVpFGxDq-Oy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=995 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
