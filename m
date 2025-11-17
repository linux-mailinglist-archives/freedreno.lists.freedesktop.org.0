Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F25C64C6A
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 16:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5973C10E3B8;
	Mon, 17 Nov 2025 15:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rxr5i0oi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdfWwGuN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92010E3B8
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 15:02:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHAprOk3920995
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 15:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2ef1fLkfHBFXiSME/ii8xpkgp4NebP/rTeWyzU9gVLk=; b=Rxr5i0oirw1zAggV
 Exsm9UtDszwgt4OytMP/A138pIOZHoSLVbNvWFjLw0AC2Jh0IjxibjboFo2dICbj
 m3wg4hByNUpbBfr/Lae7/q/vCYSYVjVYDk3HSzcmQhAm0EdNUbZj5Z3EprZaSUfO
 V6qAWlKbe2lScqp/1N6hGPirg/XGixrVxtvCvniMeiy/rvWujvJK9soodiL8OnnF
 daKfH/gOVkf5hu+pK0Txnm2RYW3pCyx3z2maC8qXfKvoTf6cmz+8W8AuXb/3KjXC
 kljcfqGaQPDShqn4P3OwdW1xjRHT7OWrNy+9CeGUXgDSnLSVIvgGON9g+s/meWq7
 PUqNwA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay8pnm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 15:02:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5dfa4d7ed54so453090137.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763391751; x=1763996551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ef1fLkfHBFXiSME/ii8xpkgp4NebP/rTeWyzU9gVLk=;
 b=CdfWwGuNYgCyOehXtJ6IqUHankKCSUBqUl6SDqicx9JVBZsnNp5GwkFlo0aZKBCxxF
 3aXUvknFbITzDZGRznS0eJLYW455d2K/ASFeTWlWcNNmpajZrc+3ZW+5ka12bWgpYs5N
 LjjKGM/AOusnf8KpB/4K28/Cn/lQctCwwYL3wmQDbAPkANLvFpgRyHL5rDvb2OXnrer1
 3xs0qsFUriGNjNPmZ9qw6gRLsSlGW3xARWnTQ09V66+SZXSYhetnaEkDgH+2FmFpS9vJ
 o9KOhSFX408c2Nj3m+ZpGEmIeJFzsYA/GygDXZlY4e7Usmw36vCJTROaRIP3lZeiqTxH
 7c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763391751; x=1763996551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ef1fLkfHBFXiSME/ii8xpkgp4NebP/rTeWyzU9gVLk=;
 b=oU5I20/7yjBFnBUJUs3grlDOm/l5CUD7AYFOr8JpgfZVsjBxX2hCFCqb5yAOq8t8An
 l2yKma7maKsEyRcz53w4/j8Si9hNaIrCcobVK9LHgyL5zb2tpR2Q7VqGKilE5W45fMSg
 CmvbeYndCHQK0tpfiNMU7aMq4WAJT1HJh7hfeG/KI2qci4bzEoUt+ZsLUXY99dNY3a1D
 em+aNBO+u8zvjSjDoCC3rlQ4QoKpRQJ2RwsVUq4eL+NH+cDlD2TAz/P34t18WHv5seM5
 JTyJeVq82fGNZmWSVz4ki6ys7kIbK44ZK6KYUnOHKSHP43nVultSm6D7M45hBp+CLVwR
 S/Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFTdhbBjQLeT0TlSrFoA5qJYVFQYCwvSOuq9f+ucfv46nuN1u76Ou42dlVhmlcFbtFPXKXomR5AAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBUSNLFWej90WG/Mw3tXRfwUiZkS5js3pjvZFnc7UoHVhK0Aps
 IQ62ppiqa4e/EmXa0oYa/t5S3icil3QAlqn3NBdHOj3azN3YqVQZ1pAXxuhJWoyuPgbDtNhtO7L
 Dn702TXCdyFg5BNtYHzIvMPjLBb4fIYJOzHpwKkkJ8p7HtvxRDQcHPDCBC8GM2n5fR1gMBGA=
