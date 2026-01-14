Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F7D1CB07
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 07:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E6510E1C0;
	Wed, 14 Jan 2026 06:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7MCmfJ6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jg09HAZB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB77710E31A
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 06:37:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E6680M2138903
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=; b=P7MCmfJ6SjTJn5WA
 S+Ivy2xD7sKNHJkxILSng+KfJQrOT3sOR0vk7rxx/c8eNiv2IgNKrkFQ2vTN6Wnw
 CR9z7nHplebMmdjNOrsA5rqhAUxv7BSp8IN3bB650qa+8B6B99B3QiavNcbeb1V8
 qX9TtiST1LvPD8nVDVVBK8gMwhUfbWzvq5r/F0Mx4Q7YckEIb5Xg1FHFab03vi+F
 YcO4vUWqPozCV25NSIgsVyIARdSkqzjpX3Ckp7xp9mmBECiuZBuY+A6BdOHrkKY5
 2Sgm8bwsI2Gqg3VLQK+HMrPrOujeqLnmPr3c65SZW1uDO8rwlpB75UxIagre0G2s
 FJs8UQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0duqun-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 06:37:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a0e9e0fd49so6014585ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 22:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768372648; x=1768977448;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=;
 b=jg09HAZBLkCXwjOVCcHB5CDBEKMa1xHp3OKK9Z/YfAG6QFvrdNJ2+iyUm7Yv0Y/XIT
 Qhx8+Awfv8NkEoGJTcE51onUETUM8prtXDNfk1uCzlKOwk8ED0VDdeTSiUQUbuQrmtkX
 +hWyFATZIGW5vqs/FbbciYDBTJxuees90G0NLsIZhWpA1s/vutbD0X4CNsxYyE/WCyIj
 LwG4FEaxXWQGb9d3F0ABSGDqotp7hg2sGZ7gbEV5u9MBPpfpRU79exLn+A4JKT8UY26R
 ny5thy+XblEW2v5YwkPD9k1moD031PsQNzutqxh4F9JRtm+39lirXn5AhR4S8mAOfKmN
 6ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768372648; x=1768977448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=;
 b=vIDsOygPs7I72cjL+DhvnJ6T8XNjLtleIIuxMg0jzqJrueJM7B74nBoTqEQ9nL3+wt
 VDNrTrz6hQiRfTlnXk67Oj/eG+pwkoMd6FN2hvEA0nt+nhZ5WrrjzwJ2QsRTkRYXV7vN
 sJVAna2JDMsEyuGdERaiVniVtG7Pp++jwdMk+7eKca7TeRWTWjpaV41BnNd5dCUR07W5
 xvxcPOEyNmFjXjaLCFu19GsyRQw/QtVIrIy3WlZK31qDVzsjvvUzb5CQwG8OCHncqIGk
 AC4l7VJn7IGUQT716mW5HrOuwkXVFCK2qunL6aAuRv53X7HPhC/HnCj6l79k4Hw0MZkT
 hqxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU83fODPKyi9ebMcNITeG3+z/VODwCZlK7jdmAiryWTXKubtn8ChsiKlnKDfIYjgVWJAdUQDHtHJzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWZ/nsPP2bQdDHrGGvRvareQDc06G8NXZSkk4EaIAPSGfGtXXM
 IUsecyhGsAqvVe6Kx9wJ7mgdHxNZ8hxYiFzBUndWU0tMDvm7EP/bY738AcXzKt0e9xWUWrqC/jP
 WQGUaM7bKnV/5/nXiBdAbK9lOeoL0nFdLxs5DviyzN1IihKPwwGZrVuaCFJqJlU+W9ZJO6fA=
X-Gm-Gg: AY/fxX423cJ6Emfg9H24tThNkZ/HCJhtrtyz6nL4A9T9fC3BlLJAu3b3Yz6V1k5U06U
 YC8BldeC8pzufYmJlTRh9eoJbL+Nt5UtYEOIUp/BWBdhxpxaJ/hTEPFw7xjFkNfcaFwCG/GWFij
 CfWaxZ9JyTfBpOKaZ9IZyOQW6xWRjkXIyela4Y49/S/6AyqtwIkpDulis7SisCsAqLQ27PW2oWv
 nKiWTZt0zS4CaecjX8Wvagb+mMoooJqx1vu04+YeMjI38YDLEfmlCB+Xn6ia/XfXwkfvnOUlezX
 O7TyajdgcS0HELcGPm71AcizVG4FLQu8/RLA8HryxCQCS+pZWjGnqfKDYnzJ1V3W+DUtnPKl9uU
 6iuOtT3e+Og6p6MF72wTtKUt0xMgF87vdqA==
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id
 d9443c01a7336-2a599dac241mr16267605ad.13.1768372647626; 
 Tue, 13 Jan 2026 22:37:27 -0800 (PST)
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id
 d9443c01a7336-2a599dac241mr16267315ad.13.1768372647065; 
 Tue, 13 Jan 2026 22:37:27 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.124])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2b72sm218575885ad.51.2026.01.13.22.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 22:37:26 -0800 (PST)
Message-ID: <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:07:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=696739a8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZIcQe8sNaMnfUD2ODhXWYw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=9eDHubkGBslCoLSAWpMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZPsUJSkhpv7LGq8HeiIbHwANPIp7skog
X-Proofpoint-GUID: ZPsUJSkhpv7LGq8HeiIbHwANPIp7skog
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0OSBTYWx0ZWRfX9+PQre5H0a0M
 fWe7n4TwqK9O/UET2Hzjr7ICuv+1yJbHPil3WV+X82GSdXe25ToLadbMkPazgld1NCS/47heS3/
 RbKHV2+it2p2WU7c7jkvq7eIubSnm/5gb+v7G0MzE3mC/sltx0rvD0gb4wTYITxUXtyDe3Ugetc
 LBa5RR/CUGuSIX+Zo/FhZsbEmP8fOyfLZGBlVF2y5wNihGKICI6audliPI+z1f+0AVx8SJWr0Qm
 q0YHr+kUaK9DBvBC4jQ2s9zukFa4cC4T5oC4wvFmUKOmsxMrs/BELEUExlsMJZnegPEdNZV4HMI
 TBcLAIEzXMrnPE74c8gjw3B4eSWGY3QzPnDFRiE6ZsN9OghE6d/wP3hb9gT3INkNs4Gq6nrgp5E
 T7Qv5zEpRlwygZaJnFv/UH5HJSltDIXakLYizvagPAfAxRvou9LJvskysW49d2nH+W9tmqnTtai
 polzEQimpF7Pw5m31/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140049
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

On 10/22/2025 6:14 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> In order to fix this state and allow the GMU to be properly
> probed, let's add a proper driver for the GMU and add it to
> the MSM driver components.
> 
> Only the proper GMU has been tested since I don't have
> access to hardware with a GMU wrapper.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>  drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>  6 files changed, 192 insertions(+), 195 deletions(-)
> 

Niel,

Could you please send the follow up revision of this patch? Lets get
this fix merged.

-Akhil.

