Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A68C69C04
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 14:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1658310E4C1;
	Tue, 18 Nov 2025 13:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix8yE514";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKCmG6BJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92D410E4C1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 13:57:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIAQosR2926737
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 13:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=; b=Ix8yE514CE4ylJ3o
 Gy2BAVuEO8mDuL6cTd5yKcLWig8ZKEQymgpgWdOTuCgiBDJOEvjTJ66axuvWksz3
 +87pow3Yg/sRpQWG0tsz4OEqAp5kW/F8PmM51axJFvD2PpBoI7g/cUHnh6xHSV8a
 lFuGlYaVoBWLJqASP6dfpMGcF+jTJPlmfDqWbMRsU1RUzZET2HdsMPwD5168tOUd
 Ml8yDrHMApl8TpswPs/kk56kW0y+kFqs7nUtyBBbvlbbB95uXG/Q0U4bfeHnYCoA
 eqJwtjgH5n1RDQYie+YjOgmksRxIZyJ2hop9LSiHvo818c7n4Qc2ih2eYnPZP+y7
 CM3qJQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq290guv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 13:57:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b8ed43cd00so5918727b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763474267; x=1764079067;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=;
 b=KKCmG6BJdULLMdMJmaaPuyN8tU2dnLeOklF3+3g9S5/DQxXYvTVH76DskmQqFe+nQQ
 NjUf2K6vHhQgyiM3KPAV0VJFYRIFm+YFl9J3DBzpmQAMGj80doMxjJW0ugPcxb0ia7/q
 jj6Dfy4ZPiEnPeim0czwIP/io20sylnx47ffop8tmQRxsLEG7F38ejuoHd/nwfB8mpNd
 K/TlBMEHY7iZdtl+bZli1K7PkhKOUiiGTOHjJ4GhEG1cY4DuBM5suD5ZzuN/XmTXMnvX
 ejc1JvnrT1aBH1jHEJVDYNdORYHtg3OsiGqVfrlbRGjHY4yj8gMcvRKsPzwbH2MIAbr5
 aZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763474267; x=1764079067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=;
 b=nnXW4WnhWfelp8PSqLf5khwPmQWkU2sEGj4qOZMsY2bu+miRlyxhYYTP19nvALlNLG
 sIgFQHDmckkpSDoZkL6AWq+z8At9MelIjsEup260r5566PwV129aEhdFyobG+qnT9AVi
 rOZBhULcIPpjYNnnxhNkyfApqk2fWRfNv+Em5fPJDlfsMxf+0ceLzXeAiPbnSWpxktzi
 /xUtLBBR1EDOetP07v9lUe+xViXcgyXts/v1upQdOh2KkZ6DvbWlhByO7BgoEWfX8zww
 vEmWOeTbDWn6rlPgkIs+7AvuWTNq5Rh9/bNmb+LTaZl0aYQKFQFBAtB/4ngHVeaBmCTR
 PGrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViN6idPLC83bs6p/aGYDc0LDSt5O4ML4P154ZYAvYABksQRhlByBwrKR2zbAZpdmkzyug4csWTRDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1/x6Ev6wVqm7aA0HchIV6K/hImWHOD8U5hZOs8lXKJRL3cVkE
 DtWN0wkr0UpGVMtINH1xZcuN+87zIiKPq44qF2SUsfowHDTt1wCRuyrjUWHhDHNbVi5P8YNRXU/
 XDNUsCVqbodO1HgbgnFSBy5CJkpL08/QqHQopw6vpsGq9+reGQtjx4bm40nulXReu7HGWIX4=
X-Gm-Gg: ASbGnctjvPeZg++Ln+aqj0o2gB2TGpq/jvRj/tZuYqaNET1DcZvKANQo6VLE82+9bjD
 SSSafCdM4QCnKp1CIptOHoUL9kIc3yUSgpsyjzIi2S2TAkbwsvzWPA7tAv7ViRGklUMf72++41G
 URhxK92t17MjLaJPtCkTcTfEz7ccToopfUkmqJl5xBuW62Xgnn7T647pHN40rY4vrwujqOSPJ4D
 wa2d591E4Pb1ur+D3yRFzodBd85i2nIoWW34hIdbVpTMdZbbyijw093s8ITHqZxViQQ8DlG0TtH
 oY0voJ3UWPD1BghdeGhDGHnExvDHQNQDWOBg2pFvG1PCUTIQQWi/mKMJRvVASnS9VIKW7oDo0Lc
 XUHfvqUWhE2MyUREN2Q2bSA==
X-Received: by 2002:a05:6a20:4315:b0:34e:4352:6c65 with SMTP id
 adf61e73a8af0-35ba229d49emr17831537637.38.1763474266314; 
 Tue, 18 Nov 2025 05:57:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqQweym02veXOx11FsV5HRruhgX6qp3xUFZXeCsTWnKmjWpJgtrfqH5Z+hC1UT51q4UkoBCg==
X-Received: by 2002:a05:6a20:4315:b0:34e:4352:6c65 with SMTP id
 adf61e73a8af0-35ba229d49emr17831508637.38.1763474265862; 
 Tue, 18 Nov 2025 05:57:45 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b9250d195fsm16600843b3a.18.2025.11.18.05.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:57:45 -0800 (PST)
Message-ID: <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 19:27:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com, jordan@cosmicpenguin.net,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
 marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c7b5b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=73rUxmhrSfcUVL-5kvkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 872qYA46arw9Hdqe3PP8Ku4elXnBFGVB
X-Proofpoint-GUID: 872qYA46arw9Hdqe3PP8Ku4elXnBFGVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMSBTYWx0ZWRfXzVxiPCA80mjI
 Ppu4+b9dyEPnOORXVeydNQYt3IviSSHUUqdI+NtWMWFxPMk+LP/LopY7HzpWY07pVlIlrx45KI8
 3h86SPmOeeKqeP6Gmq3QXMWNgB+A+PSp1O9//BNVZ4ZQPob9S+R4UgkbkPPZKAx/CvcDO3gIX2t
 Wf51em/9B0C6klL0QPYbIWpfj7kTR195cvDEhaoy+BlKPC4YMvdxAVwT4RNf9/Yz9L94NhwVAja
 5troq41AftXd1ek25A3vmzElB3eqPWz0BfGaGJvqKMsCZhxcpKihOLaLIYjJu6f+EdCqUmU2rgK
 DLgWRFq+I8G02qNYdFkAeYpjRc+bEtZw/EtKFGr00UA6Ghr487q3YCmLRUSP2JI5RUz1ON/4hE8
 97dyiDcuY7s8s2ucvghjUcukseqVPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180111
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

On 11/17/2025 6:55 PM, Alok Tiwari wrote:
> Currently, a6xx_show() dereferences state before checking whether it is
> NULL or an error pointer.This can lead to invalid memory access if state
> is invalid.
> 
> Move the IS_ERR_OR_NULL(state) check to the top of the function before
> any use of state.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 4c7f3c642f6a..e408e1d84ade 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		struct drm_printer *p)
>  {
> +	if (IS_ERR_OR_NULL(state))
> +		return;
> +
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu_state *a6xx_state = container_of(state,
>  			struct a6xx_gpu_state, base);

Are you saying that this container_of does a dereference?
I don't think so.

-Akhil.

>  	int i;
>  
> -	if (IS_ERR_OR_NULL(state))
> -		return;
> -
>  	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
>  
>  	adreno_show(gpu, state, p);

