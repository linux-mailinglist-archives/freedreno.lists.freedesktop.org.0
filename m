Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED66B54A0C
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 12:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96CB10EBFD;
	Fri, 12 Sep 2025 10:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWrtb5M8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C9210EBFD
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:39:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fJQx014005
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JZO37LOsBsf5QkQB3SdvehHO
 fE6O/aUfSqad1UHXEXY=; b=CWrtb5M8zWyJSZV0/SCddrssbyxp3WZ1WDxot9Vg
 96inzXhFYQOhvwakMdUZGf4q+RGMpVo7jrokQVN28Bd6Pj4++FlJOsPI/v6TIjYt
 y3VcRTNY/d+4FI8e/A0duerWbuBDAluaxBSNPVUTmSnoTFbcYkR0gX77Hig1Busq
 uEbHxm6i+l6yaBF38szdLXWwaBMKXxZDVslxqxwHRzVNzSFCpC/EluaZdWFETvcy
 R2yW+EYjq1d3sphNTXfe8e7Dyz8KGVc/W61OCSHI6h22VdHTifat51MXBQ8bJfJ+
 hNtxjJj5WrImWUPVWIrPcnogCkToZa/z9hLDmuLUy36HHw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphvx9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:39:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f31ef7dfso54867801cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 03:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757673582; x=1758278382;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZO37LOsBsf5QkQB3SdvehHOfE6O/aUfSqad1UHXEXY=;
 b=OH2WyVylCo6NzzBn7cnTGpsfuLfXaa/QQoHv7uFWMtpxsm8ze2gkVgTm8U0wConIPF
 DDgbpg6ZhK2xn+NR4a3BWmAgacigA4z8RPvAI+bj2motIzqE8eBHjwa05l/SUQpBG1vj
 hswAnu1++TyvI4/RGVkooHiZIxeY1veUZ60vfJpj0tvoCXHrVNePNGMPa2ntRIF2l81o
 7NQZjNFB0Vt+iMZg0IVszhgpteI9nFh4MpEoXqh6xT8Tc08rhkBCb6/OA75Wtev8B73w
 xX5oFsGYiNJWGjDFKUYPhnmDnWtETnbNiu3VoOiiYrL8A7NyPsf6CrjN/3jL8/zDoUSs
 3y2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS7+jbsr+kYlwlBeIShcfeTiiMw0XS7kHQL1zLLDKTaV2ORe6RoB6sl78k/erRozvQH4cYTlZZq40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJFtvFN/GoExRsKasO8qe3A1E6cLnXWECOgxOTlmOm6Xul01GL
 Gmo3pmtiOGD2toYSBgkvrfV45fk8uM9kTM4ISVhovy+58bfr86FLdzqULCoxQ/wV9Buy0hBdenN
 zfMiukKblXD2ik8+1f8ThBDZvUeF3qTijO41i9zSw8nvydaXQquTobALClC4HpjngEwHRUCE=
X-Gm-Gg: ASbGncuPh6BO3xfrs1VRf+0j/c8JXDNn38a4mHEaH1m18ywR4k21aPdVyiWape+xIK5
 HsP4I/enxT9vg0hg4Vihv+L7/TRjhOAogF5qQ0qQEVnDQy96xkmCL3zo7YzNE9hm52z+wLawyFc
 whwVRIw2XtX1YmvT/CpFcRq4kf/9+feqwbCaOYaiSmDbQlSe5yIC/sFKvOyVkDxbD3LB7NCM1v2
 Bzama9UcARVEULAHCJCm5WDtmHUvOpYVfFaEhVj4yqZLMxS/O3fhQ3sXfeVYP58nDtPQFKs05Co
 LUIUjjzcadMdWuoCSizKUmfub0OK+g4XtKTuTS0oLAqm/lmhASGMTCQ29g6gXQ7aEt88O/pqEAA
 2l3hoNZbrFqXGSWYIk4dxhDiQkDLppxPP0yX2eqKiKRI9tvutiNFV
X-Received: by 2002:a05:622a:590c:b0:4b3:4fa9:4cd2 with SMTP id
 d75a77b69052e-4b77cca8d4emr39186081cf.33.1757673581466; 
 Fri, 12 Sep 2025 03:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElx+sIo2TyNNDSZKhdIXfRdT6OrkK5agLSxJeNhZFAzJExqCsm6/N6pZpW9c9ZnhxyWSL7dw==
X-Received: by 2002:a05:622a:590c:b0:4b3:4fa9:4cd2 with SMTP id
 d75a77b69052e-4b77cca8d4emr39185691cf.33.1757673581028; 
 Fri, 12 Sep 2025 03:39:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e646135b0sm1042248e87.110.2025.09.12.03.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:39:40 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:39:38 +0300
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
Subject: Re: [PATCH v4 12/13] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
Message-ID: <4kajb4imv4mvpf4bdzoqfw7f4qoqxsu3ca4pbgsunhxnortfig@kmsqgsj547hi>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c3f86f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qgWfkWmIk_iXozLJbygA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nX7iYcd_ebf3OvwLylVVxkiGQlRxPgkz
X-Proofpoint-ORIG-GUID: nX7iYcd_ebf3OvwLylVVxkiGQlRxPgkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX9ErGjNvRqPdl
 cgqWFjw5Qyl14OY53bCsDt3aTgiwNf8642nnrzV5GosirBnx1v0lzKOSgzgLK9T1ANATWRNcrXv
 wC46XmVSlM0/V6dGQmOCEqtBRjhFSwOmmBsFPEdH0kwM1yua9lDvu4A2p+pY15qKpp+9HkiRGtG
 xbsaLrpfcSOORg0B2lLiMSwCdOXb3jwSzvOE/z4kda6obgAYFWmhm0WVbHxFfVJeKIcEaX8xhbN
 Pg+pMl6v5ceA5IgtY3rtrnMDnml8vxXt+59RCRFD98NzatAFlqHmDTmJR4kUwikfZKVzVqdnPqY
 RspCbbhUmuipEJU+huC2HYjF56nyOqPkKC0zvfh2wXBu80uSrb5hPJ4oZk/36D0kEA9/5CzbTBB
 G4Kj/xle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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

On Thu, Sep 11, 2025 at 10:55:09PM +0800, Xiangxu Yin wrote:
> Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
> their parsing from dp_panel to dp_link for better separation of concerns.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

I thought that you've split all DP patches...

> ---
>  drivers/gpu/drm/msm/dp/dp_link.c  | 63 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>  4 files changed, 76 insertions(+), 72 deletions(-)
> 
> @@ -1225,9 +1283,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
>  		return ERR_PTR(-ENOMEM);
>  
>  	link->aux   = aux;
> +	link->dev   = dev;

It is only used during parsing of DT data. There is no need to store it
inside the struct.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  	mutex_init(&link->psm_mutex);
>  	msm_dp_link = &link->msm_dp_link;
>  
> +	ret = msm_dp_link_parse_dt(msm_dp_link);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return msm_dp_link;
>  }

-- 
With best wishes
Dmitry
