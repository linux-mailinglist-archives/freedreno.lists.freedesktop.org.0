Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D4FAD153F
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 00:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC01F10E440;
	Sun,  8 Jun 2025 22:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoRg3//g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7118010E593
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jun 2025 22:35:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Lww4a012297
 for <freedreno@lists.freedesktop.org>; Sun, 8 Jun 2025 22:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EKuV41kanFRSiy3Jvl+j+58U
 7yzzRT98y5OAQjFVSAM=; b=EoRg3//gq2JD1FZDiZXRNu4ss6L+3/+TdBYSFM8v
 MCt7mnIrG7J1tyjIgsTLDCGO2H63GH+5fUk0kmVSI/aT/Zayj20OzXzWEMLuhHPQ
 hJ6E4YCFqVzhnATNkkyooUQDK0gRaiX7lDliFZICPViNDuQrz7kovvIwRDo3LAdD
 TFGv9OxI3xzQ7TLCm753BP1Dwj8JV2TYVO337cH3+/JYJT0Gd8CNrrPTZ/QRywAd
 vp1F0/3PzoCxzRC08NTfLEDJgLYlHaZyhd/q0g/s6rZHLe6R1x/mxMYJV8vo4Pmb
 yzZ6h9JbaaQKbwYgP7Hypd9jcfFTPGNTT3KnjmWk7bLI7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11v8x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 22:35:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so961053685a.0
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 15:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749422141; x=1750026941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKuV41kanFRSiy3Jvl+j+58U7yzzRT98y5OAQjFVSAM=;
 b=C+uieDSA10vJbULopF0SEAXQNQHArY53wEawXsnF8godqMutQuRPxGE2CnMHjEJMki
 6Sn0o+ry+vEkVnSjfLVAYt64mF6z8ZZbJAFf+KDH+PV3QgHueyPAtFz7G+vesn5Om1E4
 UdJ9Dg6ZHoNJV1GOO6Ph4u/htXoFm9VwSM547VOJKqoZcjLoVpofSDN8EX29w1V+VEZC
 CHh7rKjBNZ+pr9F7IzEb8cydvwykglfg7RkXsuJjF0QJ2Y/onb2M+Hc040qO9pcVt9ll
 7DJlzYzbSMmLPV6H71fQsiuLZTs+CgB16ErDLzXapgzlVbD4ni0ZyS/SqLBGI2l0RD7g
 cl6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeao9tSly31PPSmbYLsl3zQ1bEXDXVuem+19nyU5MQT7wvUsm8pabAmXGCUj8ezTdFqUtOmPvuTFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5U6BD8Z5mjZ1xAIlWyUwZ5lLqzouJtt4tNw+3GMtzD7lMPYIN
 OU0xGPITD3SavulwyHwO8+8/rA2Qss4qOpHPtaPlpSPh9RYv4nMEh4eYrXhkhtTPygLsrq+SakW
 uTm3bONmYGI5o0DoUcS3nGeU0nYk/JM6J6RbYINyryjtuhyaWlkw2sDjYiBHNagtu3AAouNw=
X-Gm-Gg: ASbGncvqRW2akUh8v1Ez4OWv7n6AeC7QTcfB5wSFX2wFPwbGHcwAtLHSQxwY5Dq+Y3b
 YSr7g8aR9+M4PemuDjQAr+sYcqRztJjcJi029dNRlTvcyOY+ECPq90VT4j9g8YDs9bLqRAWD6fm
 0f3nMRPThOlWTMfJlrNQiWAVqWhzhCdOo8FLchgE2Lw3ez2+jhzafhARJVqPhlg5vi3NIQ4l2jZ
 5ohZ/8TfCcCnLJEXnYOEMC9/F95fOKAnc+63uZcpy8p1nz4lgXSYnulBniMeP5W6SNxY7rYt9xL
 yjCqiKvYfj+i1KbBqmLm9277gBTsLZyoDYRBnPTuORCQSXv2QQ+QrN0u2LTTSiUVYeaYbQRz8Ks
 =
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id
 af79cd13be357-7d229863426mr1907149385a.7.1749422140866; 
 Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjoOoW4vYfivFJJy31TrYZtEgVAcRnTjvKyrzMsvVqgoz2mkewEAd2QDC6UYYNCWyWKNoopw==
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id
 af79cd13be357-7d229863426mr1907147185a.7.1749422140521; 
 Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a61esm887119e87.163.2025.06.08.15.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 15:35:38 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <t6gtx5ygd4dkizpgupedef7tnldwlbvhcp4m4ypw4447fctull@35hwlznm6lv3>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Proofpoint-GUID: LWVJsngSXhrljoGlBNctZY6gbLDcMxQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfX64X9caLqLyIb
 7r2txS9xEPLeD2OcFB/ovhzuy7yJeyKrKrJu3NvWUwJ/M1Tf7USHnh4CCXtwLyEZzJUrdC1MfLY
 cWpZcrrtYl6HXlMVEHpulkfGDVAnOXPIX1pVXcbrgSMIlhp8wqfqVEzwGYzB/VrUd4wSaqLvJ/j
 WZSpXSrlW6TmO5D3SdONMcE7zWDgpMn8pEZ0SM6qeU/im+ygoqtwWVpVyqBuwRJUXjsaq08es25
 gbNSIP8Lw4wDNjvDVJU3jULYZCvBa4dZ09eCUi90LusNH3SamWTB1C8NYsWykX9W7SmDaTzi20M
 yczgFA7vV5Me3gUg1mA8JwAS8XTubvQfk0JUOwLxmZIdbUx54iRrmWzBEYR0OvRnKDXGVEGhAO1
 NUQH+YTrrQ7B6mIapcF6hLiM10+6RGjaDUbdvYgSdFVoUSTuJQlXPcd0rbfzrU58oYEzj4P/
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846103d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LWVJsngSXhrljoGlBNctZY6gbLDcMxQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080184
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

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

I was able to run DP tests on SDM845. These changes are required on that
platform, disabling programmable fetch is not enough.

-- 
With best wishes
Dmitry