X-Gm-Gg: ASbGnctk+4dNdfckuQKzajgliDnaKnePD8htYEukJXiQuoHaZ6pNYbGRV4uCahSv3G1
 8M0UiK6lErPnSI5+fbgUkuYyKXzexn/YDsNQv4FpdMU2khI4HGJGIYQ5cMN+E/sKVopFRitFZtI
 a9xqQGG8VsEd5fTCjko2bwFYPmVMx8hLVUzMbcwVzkqPzFliv24KJtmaYUoeKA/votLHEghRqV0
 zcAVJ4bayZqZ3J6PFpHLy/IWukxVzZ7t9LXjYrMOFss+8rNCrokKpidgI/ymbTsSAXi5EQ+aLdP
 v0Em9MueKthgiqfEYy7Eu8vWY6DJS8UxdlFKXbJxWX+u2uIYDX5uOXQKbKgATR1pJ2loyZmW70I
 76vW8rg2+e6tYuW611PDsRRjf1sy+crKfearQ5F/byRbMu6pKbTVx8CUI
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-55b1e8e656bmr1366537e0c.0.1763391750443; 
 Mon, 17 Nov 2025 07:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3gTN2k6xAY3h/CeIVWmGva+PTDh6zNiEHBeDvsWL5An00LUHJvO9nFZJUxYNN6II0l3pA5A==
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-55b1e8e656bmr1366500e0c.0.1763391749842; 
 Mon, 17 Nov 2025 07:02:29 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-644f132653fsm981327a12.15.2025.11.17.07.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 07:02:27 -0800 (PST)
Message-ID: <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 16:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b3907 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=5-YDskA_wAJxIDT2F10A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OuQ9yOHStSkw39wlcPEN68TrynX6Ow52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyNyBTYWx0ZWRfXzVSBazqsZXo2
 M3hKGXn1xRD35BGg2gE8gBjXuoF/Of0uGAw4HzTtIsZKqZmo/A6i3VCqu3V3kLr4wOzpfMRpFKC
 3kf06W7t4LjTfc7nG2H/r9JEbDeqnenS2CPQLqEq3nPehQP452N79dVG+q6Smny6OVKVeRl7BQJ
 vs7LmdR4syC8cAztPFwFf458kLnXxpSJfZRthy+V3IqZVTa4hCpPst3QOZbk3XbX1aMpKKzfj3U
 9KjsPcvvuHqy/t+hQA1DgXYfduYjAgKOOEt0xqQ1oaPnBv9L2kS00hcvsFR/tAu/2/yCNBm0/Pk
 mCWpAu+l24HcKgr4nh1mbOK/gMsDLT71iqnDzcfZuo+38xBCXkn38653ZAxvWAo6yGpimjOr07n
 NMAg7hyDF+jxEYCNLz3iU8MX11hc/g==
X-Proofpoint-ORIG-GUID: OuQ9yOHStSkw39wlcPEN68TrynX6Ow52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170127
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

On 11/17/25 3:51 PM, Neil Armstrong wrote:
> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
> if still deferenced in a7xx_patch_pwrup_reglist() which causes
> a kernel crash:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> ...
> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
> ...
> Call trace:
>   a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>   msm_gpu_hw_init+0x58/0x88 [msm]
>   adreno_load_gpu+0x94/0x1fc [msm]
>   msm_open+0xe4/0xf4 [msm]
>   drm_file_alloc+0x1a0/0x2e4 [drm]
>   drm_client_init+0x7c/0x104 [drm]
>   drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>   drm_client_setup+0xb4/0xd8 [drm_client_lib]
>   msm_drm_kms_post_init+0x2c/0x3c [msm]
>   msm_drm_init+0x1a4/0x228 [msm]
>   msm_drm_bind+0x30/0x3c [msm]
> ...
> 
> Check the validity of ifpc_reglist before deferencing the table
> to setup the register values.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

I think it should be fine to skip calling this func altogether
if !ifpc || !pwrup_reglist

Although ifpc && !pwrup_reglist should probably scream very loud

Konrad
