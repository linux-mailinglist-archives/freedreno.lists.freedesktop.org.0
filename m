Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74834B3485B
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC710E269;
	Mon, 25 Aug 2025 17:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk8agO8O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5A910E269
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:13:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8iuTS002246
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7KZRtqKWnJbLSwQpwonaaONT
 oh9dnHVWnrg2acQzYvo=; b=Mk8agO8O4C2cyO+k9l7Xj0Eov1Gkf4uCPjuPRQSM
 4wQ6fsbjA/YpiVyRM8YA/ObGP8v2DaDKOjLcdm0yfOwhCC31FgHCcCD5HitKkhay
 vIuQ0Mb013VlU6lCNuJvVMH1tR2sbQAOn3BHCvKKjLs5/wVdfy/Ns+YqlnAE7rdm
 mE9MK91Y1t/PRgwMNhPuZwHR7TFdI2L6cV/jzJlIfF72naZvrVFatNoA2YPok41w
 fc1NEGOOqiqtdFFe/7f+YCKDKd+5HqE0hIBMukLyEt56/EHYikvNlHB46tdfICQ8
 66GtpfCd20l8YHMVnQsoSCDKyKx9AnuNUzcQ6r2A2r+coA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5dsgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:13:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d93f57930so118618576d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756142038; x=1756746838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KZRtqKWnJbLSwQpwonaaONToh9dnHVWnrg2acQzYvo=;
 b=PPHJZ9CwWTcHyfR36ZtRRum+iMsPiIn1aqAFjothgO3AGBE36gQO/KpvpczxhYk+W/
 4EYM1eCIot3+RsLFQeovflq/Okx4XQDhy02Or+XN2mwQR/mDv9+55f2xVIYOcBD8IQz1
 RYTlLfEP4+gDgc9G4XWjcuQa9BjUkCi0kyG1sDm8sWQ3mG2LVlh5S2M52oB1hZnT0bdt
 w6n01psarXEMZPeJltCKTwOMsUHrOgUkQFBpBeqCkunzfCtJxdRHb1m747RNShnodYGS
 9Z4nbp4zubxscBWTb4kBybMqfGpSiZPf0jj/a8PFBUb6sEGluybd5vDFziNIR86xOmgc
 xlNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQmeCEKwZ5k4gzQ61E8Rk9XxEtDdNLzziKgeShiuD72xj+kfPLbzDmr1dM2Jcwqb0QH+vTvz5S/P8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfpJJ+FpLCHH71oOiWLKczpAYva6qsSn6t+Oey0Kubr1aE0imN
 yyVjc7BIPjpIWnqfL222C0UaL589ePEzCKDwU/4rsiNpJE6ktM+Uq1A9ZvhCdT8KeV85squyKEd
 /FuTBC5kWoHZjk9Osjjb7KADAg+POYzwjebF+9NK9avu8JSlqzJAGbLNn5pCNSk3mDPaKSjI=
X-Gm-Gg: ASbGnctT++WpsOzFSuSkqjfFXbRkDOqO3TW2YX+8vSuezvXiiMjqMgjYpCJigKvr/Jm
 fHyPUBDoD9yFRYTL8nvKXTihiEIAgb4nVtErtX2DQGJisHB5q5Qx/teihVljuB7KNSrry6x6YsC
 fwllxDIqoHZwlREB1xmcZ329r+wfvSnfN3XC+GNAyqsrNy/eRnhl6SmZAY9mcxAj+mKwcgczGl7
 zXYqWcQvNyyfxV00sIxrxUBKwFSPtc+gWUDQLc4j0Aqt9mGtm5rr7sRYj9tFCqwe1fyfpxLs1lV
 QiSb70vDSrdvJYZFKuv5K1zCYFdjrbPG4EOMRa2T4KyEHYMxoco87xriq/uvafZT0HwEUUKTD+4
 sUIbVAcUFC72/kzafmfVwr/VqHQM9Au3z0NnzjpUvSch6d5YqZiFd
X-Received: by 2002:a05:6214:d8c:b0:70d:6df4:1b0f with SMTP id
 6a1803df08f44-70d973bae47mr165335626d6.61.1756142037810; 
 Mon, 25 Aug 2025 10:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdj+FFZ2fiH2yMSwN4KYEuhBhcuKZOiJBSCzLyu+64VlJ0OHTuoJtak8qkNW7VvT0uU7U8+g==
X-Received: by 2002:a05:6214:d8c:b0:70d:6df4:1b0f with SMTP id
 6a1803df08f44-70d973bae47mr165335226d6.61.1756142037066; 
 Mon, 25 Aug 2025 10:13:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5d1b1asm17681701fa.50.2025.08.25.10.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:13:56 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:13:54 +0300
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
Subject: Re: [PATCH v3 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <xwvuajrm76flwhnciclz3bxzj6vmvladm4t73mr2pyrblczi6e@wbyq3x2yabrk>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9VScEQpUhDSL
 Qz+cgEzA3j0CT6krosjXVykMqRpbp5f4uNQamxa0M9kHCDAOsiq/qly9OqduWsn1ervDGYB0GtC
 tVwy8FjxFdFoLNOHYEY4gdg/TNg89cGf1rcxL07kOhcGZ8OR8g7n8jVtLR9rHA7atIs6eAFQj8g
 h5quxRjMWj7PpiIzzuVz/U/Nxj9TyNUzeg0Vm+24Y3qp0nGwcOdXYLDATOqDQXP5OYoq6vryXzw
 c2f7/7heep16jHHba5MIYJ0NYtyfzsRGpYXMhP+WrYL9EprMNT1wVmwpaRCITWMnkebEKcMYXA9
 oSdXakxDOzM9iLL6dq6qe/z78hBOQNbwWkslr/GBRIQRc+BQWBs0jjJ88ynjuUHlYnDH27eK91R
 l3HIrS91
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac99d6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ryBzyUWMAq7bL-B5d80A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mWsS_CJ8EgEhNo9M0QDCA1dpo3bmAyrK
X-Proofpoint-ORIG-GUID: mWsS_CJ8EgEhNo9M0QDCA1dpo3bmAyrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
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

On Mon, Aug 25, 2025 at 10:15:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_enable() currently re-trains the link if needed and then
> enables the pixel clock, programs the controller to start sending the
> pixel stream. Split these two parts into prepare/enable APIs, to support
> MST bridges_enable insert the MST payloads funcs between enable
> stream_clks and program register.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  51 ++++++++++------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 113 ++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |   1 +
>  4 files changed, 113 insertions(+), 55 deletions(-)
> 
>  void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 60094061c1029bc7a06ffaa80d9403b40aa07eb1..2fbf16f27842bb7639efaa2baecac7bdf8908432 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -20,6 +20,7 @@ struct msm_dp {
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool prepared;

Why do you need this? The msm_dp_display_prepare() function can only be
called from within the atomic_enable() callback, which is not supposed
to fail and which is always called in pairs with the atomic_disable()
callback.

>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
