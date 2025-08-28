Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998BB3AE42
	for <lists+freedreno@lfdr.de>; Fri, 29 Aug 2025 01:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062310EAF2;
	Thu, 28 Aug 2025 23:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d43CzfJk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF74210EAF2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 23:11:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWdbN025049
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 23:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CcwPb98D2xg5sUyCBoeco6KS
 Je0ON7jV0q8gk3wftUg=; b=d43CzfJkVtNCcnXvTigbg9V2wZhs9tPvt3pGpY48
 UMtN7J9Z3LNjTXjydLSp1gFM3mmRW+FKQverrMHoObEWbtNKOvpPVszoUy5kwjnE
 lj+5+S4hExYK8MW+4ruwCCFZ5j6rwtDoIYG6zNKtleyYQuNot14ymqJexK20uWqw
 x3jJt1zKSPb9tHFJMl0Ss2O0/KZ59UAiw8mwK8Ax52G9Me0Tigz4ERp/IKiJsrWW
 RowNZtFJeEf1klzJSd9G+DJtizvZ+VxTpdrD5/Z7v975jxRM9zQjyioumPbd7tq7
 QQlofmvZrRGQbzU2a0hX11We+jnezP+nFvJDwGXCgwgjeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615t0tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 23:11:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b308e4de16so22119551cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 16:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756422684; x=1757027484;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcwPb98D2xg5sUyCBoeco6KSJe0ON7jV0q8gk3wftUg=;
 b=FokfiNyKTMIfp9U3bLfVKX3x561WHQ7iTx2P0ovDuLwxh4jeZd23ovXF+bqJikEm1b
 Xo0Rw5tGjbGChNFMejqZb1aL43klWz7SDxdhrhEjJPVZTDx2kl61zq3/JLoGkmISHskU
 rlOfd31qUupStI2F3pbA+pzg9My6L+jtQLfbkOLyycZ6F68TYYZTrWQdPjVLAi5yde1e
 gIsGKWOZY0xR0PS7M8govDLgO30mU3pTcPaEHFxRS0GWrI1fclgF7m16yvxCbNZR4WHW
 rete4Ah7vsGkFY38DnFEwOJOE96BiPgSwmdnCiWxjeHLoX8g7mXItlxMgcddqFWia/vT
 XDhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvPP6pfbvSv0wmfLyhsxD/yKjhtkFL5A1nuMxP813GLcuzHUfOuJEesE/ZlFhY/BQI3Tb/Mj+M1qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnlV8wRP8ASGPt7U22Ndmmx83nOMu04txRCuUMGpNv1kAZzMhA
 ijGGBZqdbMhgeVs5ce2mVvgya4ZMN/jK8+sE1S+3NStTK79uSHJVsvAXrK9u5UjXDSDmPQ2NxpV
 4eb7il906nY3s194OG/imOF0l+kmvpbug1Kf7Q67W4xIVDfHYQyB0hofWzYjGdZj/Vwz9He0=
X-Gm-Gg: ASbGncu9zT1QTed/ipMwKj7yp96R+ZVIdv26JjwNDOxrHXZF391rwWy2AREkcTNrm1y
 ESqagd5edxi0Hkf0/oX2N9AnX2Q+8yfIBGA+o7xixOZHGgTkDgKn4VIbyEHZJlJ1359l5xEfYCb
 1kb1HpfXSQ/gYnJsaktOLlV4LWdSEnGx0cpDSBVoHG36J3fUe+h3InNEPjpLIMPev7b5TkgCc7v
 bBFehltmDsIW8airXHNY6dxQ7VsZMFAbZ/q77zob46JGZrjwN3uRGUz/bKGFsB0eOfETCt43zsW
 E2XnFatN2O/om3AtAyMQrcQj79QhRrwCOxFzqoNGLWGGPkPtfYRmY9bKCfqoM4pX/zwr1f6yfN6
 B7DlEGc3JMHJa22OD006T7+juRGkjUZi0VSO9NBM8SsEqIVigpzRq
X-Received: by 2002:a05:622a:5793:b0:4b3:4d9:1a20 with SMTP id
 d75a77b69052e-4b304d91c8fmr37454691cf.46.1756422684212; 
 Thu, 28 Aug 2025 16:11:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhgdun2fn1jFqmiQbfyBvO+zPjYV9lB5FdqpEXRjyP1PtkoydoYjW2c/bS7zgz7W252CkZPg==
X-Received: by 2002:a05:622a:5793:b0:4b3:4d9:1a20 with SMTP id
 d75a77b69052e-4b304d91c8fmr37454411cf.46.1756422683667; 
 Thu, 28 Aug 2025 16:11:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336b4613c10sm1461051fa.1.2025.08.28.16.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 16:11:21 -0700 (PDT)
Date: Fri, 29 Aug 2025 02:11:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Drop unneeded NULL check
Message-ID: <l5t72pobsea2mcsulxsomrqpbeezj22vdtp7gqg6zjlqwzkjgk@p624paf4vhn3>
References: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717151202.7987-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX70iSuSYe3k/i
 T0CXLQFPEjvE2Wcuhv8++SQ6gfnvE0LqIcy4/BhL4cgz74H5brj4sKRxOxXAfcADCSXh+O3nX22
 6+/lTfw+9p6ylLrXrvwx3mGvv5fttId/espcsXZpWxS3bKm2p/e5DcVrJZDHvpTke0YUS580ic7
 1NfM5gebrAmmhYjOf+jCyR5y3Vfw62n8jhAhw2suYH93BEV/x3bxAXXqwe0D5c97X6ZneiBFIVH
 Q+TM4mF0BYB7PxDCVhWWGmj68KJCMbWBm3p0C7FhXNjT7HysxNdglnNoSklOlKsgtZMv6PXQvpb
 I3MURHi1UqqSpbMvknsi3P2RUadTEJlkcoyLtofvrr+0nzE+gmPcItVwUoRvTOolhaCTu25Hvik
 Knq86WOZ
X-Proofpoint-GUID: REtoOYsM1NqBMI82pUjJs3QqcIaZLLyw
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b0e21d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: REtoOYsM1NqBMI82pUjJs3QqcIaZLLyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

On Thu, Jul 17, 2025 at 08:12:01AM -0700, Rob Clark wrote:
> This is always set in msm_gpu_init(), and can never be NULL.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
