Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F141D08A98
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 11:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4FA10E893;
	Fri,  9 Jan 2026 10:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NprL9ete";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpIZtTP5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F5510E892
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 10:44:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60982X9v2184008
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 10:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=; b=NprL9ete3g0nNeEi
 NRhe8pTqB8RgdhzK4ww5oz93aDvMu6CzwUJsJobPedqP7ryaQ6gNufKquk/+X3Z8
 NqjUhMDvUKbwnkLiVLP8teHDCWPAIWqYl0uyuI06W16EExyUXrzcTHROH4iLVddG
 8ZrHqbeP8x21M2y0B7391F6ct6F5eVyz9kBR5ERnoQy2TfYLrY/jfW+8s3iocuGo
 kJoQ/O1wXAzdqH0GjhUXcR7hfBoAFNuKwnZa9xGKLM2KOL2JYP5S3aSUF/EFFKEu
 QB6SIMnFXEHtW9xoY2vNnbuzkqhebMbS5bLUkAhpqu3KtVv9PPo01Uz43ZgdOv8I
 NXqBCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn8h79-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 10:44:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1e17aa706so17200391cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 02:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767955492; x=1768560292;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=;
 b=JpIZtTP5JxsQmRpfS0p2NdHgmF1alFjifT7V8GNi1paZRfdbY8+Qda9UlVE/k0D1Al
 j8zPQQKxIbCySeE+qD9IpE8op2DcC2QhFtT66wvQxi5QtBU6cZfW0zlhHqduCI5d1YyH
 773vO+d5V//3z+c0lmfBCOxLkoZAvUyCy31mSp2+x/fW3qdOVYK7bC2NnAJTwEenZDY1
 71d+9R924hxN3KVRL/cj9Q2wcQPVkj4Yn+V2aeleTol9lHIYQp32uq5iGMzd5mRaswWc
 7tImDrYSt7Ee3MGkWlrB+cR6j2rainpUOad3cT03TQAFEwhvyHug+SglElkWoVvq2a+5
 EC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767955492; x=1768560292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=;
 b=bY32nFKuCZW1bkmFMYTjV6f7e8Z2EXHoXKtT1j73bdCJXrcK+4mM2XqMEvCgoV6iIu
 WVNAPMZJZO0w0F2q9FZS+YvKjnmU93fwY3+/agZiCMlyGgy/R6NeURdISAeHVzlM2u5A
 qFqRt3GGnMvviidclWrW3ZSFY5Lzu+JMW36wM4bIhdn9d+GJsUSEllcnhkZrnARz1pCJ
 gZji/f7nw6/eJ/nT0I6LO+xI8vhueWbA+d/PUuhsZypkt/ZKmKF8c9veR9duK+0rmSfV
 pPLguTwygl66KngtxU7etvxbfhIZ0rVkjRlU3/D7RURJ2j2PM36pV/rz1bOOrTrGEs+F
 nsoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd4g/va/LMX1gS4i+CsPOYQgzBQgJ4MNYHTr4fPW/TsiPqBUCBhbMha7hYj/GaWrJq3XQUoxorjEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu9P5moIQ/C6tdHXjgYkW6ulmHpudMWnY1mBUVdzljK3GVV45P
 p88p0X3zpeIimOWgGILAHrMN3eGBb8j7xPR9ce10nQwNnDgrUVBz8mpVCdlRTJj/Rb2ojXQRaO9
 6qdEvj4B2fsBXUFJDKlh2tBpqR0hE/BoeTQYpFFDoK7EOEnEh8Tma4dOtHAN7FgeUlQfUb9A=
X-Gm-Gg: AY/fxX7IFhvq0gfze7qEJ72/jxoJ+lwMrSEUxV9wEquiN1BPrra6XvNLVlI1GJgpZvA
 x+AcU++oRT7Qh8C1/ll4E1DmPGtWG9GlgQ+JEcSsaWakG2hwtuserpV1GeUEn013g9W6YJ0o6bf
 MXFT+o5VhO2eDZpjaygnTjufOwKb4qzWlrTUYvRIdHz0oRAyuKMQkJ0cLNvuLaoJWiJ2OqF/jBP
 cROvRdm/phZRVlce2DoKVYyP/HvrWWAayMNIIepdHZn6PDMSZ3IrXfOSKWx0c7DU0E28u9YUQT/
 70DBDTJeg4gIerTv1sW9g58V9ghFJulzefLnqXPDeZx4uioTxPpA41nqTSyTtAcy5VIW1xWUjrS
 /ODdfE2kZ1QX3khWHEX1vYa8uFJwQln74p9yXpmiIl0kuoHUsDqOWT31xOkoYnB+s7Bo=
