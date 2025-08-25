Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBCB348E7
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C8A10E042;
	Mon, 25 Aug 2025 17:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPuI7xgC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD810E042
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:35:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGqlcm018243
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kwa3vdgYtv702TKjlFEOUh4f
 oh4EffxBoohd+2TNwQ0=; b=fPuI7xgCZfYig0MelwbZl/WiuZxk9xEJf4+qVP/U
 euVwGsfDiQaNX9IVShE/1HWHt2YyS5lASSrMkJFCBxbMHQNrckcW3zDu4OCWONSG
 i8ySVPHaiVRitazJkR6LGBeTvKM0iy6sDqyPNBiUn9krj8qZ/IxWdoq3Uloxqr7P
 jH6VV0V1z8yAT0KuYWu3EY5jPsD3lQ8AcW1nDry4aXfRwRf+fy5VwuOe/OLPJ9xE
 quiI+uxUGZdivA1drOhdtZlcwR9FMBYBAUnemKfpr5JRzYFKoJug2rNjicCjs4qk
 VeXPBBsBe5yaqxoxAHrsZnnoHPSQ8QB3C5858cTbtnz0gA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615dvqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:35:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b2d09814efso21479571cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143351; x=1756748151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwa3vdgYtv702TKjlFEOUh4foh4EffxBoohd+2TNwQ0=;
 b=LeL1B6ze8eW+ydAD+XVmkiS3m6vSlfZjsMxfa6THFZ5Zc/Wg/3XkzgVE2nTz24IbQo
 d8CqKI37Cp2SfCgPJ8u9CA6Ar9sTJH1nqPCEQoNrK/XxW2ijuK09A0x4L6TEjLlZyWZ5
 JW72dWWW3BrV/2AFgMQeBjCLsZGg/Co8CH1n1Ql0EaBe969+aK13B0oNMrBoUX9ob10+
 3Ue5/1pb+SCMTQjgE6eAjC1IrUdiG9DyLwre9STY09BT8Gj/EuqSoKsV3667wq4pEqSS
 yTHncXmwQDjvSnhNANgDcm4Ma6AFr1N/YesPX39ykuK2VZ9M+fv/+/ESPM4zQUTx50AQ
 Ab1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiXEtZgFYhsZjyt7tyXHT3VJHdouZnyWm5bNU0587uI7VM3WK/jmKXwDP1G3hjSWBUopmdDa+awVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy99ffHV68AkD3kPbScaE0F5QN/of5FxJrl8+HnE+nM9hZpVbBB
 UvT+2UETLcpKtAZci5JkQRlI1JhXZguzIUEiqcA3zkH6kwgQUHL4dvHaeufgb4m9ORbY8RMSZoF
 9gNCdJA/7iVkcuyzw5n/bqf1/8gB6bi2SNgnk8XEidp9Mcs9Iez5h7V+U+d/BmeStXUl0rZA=
X-Gm-Gg: ASbGncuAbI/pKz6R5vmNfid60rWtPUaD2vJDgUgNKj+pQLZ34lZ6CTvMb/Yp6sPVbjq
 trg8jXIib56jUOjUfgleAirdeAnsRHzYh4IIo9bJXxYxBMyb4U2XFckW91pKmHqKmKmhPsD+mO/
 GrBNRjagh06ReHoWfzwj3kXyp72/QM5VDqAuiVN841wEsgS9Z1uOBYlZLCbDAbIAK2NpRZMENnf
 zkUZzAdK7lS5Cdf5KDI/CGb+LVY9kg4cBne/niYrq/B7NATnMg1c8c/ZAWL0VZHnGQhxW9fph8n
 JflPuub/zDGrFiZIv1UULoW0VMUP2jv3KUUEOWgrJIy5a8QWhGbuJKPBXgUQYm3/BFbKmuZ52yB
 LyaqyVzp+7rTwHCgAUox7fPCfez2wp6lQ7n+KszMHufT7hHTZ9Tjh
X-Received: by 2002:ac8:5885:0:b0:4b2:8ac4:ef8a with SMTP id
 d75a77b69052e-4b2aab57b3bmr163573611cf.69.1756143351064; 
 Mon, 25 Aug 2025 10:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEnoMIrJ7Zrpfy4CLQqO45/pFwcr6T7pVHZ+N32uTDgh7RXtgJOi343oTo0GJcof/9i3w5fw==
X-Received: by 2002:ac8:5885:0:b0:4b2:8ac4:ef8a with SMTP id
 d75a77b69052e-4b2aab57b3bmr163573211cf.69.1756143350550; 
 Mon, 25 Aug 2025 10:35:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e609f72sm16550321fa.71.2025.08.25.10.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:35:49 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:35:48 +0300
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
Subject: Re: [PATCH v3 09/38] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Message-ID: <5g73qgwgog2ch36faqiyluhsci7ungrxnovm4qgidk6n52qa3w@lpkgkzlofyvb>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX6/WSD9NtCb4q
 S1QY3G+fyqk0Io72xNaDu/nHODSzrcQqWRJwDqojIGmIAFkQbNkCwAX/cZE0PRNEVl4sI4PXHIV
 WExdVb3rLAKWQEtPQ+LApy4pzjQwPNrlyX2ANq2m66vy9kxIIDn0Ol3bWYFFA1CKyHj2POm3DBh
 1P8seVKeCYveWhxHaeZ0aTbi3Z3+qfG2+kCVRzlu8JmnYTXyxRzPIV3EJHG/dpIdn3uh3854oix
 5Fn6+WxJZfThs3+DCor5HN3xyE6ydons8jad6ZuAVuuM5rAjUvwINjp7BFwEgpBB0bcfUysj49Y
 AE9l+YlciI0TsCVRk9oH70po1KYiztKlxHEYBOUbsEEICpzYiQyr1Z5l/nwNWzC0lskflpF2tKL
 dUhlBmTS
X-Proofpoint-GUID: x_ZsbUeXLt--CzpJ7d62L6UOiSo4thbp
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac9ef8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=z21d-uj4LOo1IgCTbOgA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: x_ZsbUeXLt--CzpJ7d62L6UOiSo4thbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
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

On Mon, Aug 25, 2025 at 10:15:55PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Split dp_ctrl_off() into stream and link parts so that for MST
> cases we can control the link and pixel parts separately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
