Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED6DB20571
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1710E42C;
	Mon, 11 Aug 2025 10:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNwlm7V6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6171E10E422
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9Wg000632
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xUcHQjufN96j50i8isc5wxtk
 0rBCIWP/iFq3mpKJof0=; b=gNwlm7V69ms0r2+cku8n+dYK4oiEv8wxmw6sru2F
 Dk/5KoJBMvxCi9HJT6QDLQ3Nett6DKGwwY59zakWxEg40Ymp9nzDezXM+OJ5yt+Y
 1nY0GpVWZ/6hbiswN2N4c0/hhvjImsQDCzoH99Ig5NZ2flAhlrMleMnIcT7yPyB0
 0Chrjc6IHQhVTqXz0vSj5b+ERott85Z80cfK7wk9Vx+acOzAo3A4uwvQ5pMt86mn
 29iqKTey/mXBSylxXJI5iJcaqO1N2np4T746Z0sArngEa2PJfH+oesilWmOIwypI
 Ply3VV5RBqbNi+32nC14rD1yOKWuh2sTgeS8+cT0fPm0ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kygf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4aedd0b5af9so85279621cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908409; x=1755513209;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xUcHQjufN96j50i8isc5wxtk0rBCIWP/iFq3mpKJof0=;
 b=izcWlghM6YEjrGUgrH8p+ui2AN5EI/SOPeOwCnMEb6KX1qzWnHeb9N+ZbLmMmZUkW8
 RKzXGBzl6AtWR1RNym8k3D2q8IuBW2F5aMKLkzjvDx+EtVaBsRwOayai/UJi98kfe5ot
 gbio+H4BLncNJUlWGrg1iaL0I2NcepKD5sFiSjlyAPXdoI0jWZlpDC3rRw0U42MuI6Jf
 yRKoEnYCSKYilG022Kks5egbpcsJIjbWki3qsP/pqR8bRAfLyODJ2ux004Q9rpNS8EyV
 4BrvJtagBAppzJtZd28kTBpeFfil4NxzEbNY7unlUm3env7cOh1a6FfFtya4ciEJbL2q
 uJOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdDcgncfigsi6jTcLFQEf3piCid97qghEROb60sGpPVWmgQPHVYmLzF668q00PUJLPSPoHNpRmEF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVYvnRg0Sj/302CDdkvzKfoGC8xkVw2GdhNkK8921BJdt1Lvw7
 yAGDKUtqcDDQTq2rkthWmXyan7Bwfyr+a8HCWCb8dw5WWtulS3dcVOSnCXP3LRDsySnJqSTqg3g
 yPxR2SMf2SVPqdOm8ROKPfp+2fvKkmfOrSe6PUOz7cteURV1HBJH9mn+wuNVBoPFqQciQORE=
X-Gm-Gg: ASbGncuPbhPa+C7vMYJmFX5TmngY55zpAi96kD3ra4obAMf4D5xaHxu86evpzSJLgHz
 uNasPDsVlttKorm0m72KyprFCtPIWPtkm5XLseFO+lxpzEPszbhmUgp0p06p0lnzHvze8yZnNeF
 fsdxMgI9JNiYktfHLHzAkCM7M4J6HpZgrKkZcSR+QU1DI5dkC2SCe6fEekAa/uDWL9YZo/duB22
 jQja4mQDBfDQ90G1dxcwhzcOMNT+CGQY4SQa9hrsoGKUk3P2TYf8+HNDQLlQHrLh3H05q7LHBFB
 fpzBP5o7a3iCCk1lyEpQL7tfV1nEfviHA1nJWEBy9dQ3X4bxIfZaU9sR42XzVPjkn5fOexKDGGG
 jJ07n2UMimXHCzoJaXceGvoE1KAYnoCqU2ZLtTnvgFLfi8lA5gwUn
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id
 d75a77b69052e-4b0aed802cemr172661151cf.58.1754908409505; 
 Mon, 11 Aug 2025 03:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5+d1EPtwxEZN7NaQibr0TadKLirlbN/cpnuNlgXjLHPDePtrYQxufGwDmRoZ5/mmER8t8g==
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id
 d75a77b69052e-4b0aed802cemr172660611cf.58.1754908408908; 
 Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bddasm4246799e87.39.2025.08.11.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:33:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
Message-ID: <m4a5sw7ghzepzjh5rzxltyktmgqocaacbkulpbwsl2alqbqjhs@st5qillinrnb>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
X-Proofpoint-GUID: cmIeA1aWF_4aKgTw2OEAm3rCOLBUOEsZ
X-Proofpoint-ORIG-GUID: cmIeA1aWF_4aKgTw2OEAm3rCOLBUOEsZ
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c6fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX2s/CmvPNNKx2
 FcMrrDqpMmy3SQKwn4z7nGchB6wF3SzCXWGpwAMmZNevFKWaJ0jtpOMDPPj3kyut+J6xIxfOHdu
 mfNPr6dsDjhhGAvB1D8+ouBPeF1acRf6lD2H+LgKygetekMmogR1Iy4Y/KKk47P82wdug+yGzY/
 iWHVp8Fw0tGLColYRFCcJur02o2JBL0QhN5sl3Flcnt/ikLwr0D3yjMFZeAr5QKPrBM8yonWEvp
 ufxdu6bZRT2RDKM0giZo4LDP139rHMlsRfYxOZgKS1LNlkSRJkSIWMQN3UO13z3FXl7iux2o0uq
 SbScxjwvEMbOM7Mn++Rjm1nk3dekhmp0Px4HwC9b6uMg+53ToKioLJBib5i1H2ZQGLbPNN+GZTI
 gvrMF+gY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036
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

On Sun, Aug 10, 2025 at 06:57:27PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 ++++++++++++-------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
