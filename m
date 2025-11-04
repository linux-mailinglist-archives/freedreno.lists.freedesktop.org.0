Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B29C3323E
	for <lists+freedreno@lfdr.de>; Tue, 04 Nov 2025 23:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFA410E674;
	Tue,  4 Nov 2025 22:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCFKYNr/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnZuSqmd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F10010E674
 for <freedreno@lists.freedesktop.org>; Tue,  4 Nov 2025 22:15:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4KgPwo3050575
 for <freedreno@lists.freedesktop.org>; Tue, 4 Nov 2025 22:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=; b=FCFKYNr/ialbd9JR
 pHORa2NYr5qUtOAxtzEzhdloSYdIhKvmqVj9ntsGL0McN4s1pCOmXirkCBE31WGq
 snFcuo17qKaA1mtkbA8rlxUoVfseOylW8Az5aOM5x1XlwdXVcpUkwT4qzu9l+CRw
 MDCsSObf3ojBQmlgtLvhrDrFFiVRfivzXt6I8vnLyR+SuGewkxNp2qbcCNmqDUoW
 WCiZnQq5ff0T8eW11zjyxPFl5vvKf/yfkicTo64QeyZW4bijiJrqZV8jvYu8fDF6
 4QnqP6zgn6t3NqtvTfd/OGL6CysJLMZLacxK3IQHI8ekUcZs09lx3U0i+KzJJiAG
 Xp4Gkg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ex7t45q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 04 Nov 2025 22:15:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7a2885329beso302345b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Nov 2025 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762294509; x=1762899309;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=;
 b=VnZuSqmd7563DyZn0mvWcoc+asVG6uBkYogyM/aNK3HR9kDZJiPVDgBpf917E2Uo/q
 eUGyt2LUQc7jLdR7vjbIJKpoJpQKxDHHxR06XDA63AkG6tUfIXJ7H3pa0H0TpSmJ9bvv
 NvVuFxYxqIdDD71iF64xT4ABwDZ2tdRQ5g7LOz9o0O8407fZspitI7n6b34Wz8J9U2y0
 XYKEFYn8ps047rCeUGD7oZ9Sq8I5w7ByoHRkOmZy55boNZlOQ6xKOpdnMotltsaT3XYQ
 sazhdYBJmBttYJ6Q/7pV2vBfufbUlAUn1bGcfbmg8SrAsxUv7SuJBsR4y4QyGKfnQUqN
 o0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762294509; x=1762899309;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=;
 b=E7BSMuwU4jP+JCtosaEbdB0Yr7pyHfDRLcrbu6GCgv8LDOhiRYtRGP7s0ZlT2tax9X
 FQvlIOHojwHAKqoFzM+I+h4fIjHje24jIDvmKHWi+R5yKjsSbVw3q132I1k8DBqHiVFk
 kqXD+1I0IiGP9IrISpdY2zGfvvwr74oyE8zemcjWi3Ld6i00ZDSTDC0WYanE/F2Qasf6
 B4xMiy/GPR+rh7rzD0Xq/wlLu1LaXB5BB21eSqRljPVqfB9IeoPrKWR/KcREEWbRfhnd
 WbsYgT1dTU1rCLQ7VbZvuvD+Crzi16AbjB7aPwyW0qtQvTBaTtN2zxHGPZoXlYEn2wBG
 x1dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxdFc+84D0qEw55Dqg13/bnfl0vXx/hj6wfKWVCl3rHWAHZAFThfJbgMVWI6LpXJ2YAyB1W8WeOCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaVS1KJPUYhpw2lF+RUp612OnzzXR2SiS0fOFoQbzJr3NbHF/T
 xioEgZMVjcQR6g18x8VIXEt/C1yHJHbS6nJMY4XMpTo/HxJpb6PoWg20S2/x3Zkt+9aUHENFuya
 imu74CQYg7VV6nN8iGGNrk4NJdo3FhKpG2Ox/1ZIi6b5JEyqd5++Bgl8V1S12LX/G5TyWfWs=
