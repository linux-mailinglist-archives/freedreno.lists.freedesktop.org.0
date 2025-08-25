Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F771B34EF6
	for <lists+freedreno@lfdr.de>; Tue, 26 Aug 2025 00:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EED10E552;
	Mon, 25 Aug 2025 22:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0VnrkVE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1560210E552
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 22:23:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGBZA9025970
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 22:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fjH+xA5Hhh74IqC0r3nz4iYW
 +qHZrS73elo/5Si+ukM=; b=M0VnrkVEwZb5l/PpJpVjvAG369Z6ozbEsYfLWRWK
 6B6QwwR/BG8/zXlbCj+DMb82ZTPNhdHgJRHn4G2Yic3ns5VUKZzcapGJgongaPCZ
 9EmgKmIma0wZtXMtyfGV0joRsi6cUvE47VUpCWYlVPoMmzP5/lBpauK+qa3OGows
 QGmOZomk5chmEDbCpuOl+Nvi6zLEcoR/E4tjEdBQsSqNssPmKEf5vucfeiQSV8oO
 avkXP8h5eZ6PmLMnEw4IFv7SL0ZHtrS5kLlNj9Xcw1f325BWHid2nWGCxIMHYZgH
 yHoO+TZ/UDFjRCjY8PIKr9vpO8tNPp/uheDRSqBfja8SUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unpj1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 22:23:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b2d09814efso25713561cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 15:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756160606; x=1756765406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjH+xA5Hhh74IqC0r3nz4iYW+qHZrS73elo/5Si+ukM=;
 b=bc3pm10zgi4/CzAPDiuk9LFNm3RpbGwGkUqf0JZ+a1fkzKJkwVYi/a8sqcDpkcPf8c
 eRNsnHrvk/rv5Bhnx611fqzxRIDofHp1ssyDL1D8YkMjyiaDNXpRZTEAdnOElD0yTo5T
 wx05VNVAjOIxZBwsl4NckgmIBEEFc/qoB0A+b8ptCPYPtzUCljCexRlmypi0g1xjzflJ
 XFVkPHeTwf4hvh/6Wdxbkj2m7fT2f8Qlno75FpXHpnDmJ1iYWjticUWOdiUm7iHyjk2b
 vNi3dOMgoqpXWd1C+RMCEzvZZSimxT/Kw9t0aBTV66nKmx2ag3psgPXEUhtoap4CYl17
 nJsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyU6jHvsDlWqaH8hyArkSnt3Dnw65EVeQ6GsmXESD+sI8MSQSeZ76CV7SfISSjA1XXpoD/4EgyhWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1Vr0SGZy/yT5bRdxWpkClnYoYXpbG8mtVONOXtHVp/fACOcYQ
 Z7hLfHLwR21p5FnR+HGruztJnV0/AWk4YjIIyyGkt6AGtlz3bLJJCa/tSthIKmkqGlL0PzErwm0
 rGyuCBoj9IxqFkgE3yuB1OaxAyi4ycg+MZr6NIWyyI36Zz8FKqFAJvDvNMfea6PfG4hDnP5Y=
X-Gm-Gg: ASbGncu8F4ofPH4j6V/8Ac8+xCMfRqYzktvCXIjPYdGXAME2oz78weS0MxSRAaA3CXA
 3DucXcLuylA7oXEY4n+JMo0tdJSyJ3wjFyQi+w3RUGly5noX1c5yFWfbZ4TNhcKirtd0yr2LkSg
 kULf78DS2J0ZnLVam9n+/5iCFqRuts6NdukEzvRafFrWmAM4mlWCdqCtn3FEqFTY2UtIMBEs2tX
 SWQBVCZEmvuBwXoA7ZHMiAkk0C7nIjje9y3lkgkbjCfUIt7AA+r/YrivUXa0aGo2iXkclmfv0Dc
 2NHXI3WZKhAKoPdBQi58rH2qzw50V5QDTLPcb/E4bXKIV4up8jqYIWMCOIPi8zVHm2N3rdnV9Kh
 A5+QFaYYMBNF+fw3aPyp6tUowzjMLaoq6HjosdwOm2VjR9TEQ7vff
X-Received: by 2002:a05:622a:2443:b0:4b2:8ac4:ef8e with SMTP id
 d75a77b69052e-4b2aab65f01mr179201291cf.73.1756160606382; 
 Mon, 25 Aug 2025 15:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/gWs5Q3U2MNb4IhmQlYIuCMvPeaLXJdn7Nhfi+5p06NJqrdTdO3fCjgpZVxrr1qDOV5nUzw==
X-Received: by 2002:a05:622a:2443:b0:4b2:8ac4:ef8e with SMTP id
 d75a77b69052e-4b2aab65f01mr179200941cf.73.1756160605874; 
 Mon, 25 Aug 2025 15:23:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8ba2dsm1836524e87.77.2025.08.25.15.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 15:23:23 -0700 (PDT)
Date: Tue, 26 Aug 2025 01:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 25/38] drm/msm/dp: Mark the SST bridge disconnected
 when mst is active
Message-ID: <bgo6yni27nqe4gkhvurrnzvgih4hn47itpwg7afgtctspin52n@mtf7e2jzcukb>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: 046lFuB1iJWu0K68f1AOCUfHwDMvPbIs
X-Proofpoint-ORIG-GUID: 046lFuB1iJWu0K68f1AOCUfHwDMvPbIs
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ace25f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Cr4VjbKX6U7v81t0Q-gA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX/PzqA8HM8E/A
 8DWI7SEMSoQL01AL5TvUe7Qhm/ozCAm0UripHMSqrGHeOHcKgoPk+lIciXM99CzBOFQQnwziEPi
 8nWHSQHVsF79uy699fsEyi+ceSePRg8SAGWog4lA+021AYlwcO1IXOP9FXq2Cbck39Oivf7pIVU
 Rv8c8HpXD/IuAPVdJ5hG9Bj+eZT0/HJoBKfkNmHyakt3SBSMWfY2Bo0wHuyGgjLBo1T5Xq/Rqr2
 3tQKdhXS1c/r1UkMsTF4Duz1WXknYN9usMXLhgdJITFXqG8PjsSTC0w70h4obZ3EyUTi7yZgjTX
 sUepkYzLrMIauRZyHF/PQqLNw6QVUHjSuxM2fOtGuY5uj6GzsBOMBuHIVimkeukbLpp7kvuWEKR
 9uJ5Nnf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

On Mon, Aug 25, 2025 at 10:16:11PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The bridge detect function is only applicable for SST. In MST mode,
> connector detection is handled by MST bridges. This patch skips
> detection for the SST bridge when MST is active.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
