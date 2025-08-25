Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA3B34DE4
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 23:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47010E580;
	Mon, 25 Aug 2025 21:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgPxhqlt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E0010E582
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:24:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG7YmB009700
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EQDx8Ekd3LgKr5C8JKyRUgZa
 ehoO7DCfDNyEHU0DkbU=; b=NgPxhqlt/xhwmOcuWi+ZGzi1m6NPMJwUGvHv25+W
 BNdc24dg0JqdLPocZVH3TZBTH9K/zr2efrP0bIEW5ykRclCrAnpp39xwrDMfSdFo
 vFfa4IzPPVsa181ExoG22tM8ccTMY3BkSkZn0Lj0fOCzbLy4dr48Qjgp/xk0DgeU
 KxwJhKBHpR5pfXp7CptefBCRsreS+RQWfLMp/a32RineUIneUipBvc4gBtFBzeGA
 7ieSURl9OODatVvd1CtAwKYRc0cJHiDrmLW3zIcFTxSfJ/vx4ZSnsCxVydVpb5Jr
 4B5uvQRpJCrwWMZNd8vtn6synnn4AxP0LI0zNV97gtJHNA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2pmv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 21:24:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d9a65c239so74830556d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756157070; x=1756761870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQDx8Ekd3LgKr5C8JKyRUgZaehoO7DCfDNyEHU0DkbU=;
 b=gitV5fBT/v+yq1H8Oa6Ij6xzme2jtvVGiNEglddMEEiVccC07HeXR1oePS25ScJInv
 cv07LK21fD6MEdKYayfh5y1mK9Ee4gU3h12YUDFGSzL2JFxj80n45fzURAvxrobV0a2W
 5tnoZs/PIRIlcIsiX3c4mlgmmpPbwn/jp5OUM0vMKKBLAUHAZlHX8iVqzsVNEXE2sqwQ
 wLWx8M4eYYEynzCbA0I5sboMP5piqCRcplVhS0lIYsDs4LgGgY4AMohc8sQ0CckJU61x
 N773fcWwoRSMxktu4ZC2jlx/ydQbwZwTlZClT3pYHwNEnzqnrrjP6LEQ6HsTYOgL4qOF
 q1tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYHJf1+mI5Zyo5R2R2gDwb7OQqYmdq8Dp56hNIjKmPjWpQyQigb1+h7Q9t0ABQCenkhq6ME6IHu38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxubEnRZOk8AUoV3NtjKrJkeDhry7XGzFT0OuLE5Xa3Wipb4Oz0
 snv0BnHmnx5GTbq3b9Q03FzS/2dE926PyLnV9FibGYOWofJV2S5EhLvYOC6nUy8v3Zy6JSWvNKV
 mmeggpgplpewhGU14mbkEI2liIaGlq/eQgMgHBnI2k1Vdz0WNudFcrmnLh9okBzxRZwMHDMA=
X-Gm-Gg: ASbGncue2IPFRHnWbmG78rqSfbgpbIt6wq3tGf7I+atERSJ5i9Kx2AamnypkoGVQDkP
 lGW9yAM8QNNEBrF40obqGSVBs+jhX9j5x4O9VCxNE3+wx+nkXM9tYFjFmYndpzmMxCja3vP97/Q
 NpJyowpA3J8npIRib+WG8WEpPzJE327rV1FEtnDk7EcTSErUvlOVYk0fj8OJ9JhrtDBlzHMYBtW
 NfCB5oRPtp4ZHa2yyfddH50D0RVyrdLynQpNO34jhNGh0V7wp9sQS3qWDifZ8sVHMKfMXRrp45i
 x6QkR9RvrafpctqR+kk6di3fQ165Mkb6/UJY80xGjhgXx4hSr/T4qy0KYytlpX+qXfShS8p9t8/
 PIhR1O4GhD9obyi+mM67EFd5clRw/pVPSuEACwhRh3IVmzTTjtNqz
X-Received: by 2002:a05:6214:519a:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70dc9017863mr25628706d6.41.1756157069669; 
 Mon, 25 Aug 2025 14:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4JBxu6eZccnvdZJRTroWtFNllocYD/kVOyxn7pmff5QlDW6XmknGCCRLSE8cvLFZ9mCVnhQ==
X-Received: by 2002:a05:6214:519a:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70dc9017863mr25628346d6.41.1756157068897; 
 Mon, 25 Aug 2025 14:24:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3366fc06c65sm11094811fa.60.2025.08.25.14.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 14:24:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:24:24 +0300
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
Subject: Re: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in
 mainlink control
Message-ID: <ahgabnh7e2zszqjakexr4755orihk6afvqlyw3lvcffyvr5muw@hmy6kf3ociku>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68acd48f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Dh0pfIAITmfDrERymUkA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9XBWgXYe+wgo
 ERf/9xO4inecSXBgxV5EMQlxf2JvM2YPDOlWrXsAMwfFKqr4ClHort7WtHiSc90mvye9Zyr43dK
 TxYXqGdEtEXcZ4KRwQmEq+aJWAA0I0p4l9KviB47+vdAyU2srcQfoK3lhgp+iTdPSNSg42yQWew
 iQriNc4dBX3js477E0UX14uXCwBnwde1WpGLuyp7dwEIyrb1yaAE9RE+kH2rP00MkAUYE8L/yXR
 PfQ+PayEkuNj1eetk5P2kY+6sOt8hm2UmqURdKAWzRnFED351O1KoQdXJPqq0lMxltv2d6x3lNe
 K0RQ5tElp9RkpOt8mH43dskEVVta+qNHF5hxoIAP59kkIDdh7C1i3QUPo66nDVei+24Fh4rIIWh
 e6452PAI
X-Proofpoint-GUID: 1hH4BxNfWKZ272SKbiq5fDX_KgCjKd6I
X-Proofpoint-ORIG-GUID: 1hH4BxNfWKZ272SKbiq5fDX_KgCjKd6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:04PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add support to program the MST enable bit in the mainlink control
> register when an MST session is active or being disabled.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -128,6 +128,7 @@
>  #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
>  #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
>  #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
> +#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)

Why are there two bits?

>  
>  #define REG_DP_STATE_CTRL			(0x00000004)
>  #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
