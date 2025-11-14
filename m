Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68635C5B3C0
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0289D89950;
	Fri, 14 Nov 2025 03:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgEEV9dv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTw1IpRM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E532C89950
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:51:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb3Sa1487583
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WA8Pr3rs98Cbnt7QTDamV871
 sv4DYRXzkpojMhmqMxk=; b=VgEEV9dvKW+QCdwH8pegM62gA6GJZWJc1GLg8aeA
 CrqQlVMH5qtq5SK1slbIkPHJX92pOqrJc2iVUC9oqIo07mu1k7YaeFTdAD6+QPjw
 Hju66sMzCVEojW8XdZXjAzgJWX5ye1fZFj1eSt/1XmteeM7XwNBf7FpcbVNdgeBf
 Prhop8vht8mY+2m5eHvrZSV551UG3CigtBbq3DU1Wxj7lkPsBDdtXFNfwTj6uKKl
 2RLkoBwnt33uFSUxHdZghIpjVy9+BHEamkkbYmTVyn32TnchRemeqP3jf4EQNttt
 SzHoSvBhqbYKARVvZj2JWAY3NeLh9FCzgG6erFNSoQTYAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hrq34-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:51:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e89f4a502cso43434511cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763092276; x=1763697076;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WA8Pr3rs98Cbnt7QTDamV871sv4DYRXzkpojMhmqMxk=;
 b=hTw1IpRMa++vZJx50LQCxDH3uJQ0hwfBtX+q/T+TJPlxWJcF+T97SOjMG+u5rxm7Aw
 IFyHM+6aRWuVwoWBisQnzzYF8r4RAZppmFLwyMtgAFoqyPkiVdDN6DrYude0VETJuBnv
 dDeRU+nxgnqeO+r2vgiCEsQ5YhWmjJZT4B98CQfatU2kPECUcAmkN0sFVk4N2g1h1gPT
 OIDWequtmx9duVlvcUh3rYQ50Ph8htd8eiwwt0B/dHIExWIt1TrertTxXsbrj7CKNuWj
 aL/wHSHOfdAejRCJ7ycFrsIAn1gLtZfClAyjicjwdCWF0ZaCJrtjnO5Uh56TByEF7tSU
 zy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763092276; x=1763697076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WA8Pr3rs98Cbnt7QTDamV871sv4DYRXzkpojMhmqMxk=;
 b=UppuZB9cZu1S+vEZ0RGHgv5gS8RDBKOtwNPl8/O2K2Lz2V+C70CPxGZXDdKqhKWjkY
 6ZnRaxi+Xfd9sKaY47rFs3rw8mLsY1moQE3awvu5XdWDnvr6JLlJsKCPFY7zVyysUJ4R
 5fr82FMGyFeCkkR7deoP2rqHb1iiq22ml5rFZtXonCL78R0G7Pc1bGHFuC6o8lM593nN
 ++um0FrdS26s8lCX88L6T6VzCrYOOCG8YaRHsRrE0RsRlaMZ3mHa1DyidpYTuxqikzy9
 Yobo7y16OuC+ebEgMWQt1R/tm0W7DYLJkvAORqJyxKl1SF1pNytWwkgeLncbgLYOOstJ
 i9hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmpBr0+ikVQXfDJzwKopFHpBWApYr1Db6QM3cMS0+caV1II6kmaiVe4lSkKHyZmD+ymhuKKikPYuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk/Im9s5YI8oaP2CuEOd0xBI1WqJMfRQB69ww+GHkEN0U9JGyB
 7b7j3SPyPue8TftqjcPzjCZqbAEse1g4ZS/IgfurrFGO0lNX63TM3ncFpMW/6EjpStCYT5Hn/ap
 xu7Y9hFLcBHcHyD7E1YQWR40FrsUKu/c5L+W/tvGyXJOqOqX8OX4L+ZrR+d0GVDmL2iXT3nM=
X-Gm-Gg: ASbGncvqPM+WDeq3AJ6Sw0YYkuj2ookAFoMVQ3mCCx0BNFU9Waecsj8Or3RvYhTo2f6
 Tm4tNONpz5807xIsH0JU1E+7PpRDZvMZlhA8qJAF0S/JOlG9l1W39MufEnrpSUFl+3AS9O1zri2
 z8a4tRRH8luWSQEG0KPFkeRtDRQaHK4XmK1Tw2LoP8LOKNlBYLdttNRYK39+YUEueHH6Drx5zVH
 M/dZcbR74Vq0OY17S3KECMLEwlbUJFwEbWSVkc0DD2b7Az/Fju2lz4TZOwPheAIBfccLm59W1QU
 y3O0+lhxOeIpe1L9a6YIuiYkQx2KANeO0ZiCY8Gi5hlvBlJPmDvEN94fMMNuNtKW3a0JiTnrjgL
 FaFdgKTqAwc6WI7TK16049WJu0VUE1j2Uvm+uVwMt7G/N+dOsrWpRiau7E29tasxDMpIdb3Y0+X
 6Q6OO9u8S+cYC8
X-Received: by 2002:a05:622a:10d:b0:4e8:8b15:3180 with SMTP id
 d75a77b69052e-4edf21647ecmr32176971cf.70.1763092276398; 
 Thu, 13 Nov 2025 19:51:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGglGhnKyfb4md0LOfiFtq5AkSBtaC8cwHdC1+0NXzOVrGMGqvfys6xNubxOq9fdeveH3rafQ==
X-Received: by 2002:a05:622a:10d:b0:4e8:8b15:3180 with SMTP id
 d75a77b69052e-4edf21647ecmr32176781cf.70.1763092275932; 
 Thu, 13 Nov 2025 19:51:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804056c9sm797010e87.90.2025.11.13.19.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:51:15 -0800 (PST)
Date: Fri, 14 Nov 2025 05:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <3uwuzwxj5elwpciensgvcpp5vk3x6f45jy4qvnysw4p72uanx2@x3v3lesvuewm>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-GUID: cPWQd5Uti124IeAPM5QiTvs7KI3SDnTd
X-Proofpoint-ORIG-GUID: cPWQd5Uti124IeAPM5QiTvs7KI3SDnTd
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916a735 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_rVczFtdL_8dPuQia7UA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX5Q7qyleExsvf
 fGNtgSfOnpZTV1euxzSCkK5KqxY+dnd/IFyVCUgnMXZgqyXFeiRMDKw3LZsR9ZeyiZUtIvTB00c
 fgXae3+KUVp7UBQecyRY18lmc03aMu3/8htOBiTyW9HkbynhAlB+38iOp23bpkIe2S4DiUqgROU
 QViw6QjqvMALnwivyqErCt9fzJcMnLJlFtn9JRFfr20woVJnoS8tiwXT0DYtG+pNy7+YDNIUMin
 5sZ4dwyOkyU20WMe6O09myHcTUrfQ/bPlzpjTGBfmh8scsCf2kgiSPbkmiqYtSM3m5zKoaEbSQZ
 OgDI6ezXNY3PKSkJCQQ4L2eZcHXaSwsuePKSZ0ZdaLkrHUKeQOAI8EzwkOi1ft1Ep42Abn4A6pV
 89eubS9hVkj1MZ5vkbF91OfXq83FIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

On Thu, Oct 09, 2025 at 10:09:32PM +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")



-- 
With best wishes
Dmitry
