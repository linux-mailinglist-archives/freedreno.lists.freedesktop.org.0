Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828E4B5330F
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 15:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1D810EB21;
	Thu, 11 Sep 2025 13:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMPIOm8A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572FF10EB21
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBQafP015928
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WOjKakWSJUNAIQxWsQlAPujB
 r+5TdOe/svr2H2na+E4=; b=FMPIOm8Awg8n6eaKaddTiTh3sj+RnU56NbVJ87hz
 NIBlaXAAIkvKo9pYDptzD3yqHm8DJBEOs0yYNKTLay5mxJY9D0WOsxnodTlo5hxi
 xR7+vm5RPDaoguYR9ZBi46k05KFoOD5f7Kt7cy4tioE45QskcOYQGUOsCONy3s05
 Q+6/WBFo9eU21CNfir16Os/a0iGz9/VfLR84RQ8LzNCi6uFRrd1RgTU0NZTrZBsq
 d0EKUsDiVUyjUz4mnRvBJyfUsxUbwORJa1Hgd0DuyWS8IhyK1IvDRJIrbweDT/Vi
 aYnm6VKk+hH4kIspiUYJcvqCdZ7O+XlwNJRUS7v7Nuvlbw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7kh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:46 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-61bd4e3145fso682421eaf.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 06:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595766; x=1758200566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOjKakWSJUNAIQxWsQlAPujBr+5TdOe/svr2H2na+E4=;
 b=UrsSfxfyCmLpKFD2MGpeGXB3UY2TyQEJhYYnr0C9ZdNx9jsN6ya06VwAtQUWIAoxrc
 dIWDStDcD7e+dNNlPSQCsZNGgV41Spb7OSeL/g4EhdZrLjDoNsRsObGeDJE9clWcffrr
 0bnKbfjXhRJNaxLoIgW+3fyejnk9Od+/OPTMiF3oi85JEAnkxeuzXKoue3KU8C8hUFaL
 BPcQfWRxx2ZsCOJLxmHNzfUHQhycqkOxKG10WR0+1VFl/BcNpevQ15aAHfdrsHH+x0Tv
 nUW1/3e1jN484nYg7zLl6kSsAr3qEfQ78r+Z/GNvEVUlU7qfHqhSFjYdN437aQNvnvfQ
 mP+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnp3H36B0gjaA9KDm187r9z1ecOEDoUhT6+kaM/WoyqGXRR9uvQ7Qx+6YH+xBcdDJ1NeNiI0W1Bmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVzJKLSLg4s5EwkLDDMLcErb3SYxoK/po5LUnKtZGgYjNZZwXJ
 N4GXSoo5UW8smPV9Rx8dL3EpOy/8p5Gb4h08YBhhjhsk2iFws6DTswGoimwSXNQ1kw19YQB/atU
 BKjAo8Sh/P03zICZUHOb7j5EM6U9dmc73JNf9dbi5yCOCSdQIVEloTpwVyI8fdy+AH2rArsA=
X-Gm-Gg: ASbGncs0Cxt0qPRMXwuoJmMKQ03n0AvboDjL27Qu05KOGtk3AR9IQx2WUT19B2gOwX5
 iX1SjnT/cF59ieGrgfx8Lk0ujgMj5XF5Y7eu1lzpf25iL++gyL/UW2EPoFnxftdM8Rv2jJ6UkmB
 nM+ldmQeg+tt7z3dQ8p1X0q5vPi0BS4loD4iycS61PRKSdnOv5bd7MWesga1QJ6NRcalsR3AL8E
 3A+LppsZmbklRP0E0Br7E9yA28MZ238iutFP37sERamCv7bB8ScR89EbTV1LW0tY3CbXE0IZyna
 UnGddmk0geD/GdUWqSkb9+rxvxqeAqQWvb5JfLkk2h2hH3ugtzP/4R+K1KiqxTIc2WX7oIGdrAe
 VqSUGlnR+6T5u6i+7E6GCLN5wbAEEnNi3qFQPRyd0F5zlzqQq5ciU
X-Received: by 2002:a05:6871:9f23:b0:329:8747:1653 with SMTP id
 586e51a60fabf-32987569accmr6700542fac.49.1757595765366; 
 Thu, 11 Sep 2025 06:02:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHllAsg+d3b0kcKub7S1vojdU22rC6Gpz9ONEV9J6SRbyOSxxcJp+ShDd6GhvzKBP0tyHSfqg==
X-Received: by 2002:a05:6871:9f23:b0:329:8747:1653 with SMTP id
 586e51a60fabf-32987569accmr6700417fac.49.1757595764406; 
 Thu, 11 Sep 2025 06:02:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf2f446sm425872e87.42.2025.09.11.06.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:02:42 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:02:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Message-ID: <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXzCG7cTe5UKPL
 cIG1mncWofjcAnoSWXLwbgnCqNGzHOZpTeJjsU1on9rRaZzAshq8YwOEpTlX0alxQsBLkYYm2ss
 yhZj7rVRX1tjdKCJXXg2fLNW0UsO5WHDRR37twJNSsfwmhM5H9UVLPaUHm5DrHvm64y0Uj1cBvJ
 mPbIp1Iwb6qeUbHLYACmjKZ9BOSoldTGqcNcbTVtF6QcUPaJJIwS3NmOdGY5tSOel+b45f+S6CX
 VtH7433s/R/LQldYKpJ9KWivHq/eYXMavUELwaZSvMvlMcn2Xf2GfBWCNV1Bt7moGOcfu3tNa2q
 CSZ7BWPGlred3t1w183+ZHhMZNUg0GtP63C1Vt+HQUyoxN2GxALk1NycQXDYYwGZ2bXa7o/WgVA
 hmZv48gz
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2c876 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=cOPp_-mWbVNMstl9cqoA:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ai8dhWlG6bWsgBgCpBM8QT1Po8xWULcY
X-Proofpoint-ORIG-GUID: ai8dhWlG6bWsgBgCpBM8QT1Po8xWULcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 03:28:47PM +0300, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump. Differences are mostly in the DPU IP blocks numbers and
> their base offsets.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (6):
>       dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
>       dt-bindings: display: msm: Document the Glymur Display Processing Unit
>       dt-bindings: display: msm: Document the Glymur DiplayPort controller
>       drm/msm/mdss: Add Glymur device configuration
>       drm/msm/dpu: Add support for Glymur
>       drm/msm/dp: Add support for Glymur
> 

This will not work without the UBWC config for this paltform. Please
include it into the next submission.

-- 
With best wishes
Dmitry
