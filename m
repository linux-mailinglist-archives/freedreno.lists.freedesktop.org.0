Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68704AA49A8
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 13:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0FC10E0E2;
	Wed, 30 Apr 2025 11:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiIz+EgD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4051110E0E2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 11:18:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U94aiI020901
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 11:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8ZFIsCqDMndsS+cxLg5we8+lkzN4XxRlgIxgsI40cLE=; b=SiIz+EgDyVjpF0AC
 FlvOSbq9aNS1XnVLTFUTHcfEW8hDhfPDutaknOg0l09KveVXOk8tkGJ98IJQh4gf
 pfoOuPQD+YbkYgVYPZcVOzjGiJkpt5RLrs/SgauEQqem1AqD+HLiB3eccAGdZKDj
 xKc3ZxURike72+VnX8U27MMt1dpf81qklZirM5eoyTiPYsjVJoNVB+0IYvZBL5r0
 jxNGc3d2U6ZaVbRTivMulmvdMo/02jg8WfyBqY920ddo0HfU9J0HTtX6QxDp6Wai
 C6b5lPSOLrvzJS8SKcg7e4LU/5q4ocjMkmCFltmToWpm9eOEn076TwfPNBorhf+3
 fwoQ4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1sxff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 11:18:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47aeab7b918so14938061cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 04:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746011921; x=1746616721;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZFIsCqDMndsS+cxLg5we8+lkzN4XxRlgIxgsI40cLE=;
 b=ik+tuJtFmtP67Wu5hvrhgZzeqhjyKEWZdiJNI/mEBcI+4m1LEu8rNdhfLd9kPZnIqy
 f6qkE2B4oSvJUyuVm/w0kCluDpCcEa3lGgKbyAS9KlJmxtu4TIrDzXh7dUloQnNbhTO5
 1e0ENUcq8DU7f0MZyl5fadTOpvCIIJFyVOqASED9dXNNbRDc/wGGjy2wPAViiHCVbsex
 AxzW35lMdZh75hdb0XQA27ZFCB/A/NiZki61bIXXvAh6/qbS2af6+2aAa3D+h2F7zmSs
 Udgg2gld9S3PvLlhmZM1BqhevXwzwuVITg25cqvv5mK/1jNueq4/pVvtKIzXxi77YGQ+
 4xWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW43Z8s7q+dC9kqaIQcog7LGc/mYE8Kp0V5w7R7IebWMk/30aGOVy6EHiPL2Cd/M3GCm7x0N7FDUaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlASD4QhicLPZhidfngONZI9+MBZL5ncQ4Gg0ZWKPGxpNtwOuy
 gGokWwjufUxNy1v8mLoLYZpNkZ4JNGo/L1ieREI6dENkujGeRKLL7OMQWD5YGW76/G0jo7rb81m
 QYKGG1Z/1aZKssOfZIoqpbj5eg5ah+R9k5Isi4yYH6Nkose16ud+3QHnfBeioSwuzVRw=
X-Gm-Gg: ASbGncsk0DxO55g96tkTXYtka6NeSxoa86g9M/QzZzoNOJNTLb5BSn86w5DpZ07MrzW
 uovk4mlh1EQIJT6pyEyWXfUBEufiDGQVG3YS4LxpCHYeW3Pi2KGKZkLVBG/U9/mPrMM30Ks4V7F
 S3bawHl5hWhZEfvAilLSJbDPynIJ/Sui6NgR30QdInFx3LPzwh1B8j0AEK9aQRpAM6ocjmmGzU/
 3ydWgjYu+TbOR9PfxdWvJ/iftpmf0MJ02vw3f/iu+xrqtiDl542j0V/Wo7aIYloZIXixC05ZA51
 OPQ6KlZmkOYHi8U0ZNh1l4OyCL0T6Ng6Cy9HN9Ui0O1bNE6hlCkjXK6ndcVmGV/D0aY=
X-Received: by 2002:a05:622a:1b88:b0:474:f9a1:ffb8 with SMTP id
 d75a77b69052e-489e5efee93mr11201631cf.10.1746011920918; 
 Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYI8AK0llTsxREeTqIZc4iujbSMfKc70TN9di8lFbZ1oHX31huO3bZUjC9mtgoH3qMOFI7aQ==
