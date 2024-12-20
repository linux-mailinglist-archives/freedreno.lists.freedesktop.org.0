Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B59F9AC0
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 20:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806F610E3B7;
	Fri, 20 Dec 2024 19:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztzmoup6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AD610E2D0
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 19:56:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKCiiQe013155
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 19:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CNXi4HVvLwEnmfialNLMEUNaS0/KanL2j5mXVBCUz9w=; b=Ztzmoup6WnqTqnor
 ZvTDquigCZfl6PsIl8o3iovgSU5l7uML8oTAwRdOyJIb19Qlfri4RWhBWWYp5NXC
 ueOW43cV6jMTdDL22Ui3vDelmCgnIV/tezNcrFrNOwscRKkTO1+E6lXeiKX8DiKn
 qmIvE9aVpMjWWdhIT3buxPVTpfm1mTQo5W2uwGWhggCwU/OXEPT0SymWT23ESUYo
 BzeHj6p5vwbPYI5gTWgyV/F46xJSvKcQdB4rCvNOJzDqsutJxXuozK8lLRA8rLKr
 0RlzEJ666DNkpFKSBxdtCjNOLZfPvsiaDQGK1s3GQwZQreORLPhUkXDMKoP2YAf8
 5/lbkA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n8uvh3x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 19:56:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d8eda4d80aso3534126d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 11:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734724595; x=1735329395;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CNXi4HVvLwEnmfialNLMEUNaS0/KanL2j5mXVBCUz9w=;
 b=uy0YNNGmBqkTZ7c004SvXzedPr2AErU+wAW3VbtAGlVl1x85kw098PtoGY72grWR6P
 l3+eFA6RrRCPflUk9HnB59hYaVrAKc49gxipP5GYfcIfvmfyya0pib7NIjhC0YJ/CCGH
 3BsRecES0ypb1A7FBrJBc4A3nQTMBsdeRiVUHo5SA5AYKA3y72htD4URrcoS6tqPg2Um
 Ff1ZKFFI/Yo32LXuo5DV1Hcdec8jMl7EaGPgDCiJwfyPlG2xwcjIRM7y/XU5kR/XYpja
 q/7Iwd759ULJ0t+WuJmK6/JX+VEj3pAd1OX6rJoLC+y2VVv4rN8D5VxaFUoBMaPD/LWQ
 HnZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvtvOIzKNH32YcNbGvJIlG8W/7UmIg7kbb9b8RCrfiRJX0btz79MGAXyhiN/3z6cqRXrr40r7wpF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZgVD8RWasdjTUKBh/8BuErsX2hhx2JAMKCbPCzlnkwiZa3+q+
 N1+pnqfx9wfMtQj/cKI9PU/aTTe67f3hZ/eEyw+5sw4FY4GGwY5VIgRZ4lLfubzMRret3xNQTTT
 XcNnd4kTQJadN+LgyDY/8nPwcxGBLhQIhem2/Btnk3/EWAqz+o5hsxJAPtQAEpc+lffQ=
X-Gm-Gg: ASbGnctWYehm3osV7xGS/Swi8wMBCJLhRXdliK2xgJR3JLkRUcEUnY1fSGRY9ydiw+7
 dlPwDSQmP1HaUd/HXopvcQnigrjA+fA15uEHNyc5DgWyzVsO77wsTUJEhpcPQZ7up+OSjIDVm1P
 2BPIJB7+8jMa+aJMio7yz/0C9eeGjrjRy1cjA0vQOPsUJXtb1H0MoOon4mJCnYTYGkXDh1cHNFx
 IYgFRECmZX/kHsrv8eZvr5nYL4MAcEI9u86kqUhHot6VZ5xL9/qE/lkjhaZUyvN13vsHmNbCasj
 fMophk6i7nsmuH+ngq50F2O34uvi5fJDecQ=
X-Received: by 2002:ad4:5de1:0:b0:6d8:e634:203a with SMTP id
 6a1803df08f44-6dd23327990mr24024346d6.4.1734724594915; 
 Fri, 20 Dec 2024 11:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6O7L0eT7hcle0d+mEEQSfXKZLRu3gm/NoMZrAmdKcF5OuBOOm4hLGodWNUXrXW8QaaUU7+g==
X-Received: by 2002:ad4:5de1:0:b0:6d8:e634:203a with SMTP id
 6a1803df08f44-6dd23327990mr24024226d6.4.1734724594596; 
 Fri, 20 Dec 2024 11:56:34 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe4653sm210771066b.122.2024.12.20.11.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 11:56:34 -0800 (PST)
Message-ID: <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 20:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aKmkWSA1TNUqnuwGnVjLVKi_L_AesXbX
X-Proofpoint-ORIG-GUID: aKmkWSA1TNUqnuwGnVjLVKi_L_AesXbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200161
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

On 13.12.2024 12:46 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> Since there is no benefit with enabling RGMU at the moment, RGMU is
> entirely skipped in this patch.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

So we talked offline a bit, and the RGMU requires a piece of firmware.

We concluded it's best to describe that from the get-go, so that the
user doesn't get surprised when a new kernel update brings new firmware
requirements for previously-working hardware.

Please wait for the new revision.

Konrad