X-Received: by 2002:a05:620a:2847:b0:89a:7d24:f5eb with SMTP id
 af79cd13be357-8c389405d75mr800542585a.9.1767955492546; 
 Fri, 09 Jan 2026 02:44:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUpKCBKMBJi+XzxFemYbEOa3ADoNK7YYzJnMXnJTOfqSPRMkTsVJDQkKa7InHZ//GdxnUhHA==
X-Received: by 2002:a05:620a:2847:b0:89a:7d24:f5eb with SMTP id
 af79cd13be357-8c389405d75mr800540485a.9.1767955492001; 
 Fri, 09 Jan 2026 02:44:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a56c552sm1089465666b.68.2026.01.09.02.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:44:51 -0800 (PST)
Message-ID: <dc16d4f8-21a3-42f9-95e6-c508311268c2@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 11:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aZY9ZKmTpojz5XUWg-KyciH109t89lFE
X-Proofpoint-ORIG-GUID: aZY9ZKmTpojz5XUWg-KyciH109t89lFE
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960dc25 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MqSUJ6ohGVtzaGjW0LAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OCBTYWx0ZWRfX9mr8hxTMsVay
 Sd3TCKvAdtVPmLaG3NOPxb55Pc6YRL6yG+QJ6nsBztcmNraKaCid8QsPBEzdvfXtBHVxnHWGnxW
 MMe1SgjcroRYXuNiVxbpCsmg4ShIaFOpCWgUW843Q7+pd+ifZEH/wii33LGiFjnTG02U60L/636
 yOHXRfEy9X5+kkx0/PB0ug1dGCqDRKD1sm7CU+DuCOkU3yenKvGB935KBzci855IhLSHu+h7YSS
 bYxPw8zO42ImqE3XwsNvdBzpSRl1gg6xAblO2c8kJMMf2e574Kbs9rIuRfjWC/Dfqz5IoPkMDkC
 TE85k2p/ggKYrHRlyQ2DQbvhSWjNVE9bnrphiyywSgbNf3IBHBje8XDjDIG9zNlrx5PfnpcrOu/
 iz8ncIZ6errjcrknQ5LsNYyTTfbXIWloP9rugyCP7lkBvO29HtIVZm7PdPv60etiezyl9bY2vzW
 sVbu5n7D93gcZpIiG1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090078
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

On 1/9/26 9:38 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.
> 
> For example, in the DPU bind path, the sequence could be:
>   cpu0: dev_sync_state -> rpmhpd_sync_state
>   cpu1:                                     dpu_kms_hw_init
> timeline 0 ------------------------------------------------> t
> 
> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> to stay at the highest level. During dpu_kms_hw_init, calling
> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> fall to MIN_SVS while the core clock is still at its maximum frequency.
> When the power is re-enabled, only the clock is enabled, leading to a
> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> highest rate. In this state, the rail cannot sustain the clock rate,
> which may cause instability or system crash.

So what this message essentially says is that dev_pm_opp_set_rate(dev, 0)
doesn't actually set the rate of "0" (or any other rate, unless opp-level
is at play), nor does it disable the clock.

Seems like a couple of our drivers make this oversight..

I see that originally calling dev_pm_opp_set_rate(dev, 0) was forbidden,
up until Commit cd7ea582866f ("opp: Make dev_pm_opp_set_rate() handle freq
= 0 to drop performance votes")..

In fact,

$ rg 'dev_pm_opp_set_rate\(.*, 0\)'

returns exclusively Qualcomm drivers where I believe the intention is always
to disable the clock.. perhaps we should just do that instead. We don't have
to worry about setting F_MIN beforehand, because a disabled clock won't be
eating up power and when enabling it back up, calling opp_set_rate with a
non-zero frequency will bring back the rails to a suitable level

Konrad