X-Received: by 2002:a05:622a:1b88:b0:474:f9a1:ffb8 with SMTP id
 d75a77b69052e-489e5efee93mr11201471cf.10.1746011920593; 
 Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecfa910sm903756866b.113.2025.04.30.04.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
Message-ID: <3e4e628a-740c-4b80-b927-014a635eeeba@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 13:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gpu: Fix crash when throttling GPU immediately
 during boot
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
References: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68120711 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=5xDEUdhm2TPt1CDrq1UA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4MCBTYWx0ZWRfX8D+5GtjKbMXs
 kNKDCjBxwnNSQ/FyEqMtCqFteKRr+BuZocaDTM5TrmNsQVZScH5IKm/X0dGX1XCx54jS0acpLeb
 jCVAP0JrMRnORVaOT9kshAkubfWrTBKh+IboYadKpDC3oW+NZCI+4eRVba7GN8RhJS4PqcrgY7V
 c5dYCh4KrcjavbB7dYUM5Wv+MdColQPBKWQcHhkmt/JClFtZbYGnRnWsgYByHo9FTMeR/u0QVV5
 hB9nxnP1+/V/iFHQZgor4b+NVyatql4EftACp0PQdhzR3pI/K46E3VskhG5XFIx9LcQ3VJn4rye
 i/kfOyZuADm6TxuM0Lj8qVWzpPXc6ewLZfyDsh6TGSFOkXsRhgIDyJPbKphDlUw6Pe8cFo7tJbj
 4QjEEgmulGMiU2cm9ZtqP7Evx2fGjsfSv2uFW2DUCMdV2GOlFTFm42wMuyUsx9n/Bsz2XPmh
X-Proofpoint-GUID: zHmyDkUGN3kliWlC38HAK4nq2BwFfBUT
X-Proofpoint-ORIG-GUID: zHmyDkUGN3kliWlC38HAK4nq2BwFfBUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300080
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

On 4/29/25 10:33 AM, Stephan Gerhold wrote:
> There is a small chance that the GPU is already hot during boot. In that
> case, the call to of_devfreq_cooling_register() will immediately try to
> apply devfreq cooling, as seen in the following crash:
> 
>   Unable to handle kernel paging request at virtual address 0000000000014110
>   pc : a6xx_gpu_busy+0x1c/0x58 [msm]
>   lr : msm_devfreq_get_dev_status+0xbc/0x140 [msm]
>   Call trace:
>    a6xx_gpu_busy+0x1c/0x58 [msm] (P)
>    devfreq_simple_ondemand_func+0x3c/0x150
>    devfreq_update_target+0x44/0xd8
>    qos_max_notifier_call+0x30/0x84
>    blocking_notifier_call_chain+0x6c/0xa0
>    pm_qos_update_target+0xd0/0x110
>    freq_qos_apply+0x3c/0x74
>    apply_constraint+0x88/0x148
>    __dev_pm_qos_update_request+0x7c/0xcc
>    dev_pm_qos_update_request+0x38/0x5c
>    devfreq_cooling_set_cur_state+0x98/0xf0
>    __thermal_cdev_update+0x64/0xb4
>    thermal_cdev_update+0x4c/0x58
>    step_wise_manage+0x1f0/0x318
>    __thermal_zone_device_update+0x278/0x424
>    __thermal_cooling_device_register+0x2bc/0x308
>    thermal_of_cooling_device_register+0x10/0x1c
>    of_devfreq_cooling_register_power+0x240/0x2bc
>    of_devfreq_cooling_register+0x14/0x20
>    msm_devfreq_init+0xc4/0x1a0 [msm]
>    msm_gpu_init+0x304/0x574 [msm]
>    adreno_gpu_init+0x1c4/0x2e0 [msm]
>    a6xx_gpu_init+0x5c8/0x9c8 [msm]
>    adreno_bind+0x2a8/0x33c [msm]
>    ...
> 
> At this point we haven't initialized the GMU at all yet, so we cannot read
> the GMU registers inside a6xx_gpu_busy(). A similar issue was fixed before
> in commit 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in
> 6xx gpu_busy"): msm_devfreq_init() does call devfreq_suspend_device(), but
> unlike msm_devfreq_suspend(), it doesn't set the df->suspended flag
> accordingly. This means the df->suspended flag does not match the actual
> devfreq state after initialization and msm_devfreq_get_dev_status() will
> end up accessing GMU registers, causing the crash.
> 
> Fix this by setting df->suspended correctly during initialization.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
