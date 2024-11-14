Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C99C8C46
	for <lists+freedreno@lfdr.de>; Thu, 14 Nov 2024 14:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA9D10E2AC;
	Thu, 14 Nov 2024 13:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GghzDWtq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AB410E7F4
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 13:57:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEBJhXp008599
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 13:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r5goF3KV2cIAs2QaOfnwRv9qRBAvGbfSx7o/YGvGW+Y=; b=GghzDWtqvmaAP1j4
 vOufLtvEUGYsuKGXjo0khJzFlWa8OWZEbRzCGfwLcxiNEwmPdz9i6O18u0PmdsCB
 Qg4gsypOsQnXSHk3eNJbpbJfSIsRTKAaMN4GX1KSlxBAvhAAzQGk3oPUdVDi0eKP
 8fnqxwXBLLeMSEVgPYggKUP80cCTkHByZe8M4s30d4HeoJm+iCeSeJm9SsMJK7MH
 v8MvMcjVGohDJ6h9Z5wUOpOv85d7Z76mqB5mylAtsLrJqZ9hQ8ctmVo6ennA6UrG
 iYs04Fe9eOtp25pGgtIRYiQcYxDO6vICtr56lh67TktFw09+0gqDu0HbFIddKAQ4
 tzQV+w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w7ekjvb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 13:57:26 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3e5f4fe6ee9so22700b6e.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 05:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731592645; x=1732197445;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5goF3KV2cIAs2QaOfnwRv9qRBAvGbfSx7o/YGvGW+Y=;
 b=LoyTmFV4kUldvSCtSmC1mWZCekLibxSC5UV+DKn0Okynl5X/uDdtDbwuRF3d2g2LX9
 V23LZe8XErrGWCvP7HNpNIVm3y1nWYMKl87bzGPXUrOtHFZgLbNjqnIiBjeONB+mb7qj
 nCP5yv08GZM/Y7axp1WgpEMwZfwGjbxbVz1kK71Lj4tCq3AGZwSsM6ii/RRYLGZyZLEv
 /ARBB+pmtcIZ0MILkpIegzC5B33IscnnhY2qt5yXXjZPRjh5jQOeu/gKn+GF2jGiW/to
 f0RB+X/di4VioQyF7DejMJS4aYrSCXolKdIgsuMNcnEpN+0My3szhKQpvrUQZiUCgDq2
 6FmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgH6+a4W1B5AvYXfv0iETwMz9CrdkTAclfJwNL8jqLYTecpklmvvfh4qOwF9tBUPR1AZsf+6koWEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweVx76pIi/zvVVkThXKJqVOWiStxnvg8NNuOyi87uJsCwbVlWf
 jT8PEVxjnOT/s5cBi/LwnLUy5C0gmdi4FC0JKT4+FAoD68QH/dYitwRGq4FFp0NDZDEFa5n34NV
 WH/CslH3s7SCmvqbrLE9JRGJeyCATGsahFCpZxKd5ANslTLL20EAk8PtH8NefbgD82R8=
X-Gm-Gg: ASbGnctDR7sO3ZbbptfjWPktqAhLKB1OPUAAKkBQgZJo2Gt3L9PPK9tNWV+BMbtAgCW
 n6Zr7Fa+MfQX3vzrZfq+3VeZ6eYBCsd9MbkuTMRE3OpYbWxCI60FskTOovmUOWyh2Ve9ZReLv8e
 U8OctsO6TsAW3Wd5D0mFnaDegAnAV6jQJvKRDmJBv2HxEHKpzU+/riaZ82YNrD8v54xirbUMBVx
 yufz4+J/rmH05NJbf/6gsgXPpaRavABy8ZjliOjVWfXb6gYhxm3CepA0w760VwKa8GVmJUzuPWR
 lAOrMm1SFIZx+0KDzQEGln7e5i61x+Q=
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id
 46e09a7af769-71a1c2ad1d8mr4817824a34.6.1731592645262; 
 Thu, 14 Nov 2024 05:57:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6WOi/e6VYMuaESWh26yXjsRegZdqLm5bTpJ4NEg8Pa4CgUSOaZkbMvHVfXE3iWkVhZnN9DA==
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id
 46e09a7af769-71a1c2ad1d8mr4817809a34.6.1731592644879; 
 Thu, 14 Nov 2024 05:57:24 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df2649esm66079966b.39.2024.11.14.05.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 05:57:23 -0800 (PST)
Message-ID: <49b50756-bb6d-4863-bf19-f61057d5861d@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V2] drm/msm/a5xx: remove null pointer check on pdev
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112182218.1119158-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: de51vAysOZyXBzly5M7QycfpEPE_F0uV
X-Proofpoint-GUID: de51vAysOZyXBzly5M7QycfpEPE_F0uV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=747 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140109
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

On 12.11.2024 7:22 PM, Colin Ian King wrote:
> The call chain on a5xx_gpu_init is such that pdev is not going to be
> null, so the null check on pdev can be removed. This also cleans up
> a static analysis warning where pdev is dereferenced before the null
> check which cannot actually occur.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
