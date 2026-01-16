Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE2D2F237
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 10:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17FB10E841;
	Fri, 16 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPe3TG6O";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5WMVL8T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF8310E847
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 09:57:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G8fL7u3596349
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 09:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=; b=MPe3TG6OQrHZR2J7
 I68gPXZBzRcZb8aZ6IjvZYHhejrHi0r5jdUyCD4zMzYPjMX5ty5lBTadI/aTOlpu
 bYaDvOgfluJvz+YHvNhrpMHyyjXptKjXY+07AyoxGI6ZawllpE00AgaZ15BF1v9w
 LLXbW6wx1N2aK7BSy2zKgc85YGDjgxMkvAQtN6mrid9HJ+u/MFwLzafur0S2BwRm
 RF6rz8UncEviMjabb7wKvXSEnetymItwvSkI8lYGJ7C8rGsL5WlUuzG7jAsStY9n
 YXjJ3xUydfXC5FIroEHx5Z6L28TvvRBhFb8CdGijr8tCbM5pNOhwrAe7XKylXGM6
 wlKt9Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rsq51-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 09:57:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-501476535f8so5691501cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768557467; x=1769162267;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=;
 b=U5WMVL8T/wmp6JKnAZvCQFRCHFsRJccpz6onI7nlhsSmFf9L0b02lgmgHzBTMm+0Zl
 hkzriOrPbl4SLf9KJp1hio79wXNKtztDOSM4Kkk4YcmgGCej7vuUAyyckk/lQew84S6y
 pbcfAAZ9+KxSjJnGRwmjPx25KahvTF1xo6jYP8B0KBwR3wVecESZBPCSa6coqjO2juJx
 zPHzFmhmFl74na2vyvO2pwBV/Vc3tuGtzrgDbX/6NZO9Zmafa6hxh5yx04WxtXmhxxWo
 lPwwSUEiN1+baDGA003SWjVIS5we/oV+xfLe0Ski61lGOrzs4rkH2gTkVRijKey0KbVb
 stMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768557467; x=1769162267;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c+uJpy77A6qGXpHZGMOoyXWjGDOHGU5pnw9fJmRASH4=;
 b=LTPNVU7olFsLShcLUMe0VnoJhEd/U1SZg/SGNt1txHrpJ4JOfQd8pnM0fvDBNLQKiq
 YXQ/RPw5yD5aDl2Vp7g0IF5yCAdYZqjx13hxO6sOJo+gmCW4X6mf5tNgHPQ0PQSiyPcs
 6Dlkfq+0pCf1SOG0B5XrHn3mwiVyz/WF19xo0CoY+UGptm2n56PwCIVXqBOVdT6th8wy
 01Bj6MLwchomMVJYMkLKaX2zvVFM8/j3QceVrweO0aFL7vxSvFxMTe7CKPMP6kAgSkNX
 qG79qPJ7awRNiZTZ2FED6SUxCkJPXEBEpEj4tPg3KHvL0VJH4Q3A4+yXKHW3oQgnc6jm
 xHSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIIa6ZY46EV4putzmb2FqOFsjZHwV8Pyr8x5UgAlDHERYt7bfptWG2ciPNYm2GAlpJn9q10ddGx8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz7WEhWy4nPJMgvqAIHa60YD4InFNcuHEUUSCm5eej18RxSS2F
 H2KwsLaN62hs7AZh8IvSRP1YCjBMWfgZS92DVW8e5QRI9g1efIQloxtKjkp2w9MuzzaMJ5/fHg+
 pw/tpkSl5jUsQcZAUd51S/1LUXoqC+wQZ63dYhDgBEvq5IxOySoemjlxFlBDrzBOo7MWp2wY=
X-Gm-Gg: AY/fxX6QcAzbUcjyZYDvz2fSbR68XhgbvjVkmGWKqWSJ3a5nqAwULQ3IPATkv282rm7
 6B4Cz5mFh/FqK2I0ozJppySFjECGZSmsEO+eJGJTtEjNi5nDkidwmlynGj3PVQ9aNYxgzSmA+UH
 b43/pVxhRcorCk336vgqnNpkPgCtBhM+fjU/5eDFOTWMX5zqPkZ9OLauIkGri9TWoBD6oyJVDx/
 6Qi+LZE2c1orGqExvFVz8B4lved00r9U7ZYl89cH97YEGm7SZ5S6YavBIJdxhTiXATuuqDjIU3T
 4TsEIgO0NCxkveydYHDo9YcIP6AyiFIKvQDZVHHaPKSKykB01PNzVQaUF48zvY0cTGgODq8+4Ix
 jqbah8NDRopFk1OY/C/htM0m964dPce5lQmWpImlWRAse+v70IZ21vmnyUuJTVGTM2zU=
X-Received: by 2002:ac8:59cd:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-502a17d68b2mr27218351cf.11.1768557467438; 
 Fri, 16 Jan 2026 01:57:47 -0800 (PST)
X-Received: by 2002:ac8:59cd:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-502a17d68b2mr27218161cf.11.1768557467003; 
 Fri, 16 Jan 2026 01:57:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452bce4c4sm1912925a12.4.2026.01.16.01.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 01:57:46 -0800 (PST)
Message-ID: <3019516e-afb7-411f-b80a-716540a3f8f5@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: correct error messages in RM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MyBTYWx0ZWRfX6WAOaQUpjKEV
 3PUDX37RZYr3A/zgFxtKnCMm2t3nUCTSTpn0CcWzSr8EmXooQ1eztQ5GlQ3VLsEtGuG0MRRVUJX
 J0qSwNpEYs4RGsp8+7gFyDs7fpvAI+GFrAinvRe6zXpa7PtJWxcDExGDLbdT9b5A8uAkqpTJVyS
 zPmm5ej64ixI7YTypr5n8mjWjbxm95DKbeyyidmt4KhSEAnc5W9nUlbopY1CnXTWlYmsy0mw1Qn
 fP8jW/oMVLPMdjSK3H9/kRVLNMRbTOnNaPJnwbN8qLN6z79poWzzAAa/3xRfcJjonoPT745F4QL
 fLi3tRhb8ZgCSrzfLaT3A+8uEpJH579rHD6FriCs4CcdRm4YlpAx+Umd1gEDb+m/0Jelhzc+FSY
 fNQa5InYwfJgBuwN+iKxopq9wlT/kW+KAqx1MNzczLT/J5vZR+Rai+desJqfluuEiS19U2ECxCa
 Uf4WIaaNMPHZNgWM3tw==
X-Proofpoint-ORIG-GUID: mbaGEjJNGvptQgf1oz6SUmOKgtoLDkY7
X-Proofpoint-GUID: mbaGEjJNGvptQgf1oz6SUmOKgtoLDkY7
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=696a0b9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W2xj9Y3iJeoAxjfXkiAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160073
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

On 1/15/26 9:05 PM, Dmitry Baryshkov wrote:
> Some of error messages in RM reference block index, while other print
> the enum value (which is shifted by 1), not to mention that some of the
> messages are misleading. Reformat the messages, making them more clear
> and also always printing the hardware block name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