X-Gm-Gg: ASbGncud627we63rQVAdPDM2Om9ArL+vIFZydJr8KwDYeqX6n4+t4GPdcM/evR9YEzM
 gdQgWvUKV0tbSxSgaQ2KQGb2ReQ+jR97G5OdIx8QIc97dGeduBzY/BNeJ7sR1/mgeOrcdDiHpCp
 8G+iDuOfFEnCFwGGpVO0zFc1DA8Vj5T7y00PvVVU9yXw1161KFWqgGt1YIn/n/btkY4aHZVvTBo
 UkvIKZTlMpARF4pe39bUywjF7s82fp4/s2stIPemGhMzx3SwJuo2ttpDXl55qySQmID+bu/8c35
 wyNgdy7Vzlb/RYsN0ktph3nC6b535DXeiVieQpUZ0O3ZviNKla0/1sTvx1ozTgK1hCs6l/fozg6
 sYLHlsWeC9i9iS4SpF58qMms=
X-Received: by 2002:a05:6a00:4188:b0:7ad:8299:6155 with SMTP id
 d2e1a72fcca58-7ad82997336mr2710632b3a.2.1762294508748; 
 Tue, 04 Nov 2025 14:15:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMSaGzu4ogexmgVVatd2/255fBbWIxfGY0+4QCkMTk6DFn3f8QXyGVUkFdUAVjo2NXiMQ6Dg==
X-Received: by 2002:a05:6a00:4188:b0:7ad:8299:6155 with SMTP id
 d2e1a72fcca58-7ad82997336mr2710598b3a.2.1762294508107; 
 Tue, 04 Nov 2025 14:15:08 -0800 (PST)
Received: from [192.168.1.6] ([106.222.228.179])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7acd3b10bd1sm4013047b3a.30.2025.11.04.14.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 14:15:07 -0800 (PST)
Message-ID: <b94eff34-8a10-44fe-ac8b-304407922984@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 03:45:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE4NyBTYWx0ZWRfXx2UHED1zPJtI
 AozHL/is+f4BbYQ/GUioAF8CVSOWV8HAohTqRZ2iO8r7/ohJdoVJq8egvpqHXzNQl6MqCzjOQqR
 ftukN6i4o03o6S6tCkp/KP0fxrHmz3d/cCNHMdwODJJ6pusRoHgKOHCKqMJkuISRcVt7raWCHaw
 T591XjJUTkFMnc5KDLyEZm5HjMrFTfQyz5b9WwVdejT4Bwg4vHibtBmOg5I0uvHctTFT/duOyKq
 1zohSsNHJ6KyjykXmaN7LeF81Y838ToWNedrlH5mpcLww2cEzgsSJb5nu5VYd8EZz2ZqDmxsAsa
 dt/s++alHSs1oBAUppz/OZfe54P/cairIix+a8OaXehq2qD4Js28fvZoIqymAPJeVdxyEBO6Cw/
 iQHnorm7kjB2dx8zkHuSIlZTdHT6Ag==
X-Proofpoint-ORIG-GUID: 5k9lnB9gaa1Al_4mYPq7jmUuNb61XFsw
X-Proofpoint-GUID: 5k9lnB9gaa1Al_4mYPq7jmUuNb61XFsw
X-Authority-Analysis: v=2.4 cv=auy/yCZV c=1 sm=1 tr=0 ts=690a7aed cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=oSIXvc0h2ZBec1W313aPdA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=V8cJkdWAq56nonIdhLQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040187
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

On 11/5/2025 3:32 AM, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1083598bb2b6..033675aab0d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
>  M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  R:	Sean Paul <sean@poorly.run>
>  R:	Konrad Dybcio <konradybcio@kernel.org>
> +R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	dri-devel@lists.freedesktop.org
>  L:	freedreno@lists.freedesktop.org

