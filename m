Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81116B54C99
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BED10EC34;
	Fri, 12 Sep 2025 12:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4qudoHJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332B210EC34
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:09:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fIbg015195
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AWecxXQ1HoSKQokJLzYb6tbb
 rzkT4uWaDcoy5VKKVeg=; b=N4qudoHJb3LgJAVQziaNCtZl0F7NfM5kABN0udgc
 AwnPkhRGctPPhNtrEqLj1TzlUOG7nqOcWGSmqBVNjTg6DCl2lMUA2s0tfzfC0MZc
 Fxi2T88hQ9TmuN2Ii1EiknR4CbDaDKab5CbHdp4w/UTqpA+DLbERlyEL6wN4Q68/
 9mBcuHp2OYC0JTRzDzirqGh0PLA2h1x8mt2KCFlWij0Wi3AQPDBYO0lKID6iXfw+
 BCDg27FiO+Fc+Uej1F+ZvbLM7+d8T92gEbNwOmwMQZ7uN2y8hE1PqR4BgFYIG/jP
 qf9YitCAwwqbtQ4uQqbX3SL1vs7PQMsE2V1rqc6ePsawUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapuua9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:09:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b302991816so37898911cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678960; x=1758283760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWecxXQ1HoSKQokJLzYb6tbbrzkT4uWaDcoy5VKKVeg=;
 b=pcx+wivfNy2AtWcX13h82GQZ4Zlbd03NpyJcT3+Irr2shqysYYPWUBDnVd/aViMZk+
 2cRNQ3NRyda/ssUryHUizeqrd8a00x6FQfdx4n8jJZBu97irObXbjYHsvNNY0fN9IHwI
 C+e6OxbzHrLY+R/hyMsj/xr+NGfDNy9IxFYC7d834+o8torBULQqB9mI1+Cx7FFjqPOe
 wnWyIu5HDuaW+C3MQmRHZNY0Jx0cD903sgB1kV2sXrudJFyNnBcKMvLlhgMn3hzkvRLE
 FDUnwOp6B+XLXI1fPdM7vWhgEaCgRN/GiWq8iz8BUxdXtaUl4tiox6WNgsuUUyykKMCx
 Wq5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrcBYKgv3QubWJP8ZlsRrPRD3UMyFliA/s+WiPPK4qsXc3ZoL1Yp0jbvvXrom841eOhXwZBTRrygY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGqTRwGpOUPjAQaDCTB6jRYzdC3F4I+4F6XPosoqDTlPD0pmcv
 2JshjzpSpitOaxNATqPZTUckoNkHcXYiO1En3ZhwfROLP5voau4UV8M9gkuXrrFKA1dJ74JWyvA
 y9pMkiO7nr4/m720K6OznfrP0TKr4Lt0vM9yvzlv44ZN5mTVRBtL4xspe93c1RRgnUOx4j9M=
X-Gm-Gg: ASbGncsxfGqmfWimy8oEVli0ylX6zyy+n8JIbAbEbANbkeLogIh4yf6h8PgIf9yR5kI
 98BhvZI+dRnjgyyPLmJigSXoxY0IkQuV8z2Vawy+xZ5vvT07pxWO7CGb+VCbXlgZYbRajk5UuVM
 LevWe1JRnlsM+/qPaYeziFj7M7/UiIY6kx9mZGzaMEr26lgyPXtDzaWmkHIEMe+P8zR2mRQMPbm
 FSPiIjp/qkaIkGRL8qi3Wu5xGrC6Tr1pK3E8zugb7B2rnBMdoffjQLlOpUvuuVG3Y4T2EcVDMnA
 nJkuqosWQj1Xzn+5/ZyhDbHBKuuUTvuWZk5cRgewJQcWBVbxdSMG2qluXRJpR/MUJktHHb/gKa0
 HDiK6vnu6R8h2Kq41B14QRfsSaeGXN25lsy1IMSZcR6of2IugiWVz
X-Received: by 2002:a05:622a:2b45:b0:4b3:12f7:8baa with SMTP id
 d75a77b69052e-4b77d044455mr32331131cf.51.1757678960384; 
 Fri, 12 Sep 2025 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBlHDLz23zA5O+/vEKCN91ortJnwiUYeDorqJurL/VJ4hd/jMETJMt2eSQJiBv4Cvs1e54jQ==
X-Received: by 2002:a05:622a:2b45:b0:4b3:12f7:8baa with SMTP id
 d75a77b69052e-4b77d044455mr32330571cf.51.1757678959880; 
 Fri, 12 Sep 2025 05:09:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-35062c8da78sm5874761fa.0.2025.09.12.05.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:09:19 -0700 (PDT)
Date: Fri, 12 Sep 2025 15:09:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
Message-ID: <q4dplt6fq3cneludcuhxevklaj6omeio3cjxw2owt4h3wistd6@arv23ri4cl75>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
 <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
 <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c40d71 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=h6lld2rfrDIzuLPEmGQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: L-57H6hoHQDc9hf0nJ51d0yRaaSGjOp_
X-Proofpoint-ORIG-GUID: L-57H6hoHQDc9hf0nJ51d0yRaaSGjOp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXx2crl377DrAB
 L7MWKQ5rnvyOX89DiC96JKX3LwjHguHDoK19xxW9YQMumIM55ibmxX0IZWpPQiFejbDehRenMuJ
 munNWmrdMfvSLgZfKWlsVUg6Latk1Qw5TVEIOj0IqG4fQk/7lQiOj1wr08DTrlq94a12GzSXYwS
 eMScrgUUGp/yVOmZBqdATIP48CaeXQ0hHP/SqcidBrRw6ArMueLBUH3VSLnoAlyfDraDQTOO9r8
 iTOjZbwCV5c9eIOJNJ1amSEWZwnDx6aZ8/0gtt0WWFs+PRptiY672JLsROTfxfUq0Jg1Ayx1/jQ
 A3rdN6xoU1raNjblmwz8tLQA6uRLRHIe1E58IY2xdzLTCaOStGKo++wkxTYgPV8c/TPldd3w9Pi
 Z/yKwzKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Fri, Sep 12, 2025 at 08:03:01PM +0800, Xiangxu Yin wrote:
> 
> On 9/12/2025 6:32 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
> >> Introduce mutual exclusion between USB and DP PHY modes to prevent
> >> simultaneous activation.
> > Describe the problem that you are trying to solve first.
> 
> 
> Ok.
> 
> 
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
> >>  	return 0;
> >>  }
> >>  
> >> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
> > mutex has a very well defined use case - a sleeping lock. Please find
> > some ofther name.
> 
> 
> Then how about 'qmp_check_exclude_phy'?


qmp_usbc_check_phy_status()?

> 
> 
> >> +{
> >> +	if ((is_dp && qmp->usb_init_count) ||
> >> +	    (!is_dp && qmp->dp_init_count)) {
> >> +		dev_err(qmp->dev,
> >> +			"PHY is configured for %s, can not enable %s\n",
> >> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
> >> +		return -EBUSY;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int qmp_usbc_usb_enable(struct phy *phy)
> >>  {
> >>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);

-- 
With best wishes
Dmitry
