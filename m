Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AB09D5EB6
	for <lists+freedreno@lfdr.de>; Fri, 22 Nov 2024 13:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CF810E2EB;
	Fri, 22 Nov 2024 12:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceTL7KBv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CF510EB54
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 12:21:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM6HohY007191
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 12:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2zyqdqOWon+Bb6KDq9EFahJ8KwOZlSLq3h9cfnJbehE=; b=ceTL7KBvdCZ22zVi
 udzdRY3CYZAS9dHzjhEXUYpMQFNAUEyJJWx0j9AWTrlU1Sv50SUvlGWeV1wBj3ZV
 xGDxL/L6fh9buUgSMMSoZGS2b5L4akX3K/u3qqbXWwWJuVwvF9Zs7E9S8GNSp9+a
 G/idSgVQg/kUfpi8Syq65G0aCwvt/YCBlgQshS8wLWWw3wshLoznkEOghhIv2/q3
 AV1vQs78BgOValB+FPpJW+G4Kw2OUqBrW4b6lBmf12UfSBYMgJoCfM4qmpdcHDkx
 ibuMyzc6hyysA70lfHAv2OaPegJF7bTAYNPFj40x7aiCJwHHVIjtgHDhogLw3nne
 Y1zz4A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432mjh8w38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 12:21:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6d40d17eed1so6071206d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 04:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732278108; x=1732882908;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2zyqdqOWon+Bb6KDq9EFahJ8KwOZlSLq3h9cfnJbehE=;
 b=TGhrMro/xBl9ppdMV3yNuLm1P8dYEsvOMeiwFADYUuZt/RP22uAuWIwBRJ9HLFYMFE
 K5CLJlsYC3E+cjPhsdhydud2omDVFiH1s9DN6nCNbDz35OPflHcIF2xjqMNRHUBbwV1d
 nCQuq3NtKSelMbfMogrthepw2oK2NjrYg//qYdnJ5xRCH5Kme32A071NpWyHL1MtVRwF
 1aPKgFYhi1OLVdg5XKWnEb8y7eNHNr0QvULvSbTvCxofr6UBdUUiY7cxQHtagdi3+kZu
 Pca+4686uqHKv9x5clppr79AMlfXtJgwaFROJgOnoUYceHRS+WILX130GCJP+L+l8iz4
 7D5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyMeJ96lV1zTIQ+IqtMVqTaWgNq1ByQtvzsiKwiZm3rVeh4k01ykCsNTqh3u6mWsign4UgU1lNJe0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbGoiGTy3HBHqbxXSMI1ClNbMLfNhUyJkl+oiO49UFDH7QP+13
 TmYknwtKrRrK+9FuO3KqBeK5DAlrZA3KywDSxWV2FBHGh+0B473Lsm/dti5/w8RxtP+k+LbUURM
 jTUFKNi8kWwYTjJRawEqIMqOJxEj4EVFiKDUYhq63LGpjiFEnB8ej5n8684mmTsVwRl0=
X-Gm-Gg: ASbGncu6n2B+e/MV714ss3lK3CZRO5t2Buw/BeesuXfpKW+a98N83RzEN2d0Q3n5cAa
 pxXQrnF/McQiwCwORGaS6Uoaap6xAUDvuNOXk4dHqDbsP2ek2j2fN3WuvuHL7J5rcoGYxGW0D+i
 cVkcvKd3bh2cuTAssDvSNhYT3ofbAtT5wdcce+rMMFhyk+NVhicIc2oYtB/HfvJPBjj9Q4Lxomn
 vJ0urWfHWxemENvZOdAmLyWnypkfEq/VLPkjGnElMeIfEbnFNye7aWds73mz1YOabyP9uBXAZdq
 QGON3fKawGuaVpBE0Lb31KCh6349lwQ=
X-Received: by 2002:a05:620a:1a16:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b51457fd82mr154414285a.12.1732278107923; 
 Fri, 22 Nov 2024 04:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHmLTbwm8pNChveHbGVRdyKfjc2M6rbis5hRH/aHBrK0D9jZQQS3R1hjWKmaZIuM4R3iO+zw==
X-Received: by 2002:a05:620a:1a16:b0:7a9:c0f2:75fc with SMTP id
 af79cd13be357-7b51457fd82mr154411085a.12.1732278107496; 
 Fri, 22 Nov 2024 04:21:47 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b57c19esm92298166b.154.2024.11.22.04.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 04:21:46 -0800 (PST)
Message-ID: <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241121164858.457921-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k8w0298Y4AyJMtU2K5vecCY0qtMOGtEH
X-Proofpoint-ORIG-GUID: k8w0298Y4AyJMtU2K5vecCY0qtMOGtEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220105
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

On 21.11.2024 5:48 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> helper macro to make it easier to add debug logging which can be enabled
> at runtime via drm.debug.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

[...]

> +/* Helper for returning a UABI error with optional logging which can make
> + * it easier for userspace to understand what it is doing wrong.
> + */
> +#define UERR(err, drm, fmt, ...) \
> +	({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
> +
>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)

I'm generally not a fan of adding driver-specific debug prints..

Maybe that's something that could be pushed to the drm-common layer
or even deeper down the stack?

Konrad
