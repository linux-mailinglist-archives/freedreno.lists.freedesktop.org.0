Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAC6A9D11F
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 21:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8623810E98C;
	Fri, 25 Apr 2025 19:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6TV0Lox";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC8210E98C
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:07:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK37g013130
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YJbYuN2gJ/vLBVO+7ggEakIk
 yWo8fYN/fU1HKulgY6I=; b=S6TV0LoxN9Hg9UrUvaO+4Ci803NRAtkxU5Vfo6rY
 80rUfOdGhN1a9MfOxX87Am9700jbKmaBiTQTkA1uXadpqDCPb5QEgrdrERyRE9NB
 SMy3ULr6tezjisWlIiL+16hKKbxqPD2abNFbLi2n0s0qarzJsOVtpMgVB+TsjBmP
 4Lqc0a3p1Dv3ErRpy7pLTi/qBB/3XEOo8nL08zhNKHi1+sYkCMvjvrsQrmCbjH+5
 Uv5t3NKkQuino53SK5SE95mkEhprXs2L6YY+bsOxQu4TmkFNHeXYezhbVFYIfcxe
 lW7ZjJZR1vPgn0+QNr1XW8EFcyOOOYZiLYqXy3nUMGBABw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t40p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:07:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f99a9524so72474696d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 12:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745608036; x=1746212836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJbYuN2gJ/vLBVO+7ggEakIkyWo8fYN/fU1HKulgY6I=;
 b=HVLRiU2mKpe+v39Zl5gZb9SlvHeXWwB7oCWhft+mqzgqyz5XTHfbY2ZBmkgjRuZ0sk
 pPsegqntoeHu8vzp02iz8ZqVg0s0JxEIna8SueBVPSTJ/VdxyOWMt/NXRMfnL91NEp7r
 tGz0CdqIsjzPy78tAdfu/7hU3pNW3arC6ga2x7XU7b6NfGZOl1YKTFYks77+nu+E1Ox5
 gA3sLXpfMRSIUUKoPXrbvYKofHDBHJp/4x+KvdQ5TaKJPstMc2wTSMrbvV1fiq3UECyB
 GnM44tX/VPTkV8+zpxoC+3QAPD5Aw+60UUn6dfECLJ7SjD1y2sAaxBzMMOEn+1NDt7GF
 o5EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHK8aAeeT6JQJeb18DgY9zblbzLYT6d1UZSabwxe/wM2VbQRVuNIPyPqCUaGxM2Q+P6wWiNnXLzV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOqF7TV2VMHN+sHaTblVtaitXw5TrEVnPetMOSrI1hXWLXubPz
 /+akvNqKiFw8atSzr30cYorHG6vYayYv6bdoa8ehU02oUuKL2xnwbdzI+DMBGotFQLy3/MpziDr
 j4NU7Pkg44+Eqi07+NQKBmo9zqrIiFYqW3wciKvvQM2j877WvYLVlp0lAjtZ+jlnR80c=
X-Gm-Gg: ASbGnctv4Dn4NV04Hvrxf9pi+b9ibiB3d4NDTmj3XUisRZxiQbPZvjVEYwkTZ4QlLHS
 R0M6jSqyFWwHFZo3pUvPaGuLBnpcoLBBBioWZWg3+LjCkyzaEwufLf5A870OHtzlmqWWMpUvO5M
 aUAEEKNEp3Qqkr8uja2S/8p4MDXZf8AGbVyrrvcbjRjR/Yjn9HGWt/QUidHMwjh4enF4Ps+vseB
 w/IBzrDdV6YhQeNJJyB6p1qZH9SzE2+RvtVvCGGqzK8das6ZxLV59hSyODxzV60AqbblWGQ3Lqn
 RzYi2nROjehAo+1I475AGDle+n+W1/MPbe0dQTXtD9Eyc1SfeDdGZ1iSNRFAcTB8BbP3O3brylE
 =
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr115702585a.58.1745608036746; 
 Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfsamSTL36MZXKs1A+xdmyxqbS+5Cgy4qJPLYj7dmxRhp/lz8rumoOXUYE90g5yOpO1ztFkQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr115698685a.58.1745608036439; 
 Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb83b5sm712379e87.245.2025.04.25.12.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:07:15 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:07:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Message-ID: <zb5fqcnersry6blohozlzc3f2it2q6ypi4xei3z2fvzp5ogszj@mj23wsa64nqi>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-5-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-5-alex.vinarskis@gmail.com>
X-Proofpoint-GUID: uvcBthKmAfVT7KI6XtSRc4twwOg6K65O
X-Proofpoint-ORIG-GUID: uvcBthKmAfVT7KI6XtSRc4twwOg6K65O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNiBTYWx0ZWRfX/VzRzMta1fyx
 eSy8e4y8Y1MOnoFvEgP3oxIUwh/KTM9RV7VklvQVGWvY8N0A3/0NGtbw32j3K2pI/NH0UqbOtRV
 OdyoXimKz9kBXAwwDWTAnGccm3fdnvTldWrrMCaeCcbcCieuOY294wYN7Y6p5L594DVfZa+kPFO
 uP7WDv+EpWSa+yIfQiucnoqWFUrBcwE7DLH+lykEBzDonz5k0mePGjX8vO+a3ZOVi11oVN2Pma5
 2C1KLisSBIHfpQl4SoVY7E8M8xENK8+lOUSrLMHixehM/ZwnN/xJH986tdV4OOQxD4etj4t7chw
 d98a8J2xzglq5zxgCp3XovVc6upXpWO3aWtGFJQnlg/rK3tf0C0mxkIXiDgGo3oJLokc3JzMCDG
 71ey22FCw1gdrZv5rxUQVvOLDYE9jMCVFoo60x2FyI/VVBAhkaiJ/DaXiG2JQ7iXxvfuF7TR
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bdd66 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GOLd5LZXdg2kOnOye_0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250136
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

On Thu, Apr 17, 2025 at 04:10:35AM +0200, Aleksandrs Vinarskis wrote:
> DisplayPort requires per-segment link training when LTTPR are switched
> to non-transparent mode, starting with LTTPR closest to the source.
> Only when each segment is trained individually, source can link train
> to sink.
> 
> Implement per-segment link traning when LTTPR(s) are detected, to
> support external docking stations. On higher level, changes are:
> 
> * Pass phy being trained down to all required helpers
> * Run CR, EQ link training per phy
> * Set voltage swing, pre-emphasis levels per phy
> 
> This ensures successful link training both when connected directly to
> the monitor (single LTTPR onboard most X1E laptops) and via the docking
> station (at least two LTTPRs).
> 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>  1 file changed, 89 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
